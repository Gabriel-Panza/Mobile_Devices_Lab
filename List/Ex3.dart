double parcela = 200.0;
double juro = 0.01;
double parcelaAtual=parcela;
int numParcelas = 5;

double proxParcela(){
    return parcelaAtual *= (1+juro);
}
void main(){  
  for (int i=0;i<numParcelas-1;i++){
    print("Parcela ${i+1}:: ${parcelaAtual}");
    parcelaAtual = proxParcela();
  }
  print("O valor final do Emprestimo: ${parcelaAtual.toStringAsFixed(2)}");
}