import 'package:cherry_toast/cherry_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/data/model/user.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/string.dart';
import 'package:watch_store/screens/register/cubit/register_cubit.dart';
import 'package:watch_store/screens/root_screen.dart';
import 'package:watch_store/utils/image_handler.dart';
import 'package:watch_store/widget/app_text_feild.dart';
import 'package:watch_store/widget/avatar_profile.dart';
import 'package:watch_store/widget/main_bottom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final ImageHandler imageHandler = ImageHandler();
  double lat = 0.0;
  double lng = 0.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: RegistrationAppBar(size: size),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppDimes.medium, AppDimes.medium,
              AppDimes.medium, AppDimes.medium),
          child: BlocProvider(
            create: (context) => RegisterCubit(),
            child: Column(
              children: [
                Avatar(
                    onTap: () async => await imageHandler
                        .pickAndCropImage(source: ImageSource.gallery)
                        .then((value) => setState(() {})),
                    file: imageHandler.getImage),
                MyAppTextFelid(
                  label: AppStrings.nameLastName,
                  hint: AppStrings.hintNameLastName,
                  controller: lastNameController,
                ),
                MyAppTextFelid(
                  label: AppStrings.homeNumber,
                  hint: AppStrings.hintHomeNumber,
                  controller: phoneController,
                ),
                MyAppTextFelid(
                  label: AppStrings.address,
                  hint: AppStrings.hintAddress,
                  controller: addressController,
                ),
                MyAppTextFelid(
                  label: AppStrings.postalCode,
                  hint: AppStrings.hintPostalCode,
                  controller: postalController,
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterLocationState) {
                      if (state.location != null) {
                        locationController.text =
                            '${state.location!.latitude} - ${state.location!.longitude}';
                        lat = state.location!.latitude;
                        lng = state.location!.longitude;
                      }
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<RegisterCubit>(context)
                            .pickTheLocation(context: context);
                      },
                      child: MyAppTextFelid(
                        label: AppStrings.location,
                        hint: AppStrings.hintLocation,
                        controller: locationController,
                        icon: const Icon(Icons.location_on),
                      ),
                    );
                  },
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccessfulState) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RootScreen(),
                        ),
                      );
                    } else if (state is RegisterErrorState) {
                      return CherryToast.error(
                        title: const Text("خطایی رخ داده هست",
                            style: AppTextStyles.title),
                      ).show(context);
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return MainBottom(
                          onPressed: () async {
                            UserModel userModel = UserModel(
                                name: lastNameController.text,
                                phone: phoneController.text,
                                address: addressController.text,
                                postalCode: postalController.text,
                                image: await MultipartFile.fromFile(
                                    imageHandler.getImage!.path),
                                lat: lat,
                                lng: lng);

                            BlocProvider.of<RegisterCubit>(context)
                                .registerUser(user: userModel);
                          },
                          text: AppStrings.next);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegistrationAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(size.width, size.height),
        child: Padding(
          padding: const EdgeInsets.all(AppDimes.medium),
          child: SizedBox(
            width: size.width,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.register,
                  style: AppTextStyles.title.copyWith(
                    fontSize: 17,
                  ),
                ),
                SvgPicture.asset(Assets.svg.back),
              ],
            ),
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height * 0.1);
}
