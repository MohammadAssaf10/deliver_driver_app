import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_dialogs.dart';

class SelectImageContainer extends StatelessWidget {
  final String title;
  final void Function(ImageSource) onPress;

  const SelectImageContainer({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageSourceDialog(context, onPress);
      },
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorsManager.grey,
          ),
        ),
        child: Text(
          title,
          style: TextStyles.font15DarkGreyRegular,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
