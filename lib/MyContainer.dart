import 'package:flutter/material.dart';

class Mycontainer extends StatelessWidget {
  const Mycontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              Center(
                child: rainbowContainerMethod(
                  'Hello world!',
                  Colors.red,
                  Alignment.center,
                  true,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      rainbowContainerMethod(
                        'Meo meo 1',
                        Colors.red,
                        Alignment.bottomRight,
                      ),
                      rainbowContainerMethod(
                        'Meo meo 2',
                        Colors.blue,
                        Alignment.bottomLeft,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      rainbowContainerMethod(
                        'Meo meo 3',
                        Colors.green,
                        Alignment.topRight,
                      ),
                      rainbowContainerMethod(
                        'Meo meo 4',
                        Colors.amber,
                        Alignment.topLeft,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Container rainbowContainerMethod(
    String text,
    Color color,
    AlignmentGeometry align, [
    bool isBorderRadius = false,
  ]) {
    return Container(
      width: 120,
      height: 120,
      alignment: align,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            (isBorderRadius
                ? BorderRadius.all(Radius.circular(50))
                : BorderRadius.zero),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
