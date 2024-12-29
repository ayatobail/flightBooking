import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/tab_bar_views/services_view/services_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../app_colors.dart';
import '../custom_widgets/app_text_field.dart';
import '../custom_widgets/label_text.dart';

class ChooseLocationsComponents extends StatefulWidget {
  const ChooseLocationsComponents

  ({super.key, required this.controller});

  final HomeController controller;

  @override
  State<ChooseLocationsComponents> createState() =>
      _ChooseLocationsComponentsState();
}

class _ChooseLocationsComponentsState extends State<ChooseLocationsComponents> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              LabelText(
                labelText: 'From',
                padding: 25,
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == "") {
                    return Iterable<String>.empty();
                  }
                  return widget.controller.suggestins.where((suggestion) =>
                      suggestion.contains(textEditingValue.text)).toList();
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) =>
                    AppTextField(controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onFieldSubmitted,
                      onChange: (val){widget.controller.fromController.text=val;},
                      width: context.width * 0.35,
                    ),
                optionsViewBuilder: ((context, onSelected, options) =>
                    Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(width: screenWidth(2.7),
                          child: Card(elevation:0,color: AppColors.backgroundColor,child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children:
                            options.map((e) => InkWell(
                                onTap: (){onSelected(e);widget.controller.fromController.text=e;},
                                child: ListTile(title: Text(e),))).toList(),

                          ),),)



                    )),
                /* AppTextField(
                      controller:widget.controller.fromController,
                      width: context.width * 0.35,

                    ),*/


              ),
            ],
          ),
          Container(

            // padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(color: AppColors.primaryColor,style: BorderStyle.solid)
            //   ),
              child: Icon(
                Icons.flight_takeoff_outlined,
                size: context.width * 0.1,
                color: AppColors.secondaryColor,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              LabelText(
                labelText: 'To',
                padding: 25,
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == "") {
                    return Iterable<String>.empty();
                  }
                  return widget.controller.suggestins.where((suggestion) =>
                      suggestion.contains(textEditingValue.text)).toList();
                },
                fieldViewBuilder: (context, textEditingController, focusNode,
                    onFieldSubmitted) =>
                    AppTextField(controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onFieldSubmitted,
                      width: context.width * 0.35,
                      onChange: (val){widget.controller.toController.text=val;},
                    ),
                optionsViewBuilder: ((context, onSelected, options) =>
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(width: screenWidth(2.7),
                      child: Card(elevation:0,color:AppColors.backgroundColor,child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:
                          options.map((e) => InkWell(
                              onTap: (){onSelected(e);widget.controller.toController.text=e;},
                              child: ListTile(title: Text(e),))).toList(),

                      ),),)



                    )),)
              /*AppTextField(
                controller: widget.controller.toController,
                width: context.width * 0.35,
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}
