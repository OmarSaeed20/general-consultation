import 'package:general_consultation/index.dart';
import 'package:nb_utils/nb_utils.dart';

abstract class FilterVendorController extends GetxController {
  Future<void> getCountry();
  Future<void> getCities();
  Future<void> getCategories();
  Future<void> getSupCategories();
  void resetFilter();
  void setFilter();

  setCountry({required CountryData country});
  setCitiy({required CountryData citiyId});
  setCategory({required int categoryId});
  setSupCategory({required int supCategoryId});
  setYearsOfExperience({required String yearsOfExperience});
  setVerifyAccount({required String verifyAccount});
  setVendorRate({required double rate});
}

class FilterVendorControllerImp extends FilterVendorController {
  FilterVendorControllerImp({
    required this.supCategoriesUseCase,
    required this.categoriesUseCase,
    required this.cityByIdUseCase,
    required this.countryUseCase,
  });

  static FilterVendorControllerImp get to =>
      Get.find<FilterVendorControllerImp>();

  final GetSupCategoriesUseCase supCategoriesUseCase;
  final GetAllCategoriesUseCase categoriesUseCase;
  final GetCityByIdUseCase cityByIdUseCase;
  final GetCountryUseCase countryUseCase;

  final Rx<FilterVendorState> state = FilterVendorState(
    // categories: UserServiceImp.to.categories.value,
    categoryId: Get.arguments["categories_id"],
  ).obs;

  final List<String> moreOptions = [
    Kstrings.viewProfile.tr,
    Kstrings.requestConsultation.tr,
    Kstrings.hideAds.tr,
    // "تشغيل الاشعارات لهذة المنشورات ",
  ];

  @override
  Future<void> getCategories() async {
    state(
      state.value.copyWith(categories: UserServiceImp.to.categories.value),
    );
    if (state.value.categories.isEmpty) {
      //debugPrint(
      // "categories  >>>>>>>>>>>>> is ${state.value.categories.length}")
      state(state.value.copyWith(rx: RequestState.loading));
      final ApiResult<CategoriesModel> result = await categoriesUseCase();
      result.when(
        success: (data) {
          state(
            state.value
                .copyWith(categories: data.data!, rx: RequestState.success),
          );
        },
        failure: (e) {
          state(state.value.copyWith(rx: handleRxError(e)));
        },
      );
    }
  }

  @override
  Future<void> getSupCategories() async {
    int catId = state.value.categoryId!;
    state(state.value.copyWith(rxSup: RequestState.loading));
    final ApiResult<SubCategoryModel> result =
        await supCategoriesUseCase(catId);
    result.when(
      success: (data) {
        state(
          state.value
              .copyWith(supCategories: data.data, rxSup: RequestState.success),
        );
        UserServiceImp.to.supCategories.value = data.data!;
      },
      failure: (e) {
        state(state.value.copyWith(rxSup: handleRxError(e)));
      },
    );
  }

  @override
  Future<void> getCities() async {
    state(
      state.value.copyWith(
        rxCitiy: RequestState.loading,
        seclectedCitiy: [],
        citiesIds: [],
        cities: [],
      ),
    );
    ApiResult<CountryModel> result = await cityByIdUseCase(
      IdOnlyParameter(id: state.value.seclectedCountry!.id),
    );
    result.when(
      success: (data) {
        List<CountryData> res = [];
        for (CountryData element in data.data!) {
          if (element.isActive == true) res.add(element);
        }
        state(
          state.value.copyWith(cities: res, rxCitiy: RequestState.success),
        );
      },
      failure: (e) {
        state(state.value.copyWith(rxCitiy: handleRxError(e)));
      },
    );
  }

  @override
  Future<void> getCountry() async {
    state(state.value.copyWith(
      rx: RequestState.loading,
      citiesIds: const [],
      seclectedCitiy: const [],
    ));
    final ApiResult<CountryModel> result = await countryUseCase();
    result.when(
      success: (data) {
        List<CountryData> res = [];
        for (CountryData element in data.data!) {
          if (element.isActive == true) res.add(element);
        }
        state(state.value.copyWith(countries: res, rx: RequestState.success));
      },
      failure: (e) {
        state(state.value.copyWith(rx: handleRxError(e)));
      },
    );
  }

  @override
  setFilter() => Get.back(
        result: FilterVendorParameter(
          categoryId: state.value.categoryId,
          subCtegoriesIds: state.value.subCtegoriesIds,
          countryId: state.value.seclectedCountry?.id,
          citiesIds: state.value.citiesIds,
          verifyAccount: state.value.verifyAccount,
          rate: state.value.rate?.toStringAsFixed(0).toInt(),
          yearsOfExperience: state.value.yearsOfExper == "undefined"
              ? null
              : state.value.yearsOfExper,
        ),
      );

  @override
  resetFilter() => state(
        state.value.copyWith(
          categoryId: Get.arguments["categories_id"],
          // subCtegoriesIds: const [],
          seclectedCountry: null,
          citiesIds: const [],
          seclectedCitiy: const [],
          // cities: const [],
          verifyAccount: "",
          rate: 0.0,
          yearsOfExper: "",
        ),
      );

  @override
  setCategory({required int categoryId}) {
    state(state.value.copyWith(categoryId: categoryId));
    getSupCategories();
  }

  @override
  setSupCategory({required int supCategoryId}) {
    List<int> sups = state.value.subCtegoriesIds.toList();
    if (sups.contains(supCategoryId)) {
      sups.remove(supCategoryId);
    } else {
      sups.add(supCategoryId);
    }
    state(state.value.copyWith(subCtegoriesIds: sups));
  }

  @override
  setYearsOfExperience({required String yearsOfExperience}) =>
      state(state.value.copyWith(yearsOfExper: yearsOfExperience));
  @override
  setVerifyAccount({required String verifyAccount}) =>
      state(state.value.copyWith(verifyAccount: verifyAccount));

  @override
  setVendorRate({required double rate}) =>
      state(state.value.copyWith(rate: rate));

  @override
  setCountry({required CountryData country}) {
    state(state.value.copyWith(seclectedCountry: country));
    getCities();
  }

  @override
  setCitiy({required CountryData citiyId}) {
    List<int> res = state.value.citiesIds.toList();
    List<CountryData> resData = state.value.seclectedCitiy.toList();

    if (res.contains(citiyId.id)) {
      res.remove(citiyId.id);
      resData.remove(citiyId);
    } else {
      resData.add(citiyId);
      res.add(citiyId.id);
    }
    state(state.value.copyWith(citiesIds: res, seclectedCitiy: resData));
  }

  @override
  void onInit() {
    getCountry();
    getCategories();
    getSupCategories();
    super.onInit();
  }
}
