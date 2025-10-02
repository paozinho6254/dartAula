import '../servicos/taxacao.dart';

class Locacao implements Taxacao {
  DateTime horaRetirada;
  DateTime horaRetorno;
  double valorHora;
  double valorDia;

  Locacao({
    required this.horaRetirada,
    required this.horaRetorno,
    required this.valorDia,
    required this.valorHora,
  });

  get getHoraRetirada => this.horaRetirada;

  set setHoraRetirada(horaRetirada) => this.horaRetirada = horaRetirada;

  get getHoraRetorno => this.horaRetorno;

  set setHoraRetorno(horaRetorno) => this.horaRetorno = horaRetorno;

  get getValorHora => this.valorHora;

  set setValorHora(valorHora) => this.valorHora = valorHora;

  get getValorDia => this.valorDia;

  set setValorDia(valorDia) => this.valorDia = valorDia;

  @override
  double valorTotal(double valor, DateTime retirada, DateTime retorno) {
    return 0;
  }

  double calcImposto(double valor) {
    double imposto;
    if (valor >= 100) {
      imposto = valor * 0.15;
    } else {
      imposto = valor * 0.2;
    }
    return imposto;
  }

  double duracaoHoras(DateTime retirada, DateTime retorno) {
    int minutos = retorno.minute - retirada.minute;
    double horas = minutos / 60;
    horas.ceil();
    return horas;
  }


}
