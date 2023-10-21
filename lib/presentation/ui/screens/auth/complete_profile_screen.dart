import 'package:e_commerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter First Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Last Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Mobile'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Plese enter Mobile Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter City';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Shipping Address',
                    contentPadding: EdgeInsets.all(8),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter shipping Address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text('Complete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
