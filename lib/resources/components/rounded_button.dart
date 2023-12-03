import 'package:flutter/material.dart';
import 'package:mvcmvvmstructure/resources/colors/colors.dart';

class RoundedButton extends StatelessWidget {
  final bool loading;
  final String title;
  final double width, height;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  RoundedButton({
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.width = 160,
    this.height = 45,
    this.loading = false,
    required this.title,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: buttonColor),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: textColor),
                ),
              ),
      ),
    );
  }
}
