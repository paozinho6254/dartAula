Aqui os itens para criar banco de dados

create User 'paozinho'@'localhost' identified by 'senha';
grant all privileges on *.* to 'paozinho'@'localhost';
select * from mysql.user;

CREATE DATABASE IF NOT EXISTS loja;

USE loja;

CREATE TABLE IF NOT EXISTS clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  valor DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);