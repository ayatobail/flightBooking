import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({super.key,required this.icon,required this.title,this.trailing,this.onTap, this.color});
  final IconData icon;
  final String title;
  final Widget? trailing;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        onTap: onTap,

        // contentPadding: EdgeInsets.all(4),
        tileColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Icon(icon,color: color,),
        ),
        title: Text(title),
        trailing: trailing ?? Icon( Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}

