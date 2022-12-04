import 'package:flutter/material.dart';
import 'animated_indicator.dart';
import 'component_onboard.dart';

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            onTap: onNext,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99), color: blue),
              child: const Center(
                  child: Icon(
                Icons.navigate_next_outlined,
                color: Colors.white,
                size: 45,
              )),
            ),
          ),
        )
      ]),
    );
  }
}
