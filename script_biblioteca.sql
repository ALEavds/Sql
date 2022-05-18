drop table emprestimo;
drop table livro;
drop table usuario;

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
id_usuario integer,
id_livro integer,
data_emprestimo varchar(10),
constraint fk_UsuEmp foreign key (id_usuario) references usuario (id_usuario),
constraint fk_LivEmp foreign key (id_livro) references livro (id_livro)
);

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

insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (1, 2, '12/05');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (3, 3, '22/04');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (5, 1, '11/05');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (2, 5, '25/04');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (6, 4, '12/05');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (4, 7, '07/06');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (8, 9, '18/05');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (9, 10, '19/05');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (7, 6, '30/04');
insert into emprestimo (id_usuario, id_livro, data_emprestimo) values (10, 8, '03/06');






















select * from emprestimo as e
inner join usuario as u

where idade >= 18
;



/*
select * from livro;
select * from usuario;
select * from emprestimo;
*/
