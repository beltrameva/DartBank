import '../lib/cliente.dart';
import '../lib/contacorrente.dart';

void main() {
  ContaCorrente conta = ContaCorrente();

  ContaCorrente conta2 = ContaCorrente();

  conta.agencia = 1234;

  print(conta.agencia);
}

