import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdm_isac/features/chat/infra/data/conversa_repository.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_block.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_state.dart';

class ConversaListPage extends StatelessWidget {
  final ConversaRepository repo = ConversaRepository();

  ConversaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConversaListBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Conversas')),
        body: BlocBuilder<ConversaListBloc, ConversaListState>(
          builder: (context, state) {
            if (state is ConversaListSuccess) {
              return ListView.builder(
                itemCount: repo.conversas.length,
                itemBuilder: (context, i) {
                  final conversa = repo.conversas[i];
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
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              );
            }

            if (state is ConversaListFailure) {
              return const Center(child: Text('Erro ao carregar conversas'));
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
