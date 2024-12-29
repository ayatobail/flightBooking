import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';

class FlightDetailCardController extends BaseController {
  final picker = ImagePicker();
  final selectedImages = RxList<XFile>([]);
  final selectedImagesPath = RxList<String>([]);

  Future<void> pickImage(ImageSource source) async {
    if (source == ImageSource.gallery) {
      final selected = await picker.pickMultiImage();
      if (selected.isNotEmpty) {
        selectedImages.addAll(selected);
        selected
            .map((e) => selectedImagesPath.add(e.path))
            .toList();
      }
    } else {
      final pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        selectedImages.add(pickedImage);
        selectedImagesPath.add(pickedImage.path);

        // update(); // Update UI to reflect changes
      }
    }
    if(selectedImages.isEmpty)Get.snackbar(
      "No Image Selected",
      "You haven't selected any image.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeImage(XFile image) {
    selectedImages.remove(image);
    update(); // Update UI to reflect changes
  }

  String get selectedImageNames {
    if (selectedImages.isEmpty) {
      return 'No Images Selected';
    }
    return selectedImages.map((image) => image.name).join(', ');
  }

  void reset() {
    selectedImages.clear();
    selectedImagesPath.clear();
    update();
  }
}
