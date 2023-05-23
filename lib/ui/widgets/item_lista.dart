import 'package:flutter/material.dart';
import 'package:trabalho01_2b/models/agent.dart';
import 'package:trabalho01_2b/ui/widgets/imagem.dart';

class ItemLista extends StatelessWidget {
  final Agent agent;

  const ItemLista(this.agent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = agent.gradientColor.map((colorString) {
      String colorFmt = 'ff' + colorString.substring(0, 6);
      return Color(int.parse(colorFmt, radix: 16));
    }).toList();

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(500),
            bottomLeft: Radius.elliptical(500, 50),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Imagem(agent.icon, 200),
              Text(
                agent.name,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
