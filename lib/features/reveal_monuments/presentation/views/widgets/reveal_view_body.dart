import 'package:egy_exlpor/core/utils/assets.dart';
import 'package:egy_exlpor/features/reveal_monuments/presentation/views/image_cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                BlocProvider.of<ImageCubit>(context).pickImage(false, context);
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
            onTap: () async {
              BlocProvider.of<ImageCubit>(context).pickImage(true, context);
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
