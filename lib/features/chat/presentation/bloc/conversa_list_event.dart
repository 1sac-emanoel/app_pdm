import 'package:pdm_isac/features/chat/domain/entities/conversa.dart';

sealed class ConversaListEvent {}

class ConversaListInitialize extends ConversaListEvent {}

class ConvesaListDuplicaConversa extends ConversaListEvent {
  final Conversa conversa;
  ConvesaListDuplicaConversa({required this.conversa});
}
