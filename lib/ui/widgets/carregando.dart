import 'package:flutter/material.dart';

class Carregando extends StatelessWidget {
  const Carregando({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 200, height: 200, child: CircularProgressIndicator()));
  }
}
