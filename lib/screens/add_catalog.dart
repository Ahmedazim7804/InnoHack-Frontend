import 'package:flutter/material.dart';

class AddCatalog extends StatefulWidget {
  const AddCatalog({super.key});

  @override
  State<AddCatalog> createState() => _AddCatalogState();
}

class _AddCatalogState extends State<AddCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.asset('assets/images/default_image.png')],
      ),
    );
  }
}
