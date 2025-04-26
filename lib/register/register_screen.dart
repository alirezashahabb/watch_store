//sasansafari_dev

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/navigator.dart';
import 'package:watch_store/component/snack_bar.dart';
import 'package:watch_store/data/model/user.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/screens/home/home_screen.dart';
import 'package:watch_store/utils/image_handler.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/avatar.dart';
import 'package:watch_store/widgets/main_button.dart';

import 'cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPostalCode = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;

  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: BlocProvider(
                create: (context) => RegisterCubit(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppDimens.large.height,
                    Avatar(
                        onTap: () async => await imageHandler
                            .pickAndCropImage(source: ImageSource.gallery)
                            .then((value) => setState(() {})),
                        file: imageHandler.getImage),
                    AppTextField(
                        lable: AppStrings.nameLastName,
                        hint: AppStrings.hintNameLastName,
                        controller: _controllerNameLastName),
                    AppTextField(
                        lable: AppStrings.homeNumber,
                        hint: AppStrings.hintHomeNumber,
                        controller: _controllerPhone),
                    AppTextField(
                        lable: AppStrings.address,
                        hint: AppStrings.hintAddress,
                        controller: _controllerAddress),
                    AppTextField(
                        lable: AppStrings.postalCode,
                        hint: AppStrings.hintPostalCode,
                        controller: _controllerPostalCode),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is LocationPickedState) {
                          if (state.location != null) {
                            _controllerLocation.text =
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
                          child: AppTextField(
                            lable: AppStrings.location,
                            hint: AppStrings.hintLocation,
                            controller: _controllerLocation,
                            icon: const Icon(Icons.location_on),
                          ),
                        );
                      },
                    ),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is OkResponseState) {
                          goScreen(
                            context: context,
                            screen: HomeScreen(),
                          );
                          showCustomAlert(
                            context,
                            'شما با موفقیت ثبت نام شدید!',
                          );
                        } else if (state is ErrorState) {
                          showCustomAlert(
                            context,
                            'خطایی رخ داده هست!',
                            AlertType.error,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return MainButton(
                              text: AppStrings.next,
                              onPressed: () async {
                                UserModel user = UserModel(
                                    name: _controllerNameLastName.text,
                                    phone: _controllerPhone.text,
                                    address: _controllerAddress.text,
                                    postalCode: _controllerPostalCode.text,
                                    image: await MultipartFile.fromFile(
                                        imageHandler.getImage!.path),
                                    lat: lat,
                                    lng: lng);

                                BlocProvider.of<RegisterCubit>(context)
                                    .register(user: user);
                              });
                        }
                      },
                    ),
                    AppDimens.large.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
