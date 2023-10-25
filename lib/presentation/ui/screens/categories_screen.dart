import 'package:e_commerce_app/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Categories',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          leading: BackButton(
            color: Colors.black,
          )),
      body: SafeArea(
        child: GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: CategoryCard());
            }),
      ),
    );
  }
}
