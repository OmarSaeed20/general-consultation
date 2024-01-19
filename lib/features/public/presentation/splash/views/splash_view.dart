import '../controllers/splash_controller.dart';
import '/index.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                Kimage.splash,
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
              Image.asset(Kimage.logoPng),
            ],
          ),
        );
      },
    );
  }
}
