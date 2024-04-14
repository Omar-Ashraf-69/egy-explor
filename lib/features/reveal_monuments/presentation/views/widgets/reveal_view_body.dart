import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/core/utils/functions/pick_image.dart';
import 'package:flutter/material.dart';

class RevealViewBody extends StatelessWidget {
  const RevealViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                pickImage(
                  openCamera: false,
                );
              },
              icon: Image.asset(
                AssetsData.addImageIcon,
                height: 80,
                width: 80,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              pickImage(
                openCamera: true,
              );
            },
            child: Image.asset(
              AssetsData.imageFram,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
