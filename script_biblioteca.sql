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
data_emprestimo date,
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
select * from livro;
select * from usuario;
select * from emprestimo;