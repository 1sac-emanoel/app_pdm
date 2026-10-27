import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_event.dart';
import 'package:pdm_isac/features/chat/presentation/bloc/conversa_list_state.dart';

class ConversaListBloc extends Bloc<ConversaListEvent, ConversaListState> {
  ConversaListBloc() : super(ConversaLIstLoading()){
    //
  }
}
