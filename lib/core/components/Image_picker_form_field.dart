import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/components/sheets/edit_image_sheet.dart';
import 'package:flojics_task/core/helper/extensions.dart';
import 'package:flojics_task/core/service/image_picker_service.dart';
import 'package:flojics_task/core/theme/colors.dart';
import 'package:flojics_task/core/theme/dimensions.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePickerFormField extends ConsumerWidget {

  const ImagePickerFormField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(ImagePickerService.provider);
    final isImageSelected = imageState.isSuccess;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            EditImageSheet.show(context);
          },
          child: imageState.when(
            data: (imageFile) => Center(
              child: Container(
                height: context.heightR(0.2),
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kRadius12),
                  image: DecorationImage(
                    image: FileImage(
                      imageFile,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: AppColors.orange,
              ),
            ),
            error: (_) => const _PickImage(),
            initial: () => const _PickImage(),
          ),
        ),
        if (!isImageSelected)
          Text(
            LocaleKeys.common_required.tr(),
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12.0,
            ),
          ),
      ],
    );
  }
}

class _PickImage extends StatelessWidget {
  const _PickImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightR(0.25),
      width: context.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius12),
        ),
        color: AppColors.halfWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image, size: 80.h),
            Text(
              LocaleKeys.editImageProfile_chooseAPhotoFromTheGallery.tr(),
              style: TextStyles.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
