#Pega a biblioteca dart
FROM dart

#Joga dentro do container que o main será app
COPY main.dart app.dart 

#Aqui é o comando que será rodado
ENTRYPOINT [ "dart" , "app.dart"]

#para rodar no terminal você coloca o comando: docker build -t nome-imagem:tag local que o main.dart está
#docker build -t app-dart:1.0 .
#. quer dizer que o Dockerfile está no mesmo diretório que aplicação
# É a versão que a aplicação está rodando (de preferência não precisa colocar, pois normalmente você roda o latest)
# neste caso use só  docker build -t app-dart .  e já funciona