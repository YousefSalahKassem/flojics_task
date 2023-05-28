import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/Image_picker_form_field.dart';
import 'package:flojics_task/core/components/app_label.dart';
import 'package:flojics_task/core/components/custom_button.dart';
import 'package:flojics_task/core/components/custom_text_field.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/helper/ui/ui_helpers.dart';
import 'package:flojics_task/core/helper/validations.dart';
import 'package:flojics_task/core/service/image_picker_service.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  const AddProductScreen({super.key});

  @override
  ConsumerState<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: Text(
          LocaleKeys.admin_add.tr(),
          style: TextStyles.headlineLarge.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightGrey,
        automaticallyImplyLeading: false,
        elevation: 2,
      ),
      body: SafeArea(
        bottom: false,
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalSize16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.verticalSpace,
                        const ImagePickerFormField(),
                        24.verticalSpace,
                        AppLabel(label: LocaleKeys.addProduct_title.tr()),
                        CustomTextField(
                          hintText: LocaleKeys.addProduct_title.tr(),
                          borderRadius: 10.r,
                          borderColor: Colors.transparent,
                          validator: (value) =>
                              value!.validate([validateRequired]),
                        ),
                        20.verticalSpace,
                        AppLabel(label: LocaleKeys.addProduct_price.tr()),
                        CustomTextField(
                          hintText: LocaleKeys.addProduct_price.tr(),
                          borderRadius: 10.r,
                          inputType: TextInputType.number,
                          borderColor: Colors.transparent,
                          validator: (value) => value!.validate(
                            [validateRequired, validateNumbersOnly],
                          ),
                        ),
                        20.verticalSpace,
                        AppLabel(label: LocaleKeys.addProduct_category.tr()),
                        CustomTextField(
                          hintText: LocaleKeys.addProduct_category.tr(),
                          borderRadius: 10.r,
                          borderColor: Colors.transparent,
                          validator: (value) =>
                              value!.validate([validateRequired]),
                        ),
                        20.verticalSpace,
                        AppLabel(label: LocaleKeys.addProduct_description.tr()),
                        CustomTextField(
                          hintText: LocaleKeys.addProduct_description.tr(),
                          borderRadius: 10.r,
                          maxLines: 5,
                          maxLength: 300,
                          borderColor: Colors.transparent,
                          validator: (value) =>
                              value!.validate([validateRequired]),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kVerticalSize12),
                  width: context.width,
                  color: AppColors.lightGrey,
                  child: CustomButton(
                    text: LocaleKeys.addProduct_confirm.tr(),
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          ref.watch(ImagePickerService.provider).isSuccess) {
                        formKey.currentState!.save();
                        context.loaderOverlay.show();
                        Future.delayed(const Duration(seconds: 3), () {
                          context.loaderOverlay.hide();
                          UiHelpers.showNotification(LocaleKeys.alerts_add.tr());
                          context.popRoute();
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
