import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flojics_task/core/service/image_picker_service.dart';
import 'package:flojics_task/core/theme/text_styles.dart';
import 'package:flojics_task/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart' as cap;
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditImageSheet extends ConsumerWidget {
  const EditImageSheet({
    super.key,
  });

  const EditImageSheet._();

  static Future<void> show(
      BuildContext context,
      ) =>
      cap.showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return const EditImageSheet._();
        },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageController = ref.watch(ImagePickerService.provider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              imageController.pickImage(ImageSource.camera);
              context.router.pop();
            },
            child: Text(
              LocaleKeys.editImageProfile_takeAPicture.tr(),
              style: TextStyles.displaySmall,
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              imageController.pickImage(ImageSource.gallery);
              context.router.pop();
            },
            child: Text(
              LocaleKeys.editImageProfile_chooseAPhotoFromTheGallery.tr(),
              style: TextStyles.displaySmall,
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => context.popRoute(),
          child: Text(
            LocaleKeys.filter_cancel.tr(),
            style: TextStyles.displaySmall,
          ),
        ),
      ),
    );
  }
}
