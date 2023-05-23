import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Imagem extends StatelessWidget {
  final String link;
  final double width;

  const Imagem(this.link, this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
        width: width,
        placeholder: kTransparentImage,
        image: link,
        fit: BoxFit.cover);
  }
}
