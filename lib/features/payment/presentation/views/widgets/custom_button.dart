import 'package:flutter/cupertino.dart';

class CustomPayButton extends StatelessWidget {
  const CustomPayButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading,
  });
  final void Function()? onTap;
  final bool? isLoading;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: const Color(0xFF34A853),
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: isLoading != null && isLoading == true
              ? const CupertinoActivityIndicator()
              : Text(
                  label,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
