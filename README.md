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
telefone varchar(15) not null,
cod_tipuser int not null,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE postagem ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE voluntario ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE doacao ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE comenta ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE curtir ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);

insert into tipo_usuario(desc_tipuser, cod_tipuser) values ("Apoiador", "01"), ("Visitante", "02"), ("Moderador","03");

insert into usuario(idade, nome, email, cod_usuario, telefone, cod_tipuser) values 
("32", "Vagner Souza", "wagnerzousa@gmail.com", "01", "+1-202-555-0139", "01"), 
("19", "Valinha", "valinhadaora@gmail.com", "02", "+1-202-555-0191", "02" ), 
("57", "Aldoberto Moura", "chiquinho@outlook.com", "03", "+1-202-555-0165", "03"), 
("19", "Greta Thunberg", "gretathunberg@gmail.com", "04", "+1-202-555-0114", "03" ), 
("23", "Maria Geovana", "mariagia@gmail.com", "05", "+1-202-555-0185", "01"),
("46", "Giornno Giovanna", "gigi@hotmail.com", "06", "+1-202-555-0119", "02"),
("34", "Juliano Gomes", "jugomes@gmail.com", "07", "+1-202-555-0147", "02"),
("34", "Felipe Neto", "felipeneto@gmail.com", "08", "+1-202-555-0145", "01"),
("21", "Gabriel Felicio", "gabf@gmail.com", "09", "+1-202-555-0527", "02"),
("25", "Yago Oliveira", "yagoliveira@gmail.com", "10", "+1-202-555-0249", "01")
;

insert into ong(email_ong, telefone_ong, nome_ong, cod_ong) VALUES
("instney@gmail.com", "+551334761111", "Instituto Neymar Jr", "01"),
("sosmataatlantica@gmail.com", "+554735350119", "Fundação SOS Mata Atlântica", "02"),
("vidamarinha@gmail.com", "+557434854093", "Salve Vida Aquatica", "03"),
("medsemfronteiras@gmail.com", "+554426448035", "Médicos sem fronteiras", "04"),
("fundacaobradesco@gmail.com", "+553472434191", "Fundação Bradesco", "05"),
("instnatura@gmail.com", "+555476835191", "Insituto Natura", "06"),
("isjb@gmail.com", "+557734308817", "ISJB", "07"),
("spdm@gmail.com", "+552849064181", "SPDM", "08"),
("intethos@gmail.com", "+555131845846", "Instituto Ethos", "09"),
("instambiente@gmail.com", "+555531010132", "Instituto do meio ambiente", "10");

insert into voluntario(cod_ong, cod_usuario, dt_voluntario) VALUES
("3", "5", "2011-06-25 23:59:59"),
("5", "10", "2013-03-10 05:23:27"),
("2", "8", "2016-02-29 23:56:17"),
("1", "6", "2013-06-13 20:41:12"),
("7", "2", "2022-03-15 19:56:58"),
("9", "9", "2021-01-07 17:14:43"),
("8", "7", "2019-12-25 14:48:11"),
("6", "1", "2022-05-06 00:23:29"),
("4", "3", "2021-08-28 21:37:16"),
("10", "4", "2009-04-30 14:39:57");

insert into cod_postagem(titulo_postagem, categoria, cod_postagem, texto_postagem, cod_usuario, cod_ong) VALUES
("", "", "", "", "1", "5"),
("", "", "", "", "2", "7"),
("", "", "", "", "6", "6"),
("", "", "", "", "", ""),
("", "", "", "", "", ""),
("", "", "", "", "", ""),
("", "", "", "", "", ""),
("", "", "", "", "", ""),
("", "", "", "", "", ""),
("", "", "", "", "", "");

insert into comenta(cod_postagem, cod_usuario, dathora_coment, texto_coment) VALUES
("1", "5", "2020-02-14 14:39:57", "muita coisa"),
("2", "1", "2022-11-19 14:39:57", "lorem ipsum"),
("3", "", "", ""),
("4", "", "", ""),
("5", "", "", ""),
("6", "", "", ""),
("7", "", "", ""),
("8", "", "", ""),
("9", "", "", ""),
("10", "", "", "");

insert into curtir (cod_postagem, cod_usuario, dathora_curtir) VALUES
("", "", ""),
