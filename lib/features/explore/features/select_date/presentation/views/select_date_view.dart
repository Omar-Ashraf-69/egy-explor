import 'package:egy_exlpor/core/constants/color_palatte.dart';
import 'package:egy_exlpor/core/constants/dimension_constants.dart';
import 'package:egy_exlpor/features/explore/features/hotel/presentation/views/widgets/app_bar_container.dart';
import 'package:egy_exlpor/features/explore/features/select_date/presentation/views/widgets/item_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// ignore: must_be_immutable
class SelectDateView extends StatelessWidget {
  SelectDateView({super.key});
  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Select date',
      paddingContent: const EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            data: 'Select',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            data: 'Cancel',
            color: ColorPalette.primaryColor.withOpacity(0.1),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
