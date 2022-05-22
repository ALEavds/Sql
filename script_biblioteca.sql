/*drop table emprestimo;
drop table livro;
drop table usuario;
*/
create table livro(
id_livro serial primary key,
titulo varchar (100) NOT NULL
);
create table usuario(
id_usuario serial primary key,
nome varchar(100) NOT NULL,
idade integer
);
create table emprestimo(
id_emprestimo serial primary key,
id_usuario integer unique,
id_livro integer unique,
data_emprestimo date
);
alter table emprestimo
add foreign key (id_usuario) references usuario(id_usuario);
alter table emprestimo
add foreign key (id_livro) references livro(id_livro);
insert into livro (titulo) values ('Engenharia de software');
insert into livro (titulo) values ('Segunda Guerra');
insert into livro (titulo) values ('Sistemas distribuidos');
insert into livro (titulo) values ('Internet e Protocolos');
insert into livro (titulo) values ('Harry Potter');
insert into livro (titulo) values ('Sistemas operacionais');
insert into livro (titulo) values ('O Homem de Giz');
insert into livro (titulo) values ('Amor e Gelatto');
insert into livro (titulo) values ('O Centro de tudo');
insert into livro (titulo) values ('Sitio do Pica-pau Amarelo');

insert into usuario (nome, idade) values ('Alexandre',19);
insert into usuario (nome, idade) values ('Maria',16);
insert into usuario (nome, idade) values ('Claudia',24);
insert into usuario (nome, idade) values ('Isaac',17);
insert into usuario (nome, idade) values ('Carlos',43);
insert into usuario (nome, idade) values ('Hugo',18);
insert into usuario (nome, idade) values ('Gustavo',13);
insert into usuario (nome, idade) values ('Julia',15);
insert into usuario (nome, idade) values ('Laura',17);
insert into usuario (nome, idade) values ('Bruno',29);

insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (1, 2, '2022-05-12');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (3, 3, '2022-04-22');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (5, 1, '2022-05-11');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (2, 5, '2022-04-25');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (6, 4, '2022-05-12');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (4, 7, '2022-06-07');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (8, 9, '2022-05-18');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (9, 10, '2022-05-19');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (7, 6, '2022-04-30');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (10, 8, '2022-06-03');


/*--Livros emprestados e seus respectivos usuários--*/

select u.nome, l.titulo from emprestimo as e
inner join usuario as u on u.id_usuario = e.id_usuario
inner join livro as l on l.id_livro = e.id_livro;


/*--Livros emprestados para menores de idade--*/

select u.nome, u.idade, l.titulo from emprestimo as e
inner join usuario as u on u.id_usuario = e.id_usuario
inner join livro as l on l.id_livro = e.id_livro
where idade<18;


/*--Livros emprestados para maiores de idade--*/

select u.nome, u.idade, l.titulo from emprestimo as e
inner join usuario as u on u.id_usuario = e.id_usuario
inner join livro as l on l.id_livro = e.id_livro
where u.idade>=18;


/*--Livros emprestados durante o mês 05--*/

select u.nome, l.titulo, e.data_emprestimo from emprestimo as e
inner join usuario as u on u.id_usuario = e.id_usuario
inner join livro as l on l.id_livro = e.id_livro
where e.data_emprestimo between '2022-05-01' and '2022-05-31';


/*--Livros que começam com a letra S--*/
select * from livro
where titulo Like 'S%';
