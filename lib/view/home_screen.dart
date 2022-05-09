import 'package:api/view/responcive.dart';
import 'package:flutter/material.dart';

class FontsScreen extends StatelessWidget {
  const FontsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.red,
                ),
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                color: Colors.green,
              ),
            ),
            if (Responsive.isTablet(context))
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.purple,
                ),
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                color: Colors.pink,
              ),
            ),
            if (Responsive.isMobile(context))
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  color: Colors.yellow,
                ),
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
