double parcela = 200.0;
double juro = 0.01;
double parcelaAtual=parcela;

double proxParcela(){
    return parcelaAtual *= (1+juro);
}
void main(){
  int numParcelas = 5;
  
  for (int i=0;i<numParcelas-1;i++){
    parcelaAtual = proxParcela();
  }
  print("O valor final do Emprestimo: ${parcelaAtual}");
}