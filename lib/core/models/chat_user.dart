class ChatUser {
  /*
  Classe que representa o usuário logado 
  */
  final String id;
  final String name;
  final String email;
  final String imageUrl;

  const ChatUser({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
  });
}
