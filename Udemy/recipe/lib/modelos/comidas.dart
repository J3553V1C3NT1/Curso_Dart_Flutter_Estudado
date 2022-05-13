enum Complexidade {
  Simples,
  Medio,
  Dificil,
}

enum Custo {
  Barato,
  Justo,
  Caro,
}

class Comidas {
  final String id;
  final List<String> categorias;
  final String titulo;
  final String imagemDaNet;
  final List<String> igredientes;
  final List<String> passos;
  final int duracao;
  final bool semGluter;
  final bool semLactose;
  final bool vegana;
  final bool vegetariana;
  final Complexidade complexidade;
  final Custo custo;

  const Comidas({
    required this.id,
    required this.categorias,
    required this.titulo,
    required this.imagemDaNet,
    required this.igredientes,
    required this.passos,
    required this.duracao,
    required this.semGluter,
    required this.semLactose,
    required this.vegana,
    required this.vegetariana,
    required this.complexidade,
    required this.custo,
  });

  String get complexidadeTexto {
    switch (complexidade) {
      case Complexidade.Simples:
        return 'Simples';
      case Complexidade.Medio:
        return 'Normal';
      case Complexidade.Dificil:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }

  String get custoTexto {
    switch (custo) {
      case Custo.Barato:
        return 'Barato';
      case Custo.Justo:
        return 'Justo';
      case Custo.Caro:
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }
}
