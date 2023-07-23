import 'dart:math';

enum Jogada { pedra, papel, tesoura }

void main() {
  print('Bem-vindo ao jogo de pedra, papel e tesoura!\n');

  final rodadasParaJogar = 3;
  int vitoriasJogador = 0;
  int vitoriasComputador = 0;

  for (int rodadasJogadas = 1; rodadasJogadas <= rodadasParaJogar; rodadasJogadas++) {
    print('Rodada $rodadasJogadas:');
    final jogador = _obterJogadaDoUsuario();
    final computador = _obterJogadaDoComputador();

    print('Você escolheu: ${jogador.toString().split('.').last}');
    print('Computador escolheu: ${computador.toString().split('.').last}\n');

    final resultado = _determinarVencedor(jogador, computador);

    if (resultado == 0) {
      print('Empate nesta rodada.\n');
    } else if (resultado == 1) {
      print('Você ganhou esta rodada!\n');
      vitoriasJogador++;
    } else {
      print('Você perdeu esta rodada.\n');
      vitoriasComputador++;
    }
  }

  print('RESULTADO FINAL:');
  print('Você: $vitoriasJogador vitória(s)');
  print('Computador: $vitoriasComputador vitória(s)');

  if (vitoriasJogador > vitoriasComputador) {
    print('Parabéns! Você ganhou o jogo!');
  } else if (vitoriasJogador < vitoriasComputador) {
    print('Você perdeu o jogo. Tente novamente!');
  } else {
    print('O jogo terminou em empate. Jogue novamente!');
  }
}

Jogada _obterJogadaDoUsuario() {
  final random = Random().nextInt(3);
  return Jogada.values[random];
}

Jogada _obterJogadaDoComputador() {
  final random = Random().nextInt(3);
  return Jogada.values[random];
}

int _determinarVencedor(Jogada jogador, Jogada computador) {
  if ((jogador == Jogada.pedra && computador == Jogada.tesoura) ||
      (jogador == Jogada.papel && computador == Jogada.pedra) ||
      (jogador == Jogada.tesoura && computador == Jogada.papel)) {
    return 1;
  } else if ((computador == Jogada.pedra && jogador == Jogada.tesoura) ||
      (computador == Jogada.papel && jogador == Jogada.pedra) ||
      (computador == Jogada.tesoura && jogador == Jogada.papel)) {
    return -1;
  } else {
    return 0;
  }
}
