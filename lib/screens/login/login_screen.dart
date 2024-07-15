import 'package:datn_trung/app/app_routers.dart';
import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/widget/simple_button.dart';
import 'package:datn_trung/widget/simple_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logoEV,
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Login to your account",
                    style: AppFonts.quicksand700(
                      24,
                      AppColors.kPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SimpleInput(
                          titleInput: "Email",
                          labelText: "Enter your email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SimpleInput(
                          titleInput: "Password",
                          labelText: "Enter your password",
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SimpleButton(
                          titleButton: "Log in",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRouters.homeScreen,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t have an account? ",
                          style: AppFonts.quicksandMedium500(
                            16,
                            const Color(0xFF212121).withOpacity(0.6),
                          ),
                        ),
                        TextSpan(
                          text: "Create account",
                          style: AppFonts.quicksandMedium500(
                            16,
                            AppColors.kPrimary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
