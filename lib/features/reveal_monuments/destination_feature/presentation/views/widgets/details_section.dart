import 'package:egy_exlpor/core/managers/app_them_cubit/app_them_cubit.dart';
import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:egy_exlpor/core/widgets/inapp_webview.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/about_destination_part.dart';
import 'package:egy_exlpor/features/reveal_monuments/destination_feature/presentation/views/widgets/destination_basic_info_widget.dart';
import 'package:egy_exlpor/features/reveal_monuments/presentation/views/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is ImageFullyRecognized) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                color: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
                    ? kWhiteColor
                    : null,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DestinationBasicInfoWidget(
                      title: state.title,
                      location: BlocProvider.of<ImageCubit>(context).location,
                    ),
                    const SizedBox(height: 14),
                    const AboutDestinationPart(),
                    const SizedBox(height: 14),
                    CustomButtonWidget(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomInAppWebView(
                                url:
                                    'https://www.google.com/search?q=${state.title}&hl=${Localizations.localeOf(context).languageCode}',
                              ),
                            ));
                      },
                      label: Text(
                        "Read More",
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: kWhiteColor,
                        ),
                      ),
                      buttonColor: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is ImageRecognized) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.sizeOf(context).height - 450,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                color: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
                    ? kWhiteColor
                    : null,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DestinationBasicInfoWidget(
                      title: BlocProvider.of<ImageCubit>(context).title,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height - 450 - 120,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is ImageLocationRecognized) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.sizeOf(context).height - 450,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                color: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
                    ? kWhiteColor
                    : null,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DestinationBasicInfoWidget(
                      title: BlocProvider.of<ImageCubit>(context).title,
                      location: BlocProvider.of<ImageCubit>(context).location,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height - 450 - 120,
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.sizeOf(context).height - 450,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
              color: !BlocProvider.of<ThemeCubit>(context).getIsDarkTheme
                  ? kWhiteColor
                  : null,
            ),
            child: const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
