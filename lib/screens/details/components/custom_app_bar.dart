import 'package:flutter/material.dart';

import 'package:hellowork/constants.dart';

import '../../../size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;

  const CustomAppBar({Key? key, required this.rating}) : super(key: key);

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  //Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            SizedBox(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                )
                //child: const Icon(Icons.arrow_back_ios)),
                ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.favorite_border), //Icons.favorite
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  /* const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellow,
                  ) */
                  //SvgPicture.asset("assets/icons/menu.svg"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
