import 'repositorio.dart';

void main(){

RepositorioPessoas repo = RepositorioPessoasRemote();

repo.ler(10);
repo.adicionar('Receba');
repo.apagar(1);

}