import 'package:egy_exlpor/core/utils/colors.dart';
import 'package:egy_exlpor/core/utils/custom_appBar.dart';
import 'package:egy_exlpor/core/utils/custom_button_widget.dart';
import 'package:egy_exlpor/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// ignore: must_be_immutable
class SelectDateView extends StatelessWidget {
  SelectDateView({super.key});
  static const String routeName = '/select_date_view';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Select date'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: kPrimaryColor,
              startRangeSelectionColor: kPrimaryColor,
              endRangeSelectionColor: kPrimaryColor,
              rangeSelectionColor: kPrimaryColor.withOpacity(0.25),
              todayHighlightColor: kPrimaryColor,
              toggleDaySelection: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtonWidget(
              label: Text(
                "Select",
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
              onTap: () {
                if (rangeStartDate != null && rangeEndDate != null) {
                  Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a valid data"),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtonWidget(
              label: Text(
                "Cancel",
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
              buttonColor: kPrimaryRedColor,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
    // return AppBarContainer(
    //   titleString: 'Select date',
    //   paddingContent: const EdgeInsets.all(kMediumPadding),
    //   child: Column(
    //     children: [
    //       const SizedBox(
    //         height: kMediumPadding,
    //       ),
    //       SfDateRangePicker(
    //         view: DateRangePickerView.month,
    //         selectionMode: DateRangePickerSelectionMode.range,
    //         monthViewSettings:
    //             const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
    //         selectionColor: ColorPalette.yellowColor,
    //         startRangeSelectionColor: ColorPalette.yellowColor,
    //         endRangeSelectionColor: ColorPalette.yellowColor,
    //         rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
    //         todayHighlightColor: ColorPalette.yellowColor,
    //         toggleDaySelection: true,
    //         onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
    //           if (args.value is PickerDateRange) {
    //             rangeStartDate = args.value.startDate;
    //             rangeEndDate = args.value.endDate;
    //           }
    //         },
    //       ),
    //       const SizedBox(
    //         height: kDefaultPadding,
    //       ),
    //       ItemButtonWidget(
    //         data: 'Select',
    //         onTap: () {
    //           Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
    //         },
    //       ),
    //       const SizedBox(
    //         height: kDefaultPadding,
    //       ),
    //       ItemButtonWidget(
    //         data: 'Cancel',
    //         color: ColorPalette.primaryColor.withOpacity(0.1),
    //         onTap: () {
    //           Navigator.of(context).pop();
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
