import 'package:exchange/core/constants/color_const.dart';
import 'package:exchange/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_click/on_click.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.he,
      width: context.he,
      color: ColorConst.kPrimaryColor,
      child: Stack(
        children: [
          Positioned(
            top: context.he * 0.051,
            left: 0.0,
            right: 0.0,
            child: Image.asset('assets/images/circle.png'),
          ),
          Positioned(
            top: context.he * 0.101,
            left: context.he * 0.011,
            right: context.he * 0.017,
            bottom: context.he * 0.381,
            child: Image.asset('assets/images/splashscreen.png'),
          ),
          Positioned(
            top: context.he * 0.637,
            left: context.he * 0.025,
            right: context.he * 0.102,
            bottom: context.he * 0.219,
            child: Text(
              'Easy Way to Invest in Crypto',
              style: TextStyle(
                  color: ColorConst.whitetextColor,
                  decoration: TextDecoration.none,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: context.he * 0.757,
            left: context.he * 0.025,
            right: context.he * 0.023,
            bottom: context.he * 0.159,
            child: Text(
              'A new way to manage and trade all your crypto easily and fastest in the market',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: ColorConst.whitetextColor.withOpacity(0.7),
                  fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            top: context.he * 0.849,
            right: 0.023,
            left: context.he * 0.309,
            bottom: context.he * 0.057,
            child: CircleAvatar(
              backgroundColor: ColorConst.whitetextColor,
              child: SvgPicture.asset('assets/svg/splashicon.svg'),
            ).onClick(() {
              Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
            })
          ),
        ],
      ),
    );
  }
}
