int cont=0;

double proxParcela(double parcelaAtual, double juro, int emprestimo){
  print("Emprestimo ${emprestimo}: parcela ${cont} eh ${parcelaAtual}");
  return parcelaAtual *= (1+juro);
}
void main(){
  double parcela1 = 200.0;
  double parcela2 = 500.0;
  double juro1 = 0.01;
  double juro2 = 0.02;
  int numParcelas1 = 5;
  int numParcelas2 = 7;

  double parcelaAtual1 = parcela1;
  double parcelaAtual2 = parcela2;

  for (int i=0;i<numParcelas2;i++){
    cont++;
    if (i<numParcelas1)
      parcelaAtual1 = proxParcela(parcelaAtual1, juro1,1);
    parcelaAtual2 = proxParcela(parcelaAtual2, juro2,2);
  }
}