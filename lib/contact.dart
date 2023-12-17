import 'package:image_picker/image_picker.dart';

class Contact {
  String fullName;
  String occupation;
  String email;
  String phone;
  String? imagePath;

  Contact(this.fullName, this.occupation, this.email, this.phone,
      {this.imagePath});
}
