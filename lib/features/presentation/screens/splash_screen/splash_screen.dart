import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/splash_bloc.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/splash_event.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/splash_state.dart';
import 'package:mini_wheelz_user/features/presentation/screens/auth_warper/auth_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start splash sequence when widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(InitializeSplashEvent());
    });

    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigateState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const AuthWrapper()),
          );
        }
      },
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/Mini Wheels.gif',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.sports_motorsports,
                          size: 100,
                          color: Colors.white,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
