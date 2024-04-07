import 'package:egy_exlpor/core/constants/textstyle_ext.dart';
import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    super.key,
    required this.child,
    this.title,
    this.titleString,
    this.subTitleString,
    this.implementTraling = false,
    this.implementLeading = true,
    this.paddingContent = const EdgeInsets.symmetric(
      horizontal: 24.0,
    ),
  })  : assert(title != null || titleString != null, 'title or titleString can\'t be null');

  final Widget child;
  final Widget? title;
  final String? titleString;
  final String? subTitleString;
  final bool implementTraling;
  final bool implementLeading;
  final EdgeInsets? paddingContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              title: title ??
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (implementLeading)
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Icon(
                                FontAwesomeIcons.arrowLeft,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  titleString ?? '',
                                  style: TextStyles.defaultStyle.fontHeader.whiteTextColor.bold,
                                ),
                                if (subTitleString != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: Text(
                                      subTitleString!,
                                      style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (implementTraling)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              FontAwesomeIcons.bars,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff8F67E8), Color(0xff6357CC)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetsData.icoOvalTop,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetsData.icoOvalBottom,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: backgroundScaffoldColor,
            ),
          ),
          Container(
            margin:const  EdgeInsets.only(top: 156),
            padding: paddingContent,
            child: child,
          ),
        ],
      ),
    );
  }
}
