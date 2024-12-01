import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/add_image_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/main_profile_widget.dart';

class UpdateImageScreen extends StatefulWidget {
  const UpdateImageScreen({super.key});

  @override
  State<UpdateImageScreen> createState() => _UpdateImageScreenState();
}

class _UpdateImageScreenState extends State<UpdateImageScreen> {
  ImagePicker imagePicker = ImagePicker();
  List<XFile> pickedImages = [];

  Future<void> pickFromCamera() async {
    try {
      XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          pickedImages.add(image);
        });
      }
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  Future<void> pickFromGallery() async {
    try {
      XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          pickedImages.add(image);
        });
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              55.hSize,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      AppRoutes.pop(context);
                    },
                    child: Image.asset("next".getPngAsset),
                  ),
                  22.wSize,
                  const TextWidget.bigText("الملف الشخصي"),
                  99.wSize,
                ],
              ),
              22.hSize,
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: pickedImages.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < pickedImages.length) {
                      return InkWell(
                        onTap: () {
                          _showImagePickerDialog(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Padding(
                            padding: 4.aEdge,
                            child: Container(
                              width: 124, 
                              height: 124,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                              ),
                              child: Image.file(
                                File(pickedImages[index].path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          _showImagePickerDialog(context);
                        },
                        child: const AddImageWidget(),
                      );
                    }
                  },
                ),
              ),
              12.hSize,
              const MainProfileWidget(text: 'تعديل الملف الشخصي'),
              const MainProfileWidget(text: 'تعديل الهوايات'),
              const MainProfileWidget(text: 'تعديل الهوايات'),
              const MainProfileWidget(text: 'تعديل الهوايات'),
              const MainProfileWidget(text: 'تعديل الهوايات'),
              const MainProfileWidget(text: 'تعديل الهوايات'),
              const MainProfileWidget(text: 'تعديل الهوايات'),
              const MainProfileWidget(text: 'تعديل الهوايات'),
            ],
          ),
        ),
      ),
    );
  }

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                pickFromCamera();
                Navigator.pop(context);
              },
              child: Container(
                padding: 5.aEdge,
                height: 66,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColors.secondColor),
                child: const Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.whiteColor,
                        size: 33,
                      ),
                      TextWidget(
                        'Camera',
                        color: AppColors.whiteColor,
                        fontSize: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            12.wSize,
            InkWell(
              onTap: () {
                pickFromGallery();
                Navigator.pop(context);
              },
              child: Container(
                padding: 5.aEdge,
                height: 66,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColors.secondColor),
                child: const Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: AppColors.whiteColor,
                        size: 33,
                      ),
                      TextWidget(
                        'Gallery',
                        color: AppColors.whiteColor,
                        fontSize: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
