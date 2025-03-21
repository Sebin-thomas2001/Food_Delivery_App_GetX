// import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KycController extends GetxController {
  RxString profileImagePath = "null".obs;

  RxString locationName = "null".obs;

  String? firstName;
  String? lastName;
  String? mobileNumber;

  pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImagePath(image.path);
    }
  }

  takePicture() async {
    final ImagePicker picker = ImagePicker();
    // take image using camera.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      profileImagePath(image.path);
    }
  }

  Future<void> fetchLocation() async {
    bool _serviceEnabled;
    LocationPermission _permissionGranted;

    // Check if location services are enabled
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      // Location services are not enabled, show a message or handle it accordingly
      print('Location services are disabled.');
      return;
    }

    // Check location permissions
    _permissionGranted = await Geolocator.checkPermission();
    if (_permissionGranted == LocationPermission.denied) {
      _permissionGranted = await Geolocator.requestPermission();
      if (_permissionGranted != LocationPermission.whileInUse &&
          _permissionGranted != LocationPermission.always) {
        // Permission denied, show a message or handle it accordingly
        print('Location permissions are denied.');
        return;
      }
    }

    // If we have permission, get the current position
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // List<geocoding.Placemark> placemarks = await geocoding
      //     .placemarkFromCoordinates(position.latitude, position.longitude);

      locationName(
          "Longitude ${position.longitude}, Latitude ${position.latitude}");

      // Here you can return or use the position data as needed
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  storeKycDetails() {
    users.add({
      'first_name': firstName,
      'last_name':lastName,
      'mobile_number':mobileNumber,
      'location_name':locationName.value,
      'profile_image':profileImagePath.value
      });
  }
}
