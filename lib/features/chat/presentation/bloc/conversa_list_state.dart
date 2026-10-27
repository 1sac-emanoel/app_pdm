import 'package:pdm_isac/features/chat/domain/entities/conversa.dart';

sealed class ConversaListState {}

class ConversaLIstLoading extends ConversaListState {}

class ConversaListSuccess extends ConversaListState {
  final List<Conversa> conversas;
  ConversaListSuccess({required this.conversas});
}

class ConversaListFailure extends ConversaListState {
  final String msg;
  ConversaListFailure({required this.msg});
}
