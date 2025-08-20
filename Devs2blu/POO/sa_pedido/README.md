A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

código para o banco

create database pedidos;

use pedidos;

create table clientes(
cliente_id int primary key auto_increment,
cliente_nome varchar(45) not null
);

create table produtos(
produto_id int primary key auto_increment,
produto_nome varchar(45) not null,
produto_preco double not null,
produto_tipo varchar(45) not null,
produto_esp varchar(45) not null
);


create table pedidos(
pedido_id int primary key auto_increment,
pedido_idProcuto int not null,
pedido_idCliente int not null,
pedido_quantidade int not null,
foreign key (pedido_idProduto) references produtos(produto_id),
foreign key (pedido_idCliente) references clientes(cliente_id)
);


select
c.cliente_nome, 
pr.produto_nome, 
pr.produto_tipo, 
pr.produto_esp, 
p.pedido_quantidade, 
(p.pedido_quantidade * pr.produto_preco) as valor_total
from pedidos p
join clientes c on p.pedido_idCliente = c.cliente_id
join produtos pr on p.pedido_idProduto = pr.produto_id;


