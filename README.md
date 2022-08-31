# hericmarcusbandodedados
CREATE TABLE tipo_usuario ( 
desc_tipuser varchar(250), 
cod_tipuser int NOT NULL AUTO_INCREMENT, 
PRIMARY KEY (cod_tipuser) );

CREATE TABLE midia ( 
titulo_midia varchar(100) not null, 
caminho_midia varchar(50) not null, cod_midia int not null, 
cod_postagem int not null, 
PRIMARY KEY (cod_midia) 
);

CREATE TABLE ong ( 
email_ong varchar(100) not null UNIQUE, 
telefone_ong char(14) not null, nome_ong varchar(100) not null, 
cod_ong int not null, 
PRIMARY KEY (cod_ong) 
);

CREATE TABLE postagem ( 
titulo_postagem varchar(100) not null, 
categoria varchar(100), 
cod_postagem int not null PRIMARY KEY AUTO_INCREMENT, 
texto_postagem varchar(1000), 
cod_usuario int unique not null, 
cod_ong int unique not null, FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong) 
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

CREATE TABLE comenta (
cod_postagem int unique not null,
cod_usuario int unique not null,
dathora_coment timestamp,
texto_coment varchar(250),
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem)
);

CREATE TABLE curtir (
cod_postagem int unique not null,
cod_usuario int unique not null,
dathora_curtir timestamp,
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem)
);

CREATE TABLE usuario (
idade int not null,
nome varchar(100) not null,
email varchar(250) unique not null,
cod_usuario int not null PRIMARY KEY,
telefone varchar(14) not null,
cod_tipuser int not null,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE postagem ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE voluntario ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE doacao ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE comenta ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE curtir ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
