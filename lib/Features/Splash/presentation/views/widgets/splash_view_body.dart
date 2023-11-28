import 'package:bookly_app/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
late AnimationController animationController;
late Animation<Offset> slidingAnimation;
class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  @override
  void initState() {
    initSlidingAnmation();
    navigateToHome();

     super.initState();
  }

 
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4,), 
        SlidingText(slidingAnimation: slidingAnimation,)
      ],
    );
  }
  void initSlidingAnmation() {
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 1));
    slidingAnimation=Tween<Offset>(begin: const Offset(0, 3),end: Offset.zero).animate(animationController);
        animationController.forward();

  }
   void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),(){
      GoRouter.of(context).push(AppRouter.kHomeView);
    
    });
  }

}

