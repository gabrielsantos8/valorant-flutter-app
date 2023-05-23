import 'package:flutter/material.dart';

class Habilidade extends StatelessWidget {
  final String url;
  final String displayName;

  const Habilidade(this.url, this.displayName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(2),
      child: Column(
        children: [
          Image.network(
            url,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            displayName,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
