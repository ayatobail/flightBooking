
import 'package:flutter/material.dart';

import '../../app_colors.dart';

class SettingSection extends StatelessWidget {
  const SettingSection(
      {super.key, required this.label, required this.settingList});

  final String label;
  final List<Widget> settingList;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FittedBox(
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.textColor, fontSize: 18),
          ),
        ),
      ),
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          color: Colors.white,
          margin: EdgeInsets.all(12),
          child: Column(
            children: settingList,
          ))
    ]);
  }
}
