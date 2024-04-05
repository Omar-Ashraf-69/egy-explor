import 'package:flutter/cupertino.dart';

class CommmonBodyStruct extends StatelessWidget {
  const CommmonBodyStruct({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child:  SizedBox(
          width: 400,
          child: child,
        ),
      ),
    );
  }
}
