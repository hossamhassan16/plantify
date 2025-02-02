import 'package:flutter/material.dart';
import 'package:plantifi/authentication/login_view.dart';
import 'package:plantifi/authentication/signup_view.dart';
import 'package:plantifi/components/custombutton.dart';
import 'package:plantifi/components/dotsindicator.dart';
import 'package:plantifi/components/signup_login.dart';
import 'package:plantifi/onboard/onboard_screen.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnboardScreen(
            pageController: pageController,
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 220,
            child: Dotsindicator(
              dotIndex: pageController!.hasClients ? pageController?.page : 0,
            ),
          ),
          Visibility(
            visible:
                pageController!.hasClients == true && pageController?.page == 2
                    ? false
                    : true,
            child: const Positioned(
              top: 60,
              right: 20,
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          pageController!.hasClients == true &&
                  pageController?.page != null &&
                  pageController!.page! <= 1
              ? Positioned(
                  bottom: 120,
                  left: 0,
                  right: 0,
                  child: Custombutton(
                      onTap: () {
                        if (pageController!.page! < 2) {
                          pageController?.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else {
                          print("");
                        }
                      },
                      text: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                        color: Colors.white,
                      )),
                )
              : Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Sign(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignupView();
                          }));
                        },
                        text: "Sign Up",
                      ),
                      Text("Already have an account?"),
                      Sign(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginView();
                          }));
                        },
                        text: "Log in",
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
