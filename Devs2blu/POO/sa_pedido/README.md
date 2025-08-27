Aqui os itens para criar banco de dados

create User 'paozinho'@'localhost' identified by 'senha';
grant all privileges on *.* to 'paozinho'@'localhost';
select * from mysql.user;

CREATE DATABASE loja;

USE loja;

CREATE TABLE clientes (
  idCliente INT AUTO_INCREMENT PRIMARY KEY,
  nomeCliente VARCHAR(100) NOT NULL,
  emailCliente VARCHAR(100) UNIQUE NOT NULL,
  cpfCliente VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE produtos (
  idProduto INT AUTO_INCREMENT PRIMARY KEY,
  nomeProduto VARCHAR(100) NOT NULL,
  precoProduto DECIMAL(10,2) NOT NULL,
  tipoProduto VARCHAR(50) NOT NULL,
  espProduto VARCHAR(50) NOT NULL
);

CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  clienteId INT NOT NULL,
  descricao VARCHAR(200),
  valor DECIMAL(10,2) NOT NULL,
  dataPedido DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (clienteId) REFERENCES clientes(idCliente)
);

-- Relacionamento N:N (Pedido pode ter vários Produtos)
CREATE TABLE pedido_produto (
  pedidoId INT,
  produtoId INT,
  quantidade INT DEFAULT 1,
  PRIMARY KEY (pedidoId, produtoId),
  FOREIGN KEY (pedidoId) REFERENCES pedidos(id),
  FOREIGN KEY (produtoId) REFERENCES produtos(idProduto)
);