drop table produtos;
drop table vendas;
drop table clientes;

create table produtos(
    id serial PRIMARY KEY, 
    nome varchar(200) NOT NULL
);
create table clientes(
    id serial PRIMARY KEY,
    nome varchar(200) NOT NULL
);
create table vendas (
    id serial PRIMARY KEY,
        id_produto integer NOT NULL,
        id_cliente integer NOT NULL
);
ALTER TABLE vendas
ADD CONSTRAINT VdaProd
FOREIGN KEY (id_cliente) REFERENCES clientes(id);

insert into produtos (nome) values ('carro'),('computador'),('alface'),('pet'),('cidade');
insert into clientes (nome) values ('Hug'),('Zez'),('Lui'),('Tio Patinhas');
insert into vendas (id_produto, id_cliente) values (1,1),(2,2),(4,1),(4,2),(4,4);

select * from vendas;

-- Quem comprou o quê? --
select cli.nome as cliente, prod.nome as produto from vendas as vda
join produtos as prod on prod.id = vda.id_produto
join clientes as cli on cli.id = vda.id_cliente;

-- Produtos vendidos e não vendidos --
select vda.id as venda,prod.nome as produto  from vendas as vda 
right join produtos as prod on prod.id = vda.id_produto;

select vda.id as venda,prod.nome as produto from vendas as vda 
left join produtos as prod on prod.id = vda.id_produto;













