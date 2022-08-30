# hericmarcusbandodedados
CREATE TABLE tipo_usuario (
desc_tipuser varchar(250),
cod_tipuser int NOT NULL AUTO_INCREMENT,
 PRIMARY KEY (cod_tipuser)
);

CREATE TABLE midia (
titulo_midia varchar(100) not null,
caminho_midia varchar(50) not null,
cod_midia int not null,
cod_postagem int not null,
PRIMARY KEY (cod_midia)
);

CREATE TABLE ong (
email_ong varchar(100) not null UNIQUE,
telefone_ong char(14) not null,
nome_ong varchar(100) not null,
cod_ong int not null,
PRIMARY KEY (cod_ong)
);

CREATE TABLE postagem (
titulo_postagem varchar(100) not null,
categoria varchar(100),
cod_postagem int not null PRIMARY KEY AUTO_INCREMENT,
texto_postagem varchar(1000),
cod_usuario int unique not null,
cod_ong int unique not null,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong)
);

CREATE TABLE voluntario (
cod_ong int unique not null,
cod_usuario int unique not null,
dt_voluntario DATE,
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong)
);

CREATE TABLE doacao (
cod_ong int unique not null,
cod_usuario int unique not null,
dt_doacao date,
valor_doacao decimal(10,2),
FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong)
);
