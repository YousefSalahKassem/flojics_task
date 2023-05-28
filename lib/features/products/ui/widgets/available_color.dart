part of '../screens/product_details.dart';

class _AvailableColorWidget extends StatefulWidget {
  @override
  _AvailableColorWidgetState createState() => _AvailableColorWidgetState();
}

class _AvailableColorWidgetState extends State<_AvailableColorWidget> {
  int selectedIndex = 0; // Track the selected color index

  void selectColor(int index) {
    setState(() {
      selectedIndex = index; // Update the selected color index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.productDetails_color.tr(),
          style: TextStyles.headlineMedium,
        ),
        8.verticalSpace,
        Row(
          children: [
            _ColorWidget(
              color: AppColors.yellowColor,
              isSelected: selectedIndex == 0,
              onTap: () => selectColor(0),
            ),
            25.horizontalSpace,
            _ColorWidget(
              color: AppColors.lightBlue,
              isSelected: selectedIndex == 1,
              onTap: () => selectColor(1),
            ),
            25.horizontalSpace,
            _ColorWidget(
              color: AppColors.black,
              isSelected: selectedIndex == 2,
              onTap: () => selectColor(2),
            ),
            25.horizontalSpace,
            _ColorWidget(
              color: AppColors.red,
              isSelected: selectedIndex == 3,
              onTap: () => selectColor(3),
            ),
            25.horizontalSpace,
            _ColorWidget(
              color: AppColors.skyBlue,
              isSelected: selectedIndex == 4,
              onTap: () => selectColor(4),
            ),
          ],
        ),
      ],
    );
  }
}

class _ColorWidget extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorWidget({
    required this.color,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color.withAlpha(150),
        child: isSelected
            ? const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 18,
        )
            : CircleAvatar(radius: 7, backgroundColor: color),
      ),
    );
  }
}