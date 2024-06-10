import 'package:cenem/view/custom%20componant/custom_button.dart';
import 'package:cenem/view/intro/components/social_media_coloumn.dart';
import 'package:cenem/view/main/components/drawer/contact_icons.dart';
import 'package:cenem/view/main/components/drawer/socialmediaRow.dart';
import 'package:cenem/view/onbonding/sign_dialog.dart';

import 'package:cenem/view/onbonding/sign_in_dialog.dart';
import 'package:cenem/view/onbonding/sign_page.dart';
import 'package:cenem/view/onbonding/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:cenem/view%20model/responsive.dart';
import 'package:cenem/view/intro/components/side_menu_button.dart';
import 'package:get/get.dart';

import '../../../res/constants.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          if (Responsive.isExtraLargeScreen(context) ||
              Responsive.isDesktop(context) ||
              !Responsive.isTablet(context))
            const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: CustomIconRow()),
          const Spacer(),
          SizedBox(
            width: !Responsive.isDesktop(context)
                ? MediaQuery.sizeOf(context).width * 0.4
                : 150,
            child: CustomButton(
              onTap: () {
                authController.setSignUp(false); // Set isSignUp to false
                if (Responsive.isLargeMobile(context) ||
                    Responsive.isMobile(context)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(sign: false),
                    ),
                  );
                } else {
                  showSignUpDialog(
                    context,
                    onValue: (_) {},
                  );
                }
              },
              buttonText: 'تسجيل دخول',
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: !Responsive.isDesktop(context)
                ? MediaQuery.sizeOf(context).width * 0.4
                : 150,
            child: CustomButton(
              onTap: () {
                authController.setSignUp(true);

                if (Responsive.isLargeMobile(context) ||
                    Responsive.isMobile(context)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(sign: true),
                    ),
                  );
                } else {
                  showSignUpDialog(
                    context,
                    onValue: (_) {},
                  );
                }
              },
              buttonText: 'انشاء حساب',
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
    // if (Responsive.isLargeMobile(context)) MenuButton(),
          // const Spacer(
          //   flex: 2,
          // ),
          // if (!Responsive.isLargeMobile(context)) const NavigationButtonList(),
          // const Spacer(
          //   flex: 2,
          // ),