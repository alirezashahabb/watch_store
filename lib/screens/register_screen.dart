import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/utils/image_handler.dart';
import 'package:watch_store/widgets/app_bar.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/avatar.dart';
import 'package:watch_store/widgets/main_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController postalController = TextEditingController();
    TextEditingController loctionController = TextEditingController();
    ImageHandler imageHandler = ImageHandler();
    return Scaffold(
      appBar: CustomAppBar(
          child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          Text(
            AppStrings.register,
            style: AppTextStyles.title,
          )
        ],
      )),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Avatar(
                  onTap: () async {
                    await imageHandler
                        .pickAndCropImage(
                      source: ImageSource.gallery,
                    )
                        .then(
                      (value) {
                        setState(() {});
                      },
                    );
                  },
                  file: imageHandler.getImage,
                ),
                AppTextField(
                  lable: AppStrings.nameLastName,
                  controller: firstNameController,
                  hint: AppStrings.hintNameLastName,
                ),
                AppTextField(
                  lable: AppStrings.homeNumber,
                  controller: phoneController,
                  hint: AppStrings.hintHomeNumber,
                ),
                AppTextField(
                  lable: AppStrings.address,
                  controller: addressController,
                  hint: AppStrings.hintAddress,
                ),
                AppTextField(
                  lable: AppStrings.postalCode,
                  controller: postalController,
                  hint: AppStrings.hintPostalCode,
                ),
                AppTextField(
                  lable: AppStrings.location,
                  controller: loctionController,
                  hint: AppStrings.hintLocation,
                  icon: Icon(
                    Icons.location_on,
                  ),
                ),
                AppDimens.medium.height,
                MainButton(
                  text: AppStrings.register,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
