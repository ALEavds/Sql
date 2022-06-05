drop table emprestimo;
drop table livro;
drop table usuario;

create table livro(
id_livro serial primary key,
titulo varchar (100) NOT NULL
);
create table usuario(
id_usuario serial primary key,
nome varchar(100) NOT NULL
);
create table exemplares(
id_exemplar serial primary key,
titulo varchar (100) NOT NULL
);
create table emprestimo(
id_emprestimo serial primary key,
id_usuario integer unique,
id_livro integer ,
id_exemplar integer unique,
data_emprestimo date
);

alter table emprestimo
add foreign key (id_usuario) references usuario(id_usuario);
alter table emprestimo
add foreign key (id_livro) references livro(id_livro);
alter table emprestimo
add foreign key (id_exemplar) references exemplares(id_exemplar);

insert into livro (titulo) values ('God of War');
insert into livro (titulo) values ('Segunda Guerra');
insert into livro (titulo) values ('Sistemas distribuidos');
insert into livro (titulo) values ('Internet e Protocolos');
insert into livro (titulo) values ('Harry Potter');
insert into livro (titulo) values ('Sistemas operacionais');
insert into livro (titulo) values ('O Homem de Giz');
insert into livro (titulo) values ('Amor e Gelatto');
insert into livro (titulo) values ('O Centro de tudo');
insert into livro (titulo) values ('Sitio do Pica-pau Amarelo');

insert into exemplares (titulo) values ('God of War');
insert into exemplares (titulo) values ('God of War');
insert into exemplares (titulo) values ('God of War');
insert into exemplares (titulo) values ('God of War');
insert into exemplares (titulo) values ('God of War');
insert into exemplares (titulo) values ('God of War');
insert into exemplares (titulo) values ('Segunda Guerra');
insert into exemplares (titulo) values ('Segunda Guerra');
insert into exemplares (titulo) values ('Segunda Guerra');
insert into exemplares (titulo) values ('Segunda Guerra');
insert into exemplares (titulo) values ('Segunda Guerra');
insert into exemplares (titulo) values ('Sistemas distribuidos');
insert into exemplares (titulo) values ('Sistemas distribuidos');
insert into exemplares (titulo) values ('Sistemas distribuidos');
insert into exemplares (titulo) values ('Sistemas distribuidos');
insert into exemplares (titulo) values ('Internet e Protocolos');
insert into exemplares (titulo) values ('Internet e Protocolos');
insert into exemplares (titulo) values ('Internet e Protocolos');
insert into exemplares (titulo) values ('Internet e Protocolos');
insert into exemplares (titulo) values ('Internet e Protocolos');
insert into exemplares (titulo) values ('Harry Potter');
insert into exemplares (titulo) values ('Harry Potter');
insert into exemplares (titulo) values ('Harry Potter');
insert into exemplares (titulo) values ('Harry Potter');
insert into exemplares (titulo) values ('Harry Potter');
insert into exemplares (titulo) values ('Harry Potter');
insert into exemplares (titulo) values ('Sistemas operacionais');
insert into exemplares (titulo) values ('Sistemas operacionais');
insert into exemplares (titulo) values ('Sistemas operacionais');
insert into exemplares (titulo) values ('Sistemas operacionais');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('O Homem de Giz');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('Amor e Gelatto');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('O Centro de tudo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');
insert into exemplares (titulo) values ('Sitio do Pica-pau Amarelo');

insert into usuario (nome) values ('Hugo');
insert into usuario (nome) values ('Gustavo');
insert into usuario (nome) values ('Julia');
insert into usuario (nome) values ('Laura');
insert into usuario (nome) values ('Bruno');
insert into usuario (nome) values ('Alexandre');
insert into usuario (nome) values ('Maria');
insert into usuario (nome) values ('Claudia');
insert into usuario (nome) values ('Isaac');
insert into usuario (nome) values ('Carlos');
insert into usuario (nome) values ('Betty');
insert into usuario (nome) values ('Lucas');
insert into usuario (nome) values ('Matheus');

insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (1, 2, '2022-05-12', 9);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (3, 3, '2022-04-22', 13);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (5, 1, '2022-05-11', 3);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (2, 1, '2022-04-25', 4);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (6, 4, '2022-05-12', 16);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (4, 7, '2022-06-07', 31);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (13, 3, '2022-04-22', 14);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (8, 9, '2022-05-18', 47);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (9, 9, '2022-05-19', 48);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (7, 6, '2022-04-30', 27);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (10, 7, '2022-06-03', 32);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (12, 4, '2022-05-12', 17);
insert into emprestimo (id_usuario, id_livro, data_emprestimo, id_exemplar) values (11, 6, '2022-04-30', 28);

/*--Listagem de amigos--*/

select * from usuario;


/*--Livros emprestados e seus respectivos usuários--*/

select u.nome, l.titulo, ex.id_exemplar, e.data_emprestimo from emprestimo as e
inner join usuario as u on u.id_usuario = e.id_usuario
inner join exemplares as ex on ex.id_exemplar = e.id_exemplar
inner join livro as l on l.id_livro = e.id_livro;

