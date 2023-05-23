
import 'package:trabalho01_2b/infra/cliente_http.dart';
import 'package:trabalho01_2b/models/agent.dart';

class AgentRemote {
  final link = "https://valorant-api.com/v1/agents?isPlayableCharacter=true";

  Future<List<Agent>> get() async {
    var dados = await ClienteHttp().getJson(link);
    List<dynamic> lista = dados['data'];
    return lista.map((e) => Agent.fromMap(e)).toList();
  }
}
