
CREATE DATABASE heric_marcus;

USE heric_marcus;

CREATE TABLE tipo_usuario ( 
cod_tipuser int NOT NULL AUTO_INCREMENT, 
desc_tipuser varchar(250) not NULL, 
PRIMARY KEY (cod_tipuser)
);

CREATE TABLE midia ( 
titulo_midia varchar(100) not null, 
caminho_midia varchar(50) not null,
cod_midia int not null AUTO_INCREMENT UNIQUE, 
cod_postagem int not null UNIQUE, 
PRIMARY KEY (cod_midia) 
);

CREATE TABLE ong ( 
email_ong varchar(100) not null UNIQUE, 
telefone_ong varchar(15) not null UNIQUE, 
nome_ong varchar(100) not null UNIQUE, 
cod_ong int not null AUTO_INCREMENT UNIQUE, 
PRIMARY KEY (cod_ong) 
);

CREATE TABLE postagem ( 
titulo_postagem varchar(100) not null, 
categoria varchar(100), 
cod_postagem int not null PRIMARY KEY AUTO_INCREMENT UNIQUE, 
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
cod_usuario int not null unique PRIMARY KEY AUTO_INCREMENT,
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

insert into tipo_usuario(desc_tipuser) values ("Apoiador"), ("Visitante"), ("Moderador");

insert into usuario(idade, nome, email, telefone, cod_tipuser) values 
("32", "Vagner Souza", "wagnerzousa@gmail.com", "+1-202-555-0139", "01"), 
("19", "Valinha", "valinhadaora@gmail.com", "+1-202-555-0191", "02" ), 
("57", "Aldoberto Moura", "chiquinho@outlook.com", "+1-202-555-0165", "03"), 
("19", "Greta Thunberg", "gretathunberg@gmail.com", "+1-202-555-0114", "03" ), 
("23", "Maria Geovana", "mariagia@gmail.com", "+1-202-555-0185", "01"),
("46", "Giornno Giovanna", "gigi@hotmail.com", "+1-202-555-0119", "02"),
("34", "Juliano Gomes", "jugomes@gmail.com", "+1-202-555-0147", "02"),
("34", "Felipe Neto", "felipeneto@gmail.com", "+1-202-555-0145", "01"),
("21", "Gabriel Felicio", "gabf@gmail.com", "+1-202-555-0527", "02"),
("25", "Yago Oliveira", "yagoliveira@gmail.com", "+1-202-555-0249", "01");

insert into ong(email_ong, telefone_ong, nome_ong) VALUES
("instney@gmail.com", "+551334761111", "Instituto Neymar Jr"),
("sosmataatlantica@gmail.com", "+554735350119", "Fundação SOS Mata Atlântica"),
("vidamarinha@gmail.com", "+557434854093", "Salve Vida Aquatica"),
("medsemfronteiras@gmail.com", "+554426448035", "Médicos sem fronteiras"),
("fundacaobradesco@gmail.com", "+553472434191", "Fundação Bradesco"),
("instnatura@gmail.com", "+555476835191", "Insituto Natura"),
("isjb@gmail.com", "+557734308817", "ISJB"),
("spdm@gmail.com", "+552849064181", "SPDM"),
("intethos@gmail.com", "+555131845846", "Instituto Ethos"),
("instambiente@gmail.com", "+555531010132", "Instituto do meio ambiente");

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

insert into postagem(titulo_postagem, categoria, texto_postagem, cod_usuario, cod_ong) VALUES
("Problemas no meio ambiente", "Ambiente", "lorem ipsun", "1", "5"),
("Problemas no oceano", "Oceano", "lorem ipsum", "2", "7"),
("Desigualdades sociais", "Desigualdade", "loren ipsun", "6", "6"),
("Fome em África", "Fome", "loren ipsum", "5", "10"),
("Neymar", "Neymar", "Lorem ipsun", "9", "1"),
("Problemas no ensino brasileiro", "Ensino", "Lorem ipsum", "10", "9"),
("Queimadas na amazônia", "Ambiente", "Loren ipsun", "4", "2"),
("Aquecimento global", "Aquecimento Global", "Loren ipsum", "7", "3"),
("Preconceito contra LGBTQIA+", "Homofobia", "lorem Ipsun", "3", "8"),
("Lixo no oceano", "Oceano", "loren Ipsum", "8", "4");

insert into comenta(cod_postagem, cod_usuario, dathora_coment, texto_coment) VALUES
("1", "5", "2020-02-14 14:39:57", "mucho texto"),
("2", "1", "2013-05-01 12:09:28", "lorem ipsum"),
("3", "9", "2019-12-30 21:22:20", "loren ipsun"),
("4", "3", "2018-11-09 14:58:00", "lorem ipsun"),
("5", "10", "2015-07-13 16:32:48", "NEYMAR."),
("6", "4", "2002-04-01 10:20:30", "Lorem ipsum"),
("7", "2", "2020-09-02 05:11:31", "Loren ipsum"),
("8", "8", "2016-12-17 14:39:57", "Lorem ipsun"),
("9", "6", "2014-10-24 07:14:28", "Lorem ipsum"),
("10", "7", "2012-03-21 08:08:09", "looren ipsun");

insert into curtir (cod_postagem, cod_usuario, dathora_curtir) VALUES
("2", "1", "2012-10-01 07:15:30"),
("6", "5", "2010-01-20 14:39:12"),
("3", "4", "2015-03-15 22:10:00"),
("7", "7", "2020-02-12 10:41:32"),
("9", "3", "2022-05-29 01:49:24"),
("10", "10", "2014-12-26 10:10:35"),
("1", "9", "2011-09-23 18:29:25"),
("5", "2", "2010-10-27 05:26:57"),
("4", "8", "2020-11-06 00:42:19"),
("8", "6", "2014-02-02 00:00:01");

insert into midia (titulo_midia, caminho_midia, cod_postagem) VALUES
("esobreisso", "twitter", "9"),
("clima", "facebook", "2"),
("ajudar", "instagram", "4"),
("problemas", "youtube", "5"),
("situacao", "instagram", "10"),
("lorem", "youtube", "8"),
("ipsun", "youtube", "1"),
("titulomidiamtxt", "twitter", "3"),
("problema", "instagram", "7"),
("dificuldades", "youtube", "6");

insert into doacao (cod_ong, cod_usuario, dt_doacao, valor_doacao) VALUES
("4", "2", "2018-7-21", "2000000.10"),
("2", "7", "2013-4-13", "12987764.59"),
("7", "9", "2002-8-29", "127396.97"),
("10", "1", "2020-1-17", "15000000.00"),
("1", "6", "2017-6-27", "500659.43"),
("5", "3", "2010-9-4", "200321.78"),
("9", "10", "2008-5-28", "954612.22"),
("3", "8", "2022-2-7", "2980965.19"),
("6", "4", "1997-8-21", "789600.64"),
("8", "5", "2019-11-22", "70979809.34");
