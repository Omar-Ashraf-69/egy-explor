import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        height: 62,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsData.manPic,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Super Office',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Sun, 12:05pm',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 22.0),
                      child: Text(
                        'Get 50% offer on your next order sdkkdvkksjajkjk',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   padding: EdgeInsets.all(5),
    //   decoration: BoxDecoration(color: Colors.grey.shade300),
    //   height: 80,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Image(image: AssetImage("assets/images/man.png")),
    //       SizedBox(
    //         width: 10,
    //       ),
    //       Expanded(
    //         child: Column(
    //           //runAlignment: WrapAlignment.spaceBetween,
    //           //alignment: WrapAlignment.spaceBetween,
    //           //crossAxisAlignment: WrapCrossAlignment.start,
    //           //direction: Axis.vertical,
    //           //crossAxisAlignment: CrossAxisAlignment.stretch,
    //           //mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Container(
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 //spacing: 120,
    //                 //alignment: WrapAlignment.spaceBetween,
    //                 //runAlignment: WrapAlignment.spaceBetween,
    //                 //crossAxisAlignment: WrapCrossAlignment.center,
    //                 children: [
    //                   Flexible(
    //                     child: Text(
    //                       "Super Office",
    //                       style: TextStyle(fontSize: 20),
    //                       overflow: TextOverflow.ellipsis,
    //                     ),
    //                   ),
    //                   Flexible(
    //                       child: Text(
    //                     "03/02/2019",
    //                     overflow: TextOverflow.ellipsis,
    //                   ))
    //                 ],
    //               ),
    //             ),
    //             Flexible(
    //               child: Row(
    //                 children: [
    //                   Text("Get 50% offer"),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
