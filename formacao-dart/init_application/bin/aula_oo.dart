void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheita = 30;
  int diasParaMadura = 20;
  bool isMadura = funcEstaMadura(diasDesdeColheita);
  // verificandoFruta("Laranja", 98.0, 30, 1);

  Fruta fruta01 = Fruta(nome, peso, cor, sabor, diasDesdeColheita);
  Fruta fruta02 = Fruta("Uva", 40.3, "Roxa", "Doce", 20);

  Legumes mandioca = Legumes('Macaxeira', 1200, 'Marrom', true);
  Fruta banana = Fruta('Banana', 75, 'Amarela', 'Doce', 4);
  Nozes macadamia = Nozes('Macadâmia', 2, 'Branco amarelado', 'Doce', 20, 35);
  Citricas limao = Citricas('Limão', 100, 'Verde', 'Azedo', 10, 9);


  macadamia.fazerMassa();
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;

    print(
        "A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para ficar madura. Ela está madura? $isMadura");
  }

  void fazerSuco() {
    print('Feito um suco de $nome');
  }
  
  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
    print('Pegar a fruta');
  }
  
  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
    print('Misturar os ingredientes');
  }
  
  @override
  void assar() {
    // TODO: implement assar
    print('Colocar no forno');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas e é da cor $cor.');
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando.');
    } else {
      print('Não precisa cozinhar.');
    }
  }
  
  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
    print('Pegar a fruta');
  }
  
  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
    print('Misturar os ingredientes');
  }
  
  @override
  void assar() {
    // TODO: implement assar
    print('Colocar no forno');
  }
  
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);
  
  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerante de $nome');
    } else {
      print('Não existe refrigerante de $nome');
    }
  }

}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
    int diasDesdeColheita, this.porcentagemOleoNatural)
    : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Removendo a casca');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();

  void fazerMassa();

  void assar();
}

void verificandoFruta(
    String nome, double peso, int diasDesdeColheita, int diasParaMadura) {
  int diasRestantes = diasDesdeColheita - diasParaMadura;

  if (diasRestantes > 0) {
    print(
        "A $nome pesa $peso gramas! Ela foi colhida há $diasDesdeColheita e precisa de $diasParaMadura para amadurecer, logo, a $nome está madura!");
  } else {
    print(
        "A $nome pesa $peso gramas! Ela foi colhida há $diasDesdeColheita e já está madura!");
  }
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = dias - diasParaMadura;

  return quantosDiasFaltam;
}

void mostrarMadura(String nome, int dias,
    {String? cor = "sem cor", required String isPequena}) {
  if (dias >= 30) {
    print('A $nome está madura.');
  } else {
    print('A $nome não está madura.');
  }

  if (cor != null) {
    print("A $nome é $cor");
  }

  if (isPequena != null) {
    print("A $nome é pequena? $isPequena");
  }
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}
