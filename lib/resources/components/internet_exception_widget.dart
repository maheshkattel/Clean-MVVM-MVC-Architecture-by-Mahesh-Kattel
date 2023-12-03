import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvcmvvmstructure/resources/colors/colors.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off_outlined,
            size: 96,
            color: AppColors.blueColor,
          ),
          Text('internet_exception'.tr),
          const SizedBox(height: 50),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 45,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Retry',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
