import 'package:flutter/material.dart';


class AgreeToTermsText extends StatelessWidget {
  const AgreeToTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              'By Signing in, you agree to our ',
              overflow: TextOverflow.visible,
              style: TextStyle(
                // color: appColor.kLightGrayColor,
                // fontFamily: appColor.kMedium,
                  fontSize: 15,
                  fontWeight: FontWeight.w500

              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.3,
            child: InkWell(
              onTap: (){
                // context.navigateTo(routeName: Routes.termAndConditionViewRoute);
              },
              child: Text(
                'terms & conditions',
                style: TextStyle(
                  // decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    // color: AppColors.primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
