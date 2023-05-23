

import 'package:flutter/material.dart';
import 'package:trabalho01_2b/datasource/remote/agent_remotte.dart';
import 'package:trabalho01_2b/ui/pages/detalhes_page.dart';
import 'package:trabalho01_2b/ui/widgets/carregando.dart';
import 'package:trabalho01_2b/ui/widgets/item_lista.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/imgs/icon.png',
              width: 40,
            ),
            const Text('  Valorant Agents'),
            const SizedBox(width: 8)
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body:  FutureBuilder(
        future: AgentRemote().get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Carregando();
            case ConnectionState.done:
              return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetalhesPage(
                                              snapshot.data![index])));
                                },
                                child: ItemLista(snapshot.data![index]))));
                  });
          }
        },
      ),
    );
  }
}
