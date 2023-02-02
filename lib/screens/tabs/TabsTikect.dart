import 'package:flutter/material.dart';
import 'package:hellowork/constants.dart';
import 'package:hellowork/size_config.dart';

class ApptikeTabs extends StatelessWidget {
  final String firstabs;
  final String secondtabs;
  const ApptikeTabs({super.key, required this.firstabs, required this.secondtabs});
  @override
  Widget build(BuildContext context) {
    final size = SizeConfig.getSize(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.getHeigth(50)), color: Color(0xFFF4F6FD)),
        child: Row(
          children: [
            Container(
              //width: size.width * .44,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7), horizontal: 30),
              decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.horizontal(left: Radius.circular(SizeConfig.getHeigth(7)))),
              child: Center(child: Text(firstabs)),
            ),
            Container(
              //width: size.width * .44,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7), horizontal: 30),
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.horizontal(right: Radius.circular(SizeConfig.getHeigth(7)))),
              child: Center(child: Text(secondtabs)),
            ),
            Container(
              //width: size.width * .44,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7), horizontal: 30),
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.horizontal(right: Radius.circular(SizeConfig.getHeigth(7)))),
              child: Center(child: Text(secondtabs)),
            ),
            Container(
              //width: size.width * .44,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7), horizontal: 30),
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.horizontal(right: Radius.circular(SizeConfig.getHeigth(7)))),
              child: Center(child: Text(secondtabs)),
            ),
          ],
        ),
      ),
    );
  }
}

// return FittedBox(
//       child: Container(
//         padding: const EdgeInsets.all(3.5),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.getHeigth(50)), color: Color(0xFFF4F6FD)),
//         child: Row(
//           children: [
//             Container(
//               width: size.width * .44,
//               padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7)),
//               decoration: BoxDecoration(color: kWhite, borderRadius: BorderRadius.horizontal(left: Radius.circular(SizeConfig.getHeigth(7)))),
//               child: Center(child: Text(firstabs)),
//             ),
//             Container(
//               width: size.width * .44,
//               padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7)),
//               decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.horizontal(right: Radius.circular(SizeConfig.getHeigth(7)))),
//               child: Center(child: Text(secondtabs)),
//             ),
//             Container(
//               width: size.width * .44,
//               padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7)),
//               decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.horizontal(right: Radius.circular(SizeConfig.getHeigth(7)))),
//               child: Center(child: Text(secondtabs)),
//             ),
//             Container(
//               width: size.width * .44,
//               padding: EdgeInsets.symmetric(vertical: SizeConfig.getHeigth(7)),
//               decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.horizontal(right: Radius.circular(SizeConfig.getHeigth(7)))),
//               child: Center(child: Text(secondtabs)),
//             ),
//           ],
//         ),
//       ),
//     );