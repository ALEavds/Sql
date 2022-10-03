-- Database: trigger_hospital

-- DROP DATABASE IF EXISTS trigger_hospital;

CREATE DATABASE trigger_hospital
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
	create table pacientes(
    pacientes_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,	
    nome_paciente varchar(40) not null,
    sexo varchar (1),
    obito BIT
	);

create table profissionais(
    profissionais_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nomeProfissionais varchar(50),
	insertDate TIMESTAMP NOT NULL DEFAULT NOW()
    );

create table especialidades(
    especialidades_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    especialidade varchar(50),
	insertDate TIMESTAMP NOT NULL DEFAULT NOW()
);

create table consultas (
    id_consultas int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    especialidades_id int,
    pacientes_id int,
    profissionais_id int,
	insertDate TIMESTAMP NOT NULL DEFAULT NOW()
);



ALTER TABLE consultas
ADD CONSTRAINT FKEspecialidadeDaConsulta FOREIGN KEY
(especialidades_id)
REFERENCES
especialidades (especialidades_id);

ALTER TABLE consultas ADD COLUMN last_user_updated varchar(100);
ALTER TABLE consultas ADD COLUMN last_time_updated timestamp;

ALTER TABLE consultas
ADD CONSTRAINT FKProfissionalDaConsulta FOREIGN KEY
(profissionais_id)
REFERENCES profissionais(profissionais_id);

insert into pacientes (nome_paciente, sexo)
values ('henrique','f'), ('fernando','m'), ('nibi','m');

insert into profissionais(nomeProfissionais)
values ('Bruna'), ('Kauã'), ('Rafael'), ('');

insert into especialidades (especialidade)
values ('ginecologista'), ('urologista'), ('Cardiologista');

insert into consultas (especialidades_id, pacientes_id, profissionais_id)
values (2,2,1), (2,2,2), (3,3,3);

-- inserindo apenas pessoas do sexo masculino que vão passar no ginecologista
insert into consultas (especialidades_id, pacientes_id, profissionais_id)
values (1,2,2);

-- inserindo apenas pessoas do sexo feminino que vão passar no urologista
insert into consultas (especialidades_id, pacientes_id, profissionais_id)
values (2,1,1);

-- valor null pra paciente
insert into consultas (especialidades_id, profissionais_id)
values (1,1);

--valor null para especialidade
insert into consultas (pacientes_id, profissionais_id)
values (2,1);

--valor null para profissional
insert into consultas (especialidades_id, pacientes_id)
values (3,3);

select * from pacientes;
select * from profissionais;
select * from especialidades;
select * from consultas;

select c.id_consultas, pac.nome_paciente, p.nomeProfissionais, e.especialidade, c.insertDate, c.last_user_updated,c.last_time_updated
	from consultas as c
	inner join pacientes as pac on pac.pacientes_id = c.pacientes_id
	inner join especialidades as e on e.especialidades_id = c.especialidades_id
	inner join profissionais as p on p.profissionais_id = c.profissionais_id

CREATE TRIGGER ValidaDadosConsulta
	AFTER INSERT OR UPDATE ON consultas
	FOR EACH ROW
	EXECUTE PROCEDURE ValidaDadosConsulta();

CREATE TRiGGER verificaNull
AFTER INSERT OR UPDATE ON consultas
FOR EACH ROW
EXECUTE PROCEDURE verificaNull();


	
CREATE OR REPLACE FUNCTION ValidaDadosConsulta()
RETURNS TRIGGER AS $$
DECLARE
paciente_row	RECORD;
especialidade_row RECORD;
BEGIN

        SELECT INTO paciente_row
        *  FROM pacientes as p 
		where pacientes_id = NEW.pacientes_id;

        SELECT INTO especialidade_row
        *  FROM especialidades as e
		where especialidades_id = NEW.especialidades_id;

        IF paciente_row.sexo = 'm'
		AND especialidade_row.especialidade = 'ginecologista' THEN
           RAISE EXCEPTION 'A especialidade Ginecologista apenas para pacientes do sexo feminino';
        ELSEIF paciente_row.sexo = 'f' 
		AND especialidade_row.especialidade = 'urologista' THEN
           RAISE EXCEPTION 'A especialidade Urologista é apenas para pacientes do sexo masculino';
        END IF;
        
        
        --AUDITA MODIFICACAO 
        NEW.last_time_updated := current_timestamp;
        NEW.last_user_updated := paciente_row.nome_paciente;
	RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verificaNull()
RETURNS TRIGGER AS $null$
BEGIN

	
	IF NEW.pacientes_id IS NULL THEN
            RAISE EXCEPTION 'paciente não informado)';
        END IF;
        
        IF NEW.especialidades_id IS NULL THEN
            RAISE EXCEPTION 'especialidade não informada';
        END IF;

        IF NEW.profissionais_id IS NULL THEN
            RAISE EXCEPTION 'profissional não informado';
        END IF;
RETURN NEW;
END
$null$ LANGUAGE plpgsql;