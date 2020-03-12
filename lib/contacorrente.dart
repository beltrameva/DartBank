import 'cliente.dart';

class ContaCorrente {
  Cliente titular;
  int _agencia = 145;

  get agencia => _agencia;
  set agencia(int novaAgencia) => _agencia = novaAgencia;//Quando não preciso validar o valor de uma propriedade, posso acessar dessa maneira.

  int conta;
  double _saldo = 20.0; //adicionar um '_' antes da variável, deixa ela privada
  double chequeEspecial = -100.0;

  get saldo {
    return _saldo;
  }
  set saldo(double novoSaldo) {
    if(novoSaldo >= chequeEspecial) {
      _saldo = novoSaldo;  
    } else {
      print('Saldo insuficiente! Saldo disponivel: ${saldo+chequeEspecial*-1}');
    }
    
  }

  bool verificaSaldo(double valor) {
    if(this.saldo - valor < this.chequeEspecial) {
      print("Sem saldo suficiente.");
      return false;
    } else {
      print("Movimentando $valor reais.");
      return true;
    }
  }

  bool transferencia(double valorTransferencia, ContaCorrente contaDestino) {
    if(!verificaSaldo(valorTransferencia)) {
      return false;
    } else {
      this.saldo -= valorTransferencia;
      contaDestino.deposito(valorTransferencia);
      return true;
    }
  }

  bool saque(double valorDoSaque)  {
    if(!verificaSaldo(valorDoSaque)) {
      return false;
    } else {
      this.saldo -= valorDoSaque;
      return true;
    }
  }

  double deposito(double valorDoDeposito) {
    this.saldo += valorDoDeposito;
    return this.saldo;
  }
} 