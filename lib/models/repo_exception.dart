import 'dart:io';

class PokeException implements Exception {
  String? _message;
  SocketException exception;

  PokeException(this.exception);

  String get message {
    switch (exception.osError!.errorCode) {
      case 103:
        return 'A conexão com a internet foi interrompida.';
      case 7:
        return 'Sem conexão a internet.';
      default:
        return 'Algo deu errado.';
    }
  }
}
