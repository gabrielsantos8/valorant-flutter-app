import 'package:flutter/material.dart';
import 'package:trabalho01_2b/models/agent.dart';
import 'package:trabalho01_2b/ui/widgets/habilidade.dart';
import 'package:trabalho01_2b/ui/widgets/imagem.dart';

class DetalhesPage extends StatefulWidget {
  final Agent agent;

  const DetalhesPage(this.agent, {Key? key}) : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = widget.agent.gradientColor.map((colorString) {
      String colorFmt = 'ff' + colorString.substring(0, 6);
      return Color(int.parse(colorFmt, radix: 16));
    }).toList();

    List<Habilidade> habilidades = widget.agent.abilities.map((abilities) {
      return Habilidade(abilities['displayIcon'] ?? 'https://em-content.zobj.net/source/microsoft-teams/337/white-question-mark_2754.png', abilities['displayName'] ?? '');
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.agent.name),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.agent.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              Imagem(widget.agent.image, 300),
              const SizedBox(height: 100),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      widget.agent.description,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                textAlign: TextAlign.center,
                'HABILIDADES:',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.red,
                    fontSize: 25),
              ),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: habilidades)
            ],
          ),
        ],
      ),
    );
  }
}
