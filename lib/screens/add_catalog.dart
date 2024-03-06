import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inno_hack/core/constants.dart';
import 'package:inno_hack/core/validators.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AddCatalog extends StatefulWidget {
  const AddCatalog({super.key});

  @override
  State<AddCatalog> createState() => _AddCatalogState();
}

class _AddCatalogState extends State<AddCatalog> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final List<String> boxContents = [];

  InputDecoration getInputDecoration(String text) {
    return InputDecoration(
      labelText: text,
      labelStyle: const TextStyle(
        fontSize: 16,
        color: Color(0xFF929497),
        fontFamily: 'Epilogue',
        fontWeight: FontWeight.w500,
        height: 0.06,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // errorText: showError ? widget.errorText : null,
      filled: true,
      fillColor: const Color(0xFFfafafa),
    );
  }

  void onSave() {
    final bool dataIsValid = formkey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Add",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xFF335A02),
        ),
        centerTitle: true,
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFADD0B3),
            ),
            alignment: Alignment.center,
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const ImagesList(images: []),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        validator: (value) => Validators.titleValidator(value),
                        decoration: getInputDecoration('Enter Product Name'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Price",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) => Validators.priceValidator(value),
                        decoration: getInputDecoration('Title'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Category",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      DropdownButtonFormField(
                        items: Categories.values
                            .map((item) => DropdownMenuItem<Categories>(
                                  value: item,
                                  child: Text(item.value),
                                ))
                            .toList(),
                        onChanged: (Categories? category) {},
                        decoration: getInputDecoration(''),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        minLines: 3,
                        maxLines: 5,
                        keyboardType: TextInputType.number,
                        validator: (value) => Validators.descValidator(value),
                        decoration:
                            getInputDecoration('Enter Product Description'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Brand",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) => Validators.brandValidator(value),
                        decoration: getInputDecoration('Brand'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Warranty",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            Validators.warrantyValidator(value),
                        decoration:
                            getInputDecoration('in Months (0, if no warranty)'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Return Period",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            Validators.returnPeriodValidator(value),
                        decoration: getInputDecoration(
                            'in Days (0, if no return period)'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "State",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            Validators.locationValidator(value),
                        decoration: getInputDecoration('State'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   "Box Contents",
                      //   style: GoogleFonts.inter(
                      //       fontSize: 18, fontWeight: FontWeight.w600),
                      // ),
                      // boxContents.isNotEmpty
                      //     ? Container(
                      //         child: ListView.builder(
                      //           shrinkWrap: true,
                      //           itemCount: boxContents.length,
                      //           itemBuilder: (context, index) => TextFormField(
                      //             decoration:
                      //                 getInputDecoration("Box Item $index"),
                      //             onSaved: (value) {
                      //               if (value != null) {
                      //                 boxContents[index] = value;
                      //               }
                      //             },
                      //           ),
                      //         ),
                      //       )
                      //     : Row(
                      //         children: [
                      //           Expanded(
                      //             child: TextFormField(
                      //               decoration:
                      //                   getInputDecoration("Box Item 1"),
                      //             ),
                      //           ),
                      //           IconButton(
                      //               onPressed: () {
                      //                 setState(() {
                      //                   boxContents.add('');
                      //                 });
                      //               },
                      //               icon: const Icon(Icons.add))
                      //         ],
                      //       )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ImagesList extends StatefulWidget {
  const ImagesList({super.key, required this.images});

  final List<String> images;

  @override
  State<ImagesList> createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  void addImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addImage,
      child: Stack(children: [
        widget.images.isEmpty
            ? Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF335A02)),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: const EdgeInsets.all(7),
                  child: Image.asset(
                    'assets/images/add_icon.png',
                    width: 64,
                    height: 64,
                    scale: 0.5,
                  ),
                ),
              )
            : CarouselSlider.builder(
                itemCount: widget.images.length,
                itemBuilder: (context, index, realIndex) =>
                    Image.asset('assets/images/default_image.png'),
                options: CarouselOptions()),
        // Positioned(
        //     bottom: 0,
        //     right: 40,
        //     child: Container(
        //       width: 64,
        //       height: 64,
        //       decoration: const BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Color.fromARGB(255, 234, 196, 72),
        //       ),
        //       child: InkWell(
        //         onTap: addImage,
        //         child: const Icon(
        //           Icons.add,
        //           color: Colors.white,
        //           size: 32,
        //         ),
        //       ),
        //     )),
      ]),
    );
  }
}
