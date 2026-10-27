import 'package:pdm_isac/features/chat/domain/entities/conversa.dart';
import 'package:pdm_isac/features/chat/infra/data/conversa_repository.dart';
import 'package:flutter/material.dart';

class ConversaListPage extends StatelessWidget {
  final ConversaRepository repo = ConversaRepository();
  ConversaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversas')),
      body: ListView.builder(
        itemCount: repo.conversas.length,
        itemBuilder: (BuildContext context, int i) {
          Conversa conversa = repo.conversas[i];
          return ListTile(
            title: Text(conversa.contato),
            subtitle: Text(conversa.ultimaMsg),
            leading: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
              child: Text(conversa.sigla),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(conversa.hora),
                conversa.naoLidas > 0
                    ? Badge(label: Text('${conversa.naoLidas}'))
                    : SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }
}
