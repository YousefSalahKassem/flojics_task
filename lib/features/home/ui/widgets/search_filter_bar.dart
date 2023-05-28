import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/custom_text_field.dart';
import 'package:flojics_task/core/components/sheets/filter_sheet.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFilterBar extends StatefulWidget {
  const SearchFilterBar({super.key});

  @override
  State<SearchFilterBar> createState() => _SearchFilterBarState();
}

class _SearchFilterBarState extends State<SearchFilterBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45.h,
              child: CustomTextField(
                enable: false,
                hintText: LocaleKeys.home_search.tr(),
                prefixIcon: Icons.search,
                borderRadius: 10.r,
                borderColor: Colors.transparent,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              FilterSheet.show(context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
