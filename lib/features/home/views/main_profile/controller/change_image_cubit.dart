// import 'package:bloc/bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'change_image_state.dart';
//
// class ChangeImageCubit extends Cubit<ChangeImageState> {
//   final ImagePicker _imagePicker;
//
//   ChangeImageCubit(): _imagePicker = ImagePicker(), super(ProfileInitial());
//
//   Future<void> pickFromCamera() async {
//     emit(ProfileLoading());
//     try {
//       XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
//       if (image != null) {
//         emit(ProfileLoaded([image]));
//       } else {
//         emit(ProfileInitial());
//       }
//     } catch (error) {
//       emit(ProfileError("Error picking image from camera: $error"));
//     }
//   }
//
//   Future<void> pickFromGallery() async {
//     emit(ProfileLoading());
//     try {
//       XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         emit(ProfileLoaded([image]));
//       } else {
//         emit(ProfileInitial());
//       }
//     } catch (error) {
//       emit(ProfileError("Error picking image from gallery: $error"));
//     }
//   }
// }
