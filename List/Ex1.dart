void main(){
  double parcela = 200.0;
  double juro = 0.01;
  int numParcelas = 5;

  double parcelaAtual=parcela;

  for (int i=0;i<numParcelas-1;i++){
    parcelaAtual *= (1+juro);
  }
  print("O valor final do Emprestimo: ${parcelaAtual}");
}