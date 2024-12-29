import 'package:flutter/material.dart';
import '../../../core/data/models/apis/services_models/my_services_model.dart';
import '../../shared/custom_widgets/service_details_widget.dart';


class ServiceDetailsView extends StatefulWidget {
  const ServiceDetailsView({Key? key, required this.myService})
      : super(key: key);
  final MyServicesModel myService;

  @override
  _ServiceDetailsViewState createState() => _ServiceDetailsViewState();
}

class _ServiceDetailsViewState extends State<ServiceDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Service details')),
        body: Container(
          child: Column(
            children: [
              CustomServiceDetailsWidget(title: "Service Type", text: widget.myService.suriceType),
              CustomServiceDetailsWidget(title: "Name", text: widget.myService.userName),
              CustomServiceDetailsWidget(title: "Status", text: widget.myService.requestStatus),
              CustomServiceDetailsWidget(title: "Passport ID", text: widget.myService.passportnum),
              CustomServiceDetailsWidget(title: "Email", text:widget.myService.email),
              CustomServiceDetailsWidget(title: "Description", text: widget.myService.description,),
              CustomServiceDetailsWidget(title: "Photo", photo: widget.myService.image),

            ],
          ),
        ),
      ),
    );
  }


}
