import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdm_isac/features/chat/domain/entities/conversa.dart';
import 'package:pdm_isac/features/chat/infra/data/conversa_repository.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_event.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_state.dart';

class ConversaListBloc extends Bloc<ConversaListEvent, ConversaListState> {
  final ConversaRepository conversaRepo = ConversaRepository();

  ConversaListBloc() : super(ConversaLIstLoading()) {
    //captura o evento de inicialização
    on<ConversaListInitialize>((event, emit) async {
      await Future.delayed(Duration(seconds: 4));

      List<Conversa> dados = conversaRepo.conversas;
      if (dados.isNotEmpty) {
        emit(ConversaListSuccess(conversas: dados));
      } else {
        emit(ConversaListFailure(msg: "Sem dados mane!"));
      }
    });

    on<ConvesaListDuplicaConversa>((event, emit) async {
      //emite o Loading para exibir o carregamento na tela
      emit(ConversaLIstLoading());
      await Future.delayed(Duration(seconds: 3));

      //processo do evento de duplicação
      conversaRepo.add(event.conversa);
      emit(ConversaListSuccess(conversas: conversaRepo.conversas));
    });

    //dispara umm evento de inicialização
    add(ConversaListInitialize());
  }
}
