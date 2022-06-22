import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlik/view/splash/cubit/splash_cubit.dart';
import 'package:kunlik/view/splash/state/splash_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // @override
  // void initState() {
  //   super.initState();
  //   _splash(context);
  // }

  // _splash(context) async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   Navigator.pushReplacementNamed(context, '/sign_in');
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: Scaffold(
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {},
          builder: (context, state) => Center(
            child: Image.asset('assets/images/Logo.png'),
          ),
        ),
      ),
    );
  }
}
