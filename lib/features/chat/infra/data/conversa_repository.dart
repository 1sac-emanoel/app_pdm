import 'package:pdm_isac/features/chat/domain/entities/conversa.dart';

class ConversaRepository {
  // BD
  List<Conversa> conversas = [
    Conversa(
      contato: 'Ewerton Costa',
      sigla: 'EC',
      ultimaMsg: 'Não vou reprová-los',
      hora: '16:20',
      naoLidas: 0,
    ),
    Conversa(
      contato: 'Warlles Machado',
      sigla: 'WM',
      ultimaMsg: 'Não vai escapar ninguém',
      hora: '16:30',
      naoLidas: 10,
    ),
  ];

  void add(Conversa conversa) => conversas.add(conversa);
}
