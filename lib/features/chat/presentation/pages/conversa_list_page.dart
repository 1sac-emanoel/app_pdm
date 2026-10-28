import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_bloc.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_event.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_state.dart';

class ConversaListPage extends StatelessWidget {
  const ConversaListPage({super.key});

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
                itemCount: state.conversas.length,
                itemBuilder: (context, i) {
                  final conversa = state.conversas[i];
                  return ListTile(
                    onTap: () {
                      context.read<ConversaListBloc>().add(ConvesaListDuplicaConversa(conversa: conversa));
                    },
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Ops! Falhouuu mane.",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: CircularProgressIndicator())],
            );
          },
        ),
      ),
    );
  }
}
