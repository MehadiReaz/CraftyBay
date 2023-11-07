import 'package:e_commerce_app/presentation/state_holder/auth/create_profile_controller.dart';
import 'package:e_commerce_app/presentation/state_holder/auth/read_profile_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/bottom_nav_bar.dart';
import 'package:e_commerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cusNameTEController = TextEditingController();
  final TextEditingController _cusAddTEController = TextEditingController();
  final TextEditingController _cusCityTEController = TextEditingController();
  final TextEditingController _cusStateTEController = TextEditingController();
  final TextEditingController _cusPostcodeTEController =
      TextEditingController();
  final TextEditingController _cusCountryTEController = TextEditingController();
  final TextEditingController _cusMobileTEController = TextEditingController();
  final TextEditingController _cusFaxTEController = TextEditingController();
  final TextEditingController _shipNameTEController = TextEditingController();
  final TextEditingController _shipAddTEController = TextEditingController();
  final TextEditingController _shipCityTEController = TextEditingController();
  final TextEditingController _shipStateTEController = TextEditingController();
  final TextEditingController _shipPostcodeTEController =
      TextEditingController();
  final TextEditingController _shipCountryTEController =
      TextEditingController();
  final TextEditingController _shipMobileTEController = TextEditingController();

  ReadProfileController readProfileController =
      Get.put(ReadProfileController());

  @override
  void initState() {
    if (readProfileController.readProfileModel.data != null) {
      _cusNameTEController.text =
          readProfileController.readProfileModel.data!.cusName ?? '';
      _cusAddTEController.text =
          readProfileController.readProfileModel.data!.cusAdd ?? '';
      _cusCityTEController.text =
          readProfileController.readProfileModel.data!.cusCity ?? '';
      _cusStateTEController.text =
          readProfileController.readProfileModel.data!.cusState ?? '';
      _cusPostcodeTEController.text =
          readProfileController.readProfileModel.data!.cusPostcode ?? '';
      _cusCountryTEController.text =
          readProfileController.readProfileModel.data!.cusCountry ?? '';
      _cusMobileTEController.text =
          readProfileController.readProfileModel.data!.cusPhone ?? '';
      _cusFaxTEController.text =
          readProfileController.readProfileModel.data!.cusFax ?? '';
      _shipNameTEController.text =
          readProfileController.readProfileModel.data!.shipName ?? '';
      _shipAddTEController.text =
          readProfileController.readProfileModel.data!.shipAdd ?? '';
      _shipCityTEController.text =
          readProfileController.readProfileModel.data!.shipCity ?? '';
      _shipStateTEController.text =
          readProfileController.readProfileModel.data!.shipState ?? '';
      _shipPostcodeTEController.text =
          readProfileController.readProfileModel.data!.shipPostcode ?? '';
      _shipCountryTEController.text =
          readProfileController.readProfileModel.data!.shipCountry ?? '';
      _shipMobileTEController.text =
          readProfileController.readProfileModel.data!.shipPhone ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Update Profile',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 120,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Complete Profile',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24)),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Get started with your details',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'User Details',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                      ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _cusNameTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Full Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cusMobileTEController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Mobile Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cusCityTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Plese enter City';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cusStateTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'State'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter State';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cusPostcodeTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Post Code'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Post Code';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cusFaxTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Fax'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Fax';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cusCountryTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'Country'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Country';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _cusAddTEController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    contentPadding: EdgeInsets.all(8),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 34,
                ),
                Text(
                  'User Details',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                      ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _shipNameTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Full Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _shipMobileTEController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Mobile Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _shipCityTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Plese enter City';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _shipStateTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'State'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter State';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _shipPostcodeTEController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Post Code'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Post Code';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _shipCountryTEController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'Country'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Country';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _shipAddTEController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    contentPadding: EdgeInsets.all(8),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CreateProfileController>(
                      builder: (createProfileScreenController) {
                    if (createProfileScreenController
                        .completeProfileInProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          createProfileScreenController
                              .createProfile(
                                  _cusNameTEController.text.trim(),
                                  _cusAddTEController.text.trim(),
                                  _cusCityTEController.text.trim(),
                                  _cusStateTEController.text.trim(),
                                  _cusPostcodeTEController.text.trim(),
                                  _cusCountryTEController.text.trim(),
                                  _cusMobileTEController.text.trim(),
                                  _cusFaxTEController.text.trim(),
                                  _shipNameTEController.text.trim(),
                                  _shipAddTEController.text.trim(),
                                  _shipCityTEController.text.trim(),
                                  _shipStateTEController.text.trim(),
                                  _shipPostcodeTEController.text.trim(),
                                  _shipCountryTEController.text.trim(),
                                  _shipMobileTEController.text.trim())
                              .then((result) {
                            if (result) {
                              Get.snackbar(
                                  'Success', 'Profile Update successful.',
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  borderRadius: 10,
                                  snackPosition: SnackPosition.BOTTOM);
                              Get.offAll(() => MainBottomNavigationBar());
                            } else {
                              Get.snackbar(
                                  'Failed', 'Profile Update failed! Try again.',
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  borderRadius: 10,
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          });
                        }
                      },
                      child: const Text('Update'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
