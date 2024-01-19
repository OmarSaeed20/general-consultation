enum RequestState {
  none,
  
  loadMore,
  loadingRef,
  loading,

  success,
  error,
  offLineFailure,
  empty,
}
/* 
enum LoagdingType { loading, loadMore } */

enum Type { email, password, passwordConfirm, username, phone, text }

extension AppStatusX on RequestState {
  bool get isNon => this == RequestState.none;
  bool get isSuccess => this == RequestState.success;
  bool get isError => this == RequestState.error;
  bool get isLoading => this == RequestState.loading;
  bool get isLoadingRef => this == RequestState.loadingRef;
  bool get isLoadingMore => this == RequestState.loadMore;
  bool get isEmpty => this == RequestState.empty;
  bool get isOffLine => this == RequestState.offLineFailure;
}

enum LanguageType {
  ar,
  en,
}
