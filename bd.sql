create database livro_corrente
default character set utf8
default collate utf8_general_ci;

use livro_corrente;

create table redes(
    id_rede INT AUTO_INCREMENT,
    nome_rede VARCHAR(50),
    email_rede VARCHAR(50),
    cidade_rede VARCHAR(40),
    estado_rede CHAR(2),

    PRIMARY KEY (id_rede)
);

create table bibliotecas(
    id_biblioteca INT AUTO_INCREMENT,
    nome_biblioteca VARCHAR(50),
    email_biblioteca VARCHAR(50),
    telefone_biblioteca VARCHAR(20),
    linkRNBC_biblioteca VARCHAR(100),
    estado_biblioteca CHAR(2),
    cidade_biblioteca VARCHAR(40),
    bairro_biblioteca VARCHAR(40),
    logadouro_biblioteca VARCHAR(40),
    numero_biblioteca VARCHAR(20),

    PRIMARY KEY(id_biblioteca)
);

create table parceiros(
    id_parceiro INT AUTO_INCREMENT,
    nome_parceiro VARCHAR(50),
    cnpj_parceiro VARCHAR(20),
    estado_parceiro CHAR(2),
    cidade_parceiro VARCHAR(40),
    bairro_parceiro VARCHAR(40),
    logadouro_parceiro VARCHAR(40),
    numero_parceiro VARCHAR(20),

    PRIMARY KEY(id_parceiro)
);

create table voluntarios(
    id_voluntario INT AUTO_INCREMENT,
    usuario_voluntario VARCHAR(30),
    senha_voluntario VARCHAR(30),
    nome_voluntario VARCHAR(50),
    telefone_voluntario VARCHAR(20),
    email_voluntario VARCHAR(50),
    cpf_voluntario CHAR(11),
    bairro1_voluntario VARCHAR(40),
    bairro2_voluntario VARCHAR(40),
    bairro3_voluntario VARCHAR(40),

    PRIMARY KEY(id_voluntario)
);

create table funcionarios(
    id_funcionario INT AUTO_INCREMENT,
    usuario_funcionario VARCHAR(30),
    senha_funcionario VARCHAR(30),
    nome_funcionario VARCHAR(50),
    telefone_funcionario VARCHAR(20),
    email_funcionario VARCHAR(50),
    cpf_funcionario VARCHAR(11),
    atividade_funcionario TEXT,
    id_biblioteca_fk INT,

    PRIMARY KEY(id_funcionario),
    FOREIGN KEY(id_biblioteca_fk) REFERENCES bibliotecas(id_biblioteca)
);

create table pedidos(
    id_pedido INT AUTO_INCREMENT,
    numeroExemplar_pedido INT(2),
    capa_pedido VARCHAR(1000) DEFAULT "imagemPadrao.png",
    titulo_pedido VARCHAR(50),
    genero_pedido VARCHAR(50),
    autor_pedido VARCHAR(35),
    valido_pedido BIT DEFAULT 1,

    id_biblioteca_fk INT,
    id_funcionario_fk INT,


    PRIMARY KEY(id_pedido),
    FOREIGN KEY(id_biblioteca_fk) REFERENCES bibliotecas(id_biblioteca),
    FOREIGN KEY(id_funcionario_fk) REFERENCES funcionarios(id_funcionario)
);

create table rede_biblioteca(
	id_rede_fk INT,
    id_biblioteca_fk INT,
    
    FOREIGN KEY(id_rede_fk) REFERENCES redes(id_rede),
    FOREIGN KEY(id_biblioteca_fk) REFERENCES bibliotecas(id_biblioteca)
);




create view cards as 
select * from pedidos
inner join bibliotecas on id_biblioteca_fk=id_biblioteca;

create view infoRB as
Select * from rede_biblioteca
inner join bibliotecas on id_biblioteca_fk = id_biblioteca
inner join redes on id_rede_fk = id_rede;


INSERT INTO redes(nome_rede, email_rede, estado_rede, cidade_rede) VALUES 
("Mar de Leitores","mardeleitores@gmail.com", "RJ", "Paraty"),
("Rede Baixada Literária","baixadaliteraria2010@yahoo.com.br", "RJ", "Nova Iguaçu"),
("Tecendo Uma Rede de Leitura", "polotecendoumarededeleitura@gmail.com", "RJ", "Duque de Caxias");


INSERT INTO bibliotecas(nome_biblioteca, email_biblioteca, telefone_biblioteca, linkRNBC_biblioteca, estado_biblioteca, cidade_biblioteca, bairro_biblioteca, logadouro_biblioteca, numero_biblioteca)
VALUES 
("Casa Azul", "biblioteca@flip.org.br", "(24) 3371-7082", "https://rnbc.org.br/biblioteca/casa-azul/", "RJ", "Paraty", "Ilha das Cobras", "Rua João Ayres Martins", "132"),
("Ciranda de Tarituba", "bccirandadetarituba@gmail.com", "", "https://rnbc.org.br/biblioteca/ciranda-de-tarituba/", "RJ", "Paraty", "Tarituba", "Rua Joaquim Meira dos Santos", "9"),
("Colibri", "contato@colibri.org.br", "(24) 3371-4105", "https://rnbc.org.br/biblioteca/colibri/", "RJ", "Paraty", "Ponte Branca","Estrada Paraty Cunha",""),
("Itaxí-Mirim", "bibliotecaitaxi@gmail.com", "", "https://rnbc.org.br/biblioteca/itaxi-mirim/", "RJ", "Paraty", "Paraty-Mirim", "Aldeia Itaxî Guarani M'bya",""),
("Quilombo Campinho da Independência", "quilombodocampinho@gmail.com", "", "https://rnbc.org.br/biblioteca/quilombo-campinho-da-independencia/", "RJ", "Paraty", "Campinho", "Quilombo do Campinho", ""),
("Regina Celia Gama de Miranda", "itaeparatyrj@gmail.com", "(24) 3371-2601", "https://rnbc.org.br/biblioteca/regina-celia-gama-de-miranda-itae/", "RJ", "Paraty", "Parque da Mangueira", "Rua José do Patrocínio", "975"),
("Terra e Mar", "terraemarparaty@gmail.com", "", "https://rnbc.org.br/biblioteca/terra-e-mar-itema/", "RJ", "Paraty", "Corumbê", "Morro do Ditão", ""),

("Cantinho da Imaginação", "bccantinhodaimaginacao@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/cantinho-da-imaginacao/", "RJ", "Nova Iguaçu", "Jardim Iguaçu", " Rua Maria Tereza", "166"),
("Espaço de Leitura Nilo Sérgio", "", "", "https://rnbc.org.br/biblioteca/espaco-de-leitura-nila-sergio/", "RJ", "Nova Iguaçu", "Ouro Preto", "Rua Filipe Pereira", "341"),
("Jardim Alvorada", "bcjardimalvorada@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/jardim-alvorada/", "RJ", "Nova Iguaçu", "Jardim Alvorada", "Av. Abílio Augusto Távora", "120"),
("Jardim Primavera", "", "", "https://rnbc.org.br/biblioteca/jardim-primavera/", "RJ", "Nova Iguaçu", "Comendador Soares", "Rua Ministro Lafaiete de Andrade", "450"),
("Jota Rodrigues", "bcjotarodrigues@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/jota-rodrigues/", "RJ", "Nova Iguaçu", "Comendador Soares", "Rua São Luis", "78"),
("Judith Lacaz", "bcjudithlacaz@baixadaliteraria.org", "(21) 4104-2632", "https://rnbc.org.br/biblioteca/judith-lacaz/", "RJ", "Nova Iguaçu", "Ponto Chic", "Rua Pedro Cunha", "307"),
("Livro Social", "bclivrosocial@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/livro-social/", "RJ", "Nova Iguaçu", "Vila de Cava", "Estrada do Vilar", "284"),
("Mágica", "bcmagica@baixadaliteraria.org", "(21) 2698-3205", "https://rnbc.org.br/biblioteca/magica/", "RJ", "Nova Iguaçu", "Vila de Cava", "Rua Iracema", "156"),
("Dona Corujinha", "bcdonacorujinha@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/olhar-cultural/", "RJ", "Nova Iguaçu", "Cerâmica", "Rua Manoel Alegrio", "55-Bloco 4-aptº101"),
("Paulo Freire", "bcpaulofreire@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/paulo-freire/", "RJ", "Nova Iguaçu", "Rancho Fundo", "Av. Paranapiacaba", "129-Fundos"),
("Paulo Sacramento", "bcpaulosacramento@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/paulo-sacramento/", "RJ", "Nova Iguaçu", "Austin", "Rua Tufão", "170"),
("Thalita Rebouças", "bcthalitareboucas@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/thalita-reboucas/", "RJ", "Nova Iguaçu", "Amaral", "Estrada do Amaral", "791"),
("Três Marias", "bctresmarias@baixadaliteraria.org", "", "https://rnbc.org.br/biblioteca/tres-marias/", "RJ", "Nova Iguaçu", "Cabuçu", " Av. Severino Pereira da Silva", ""),
("União do Saber", "bcuniaodosaber@baixadaliteraria.org", "(21) 3488-0327", "https://rnbc.org.br/biblioteca/uniao-do-saber/", "RJ", "Nova Iguaçu", "Posse", "Rua Império", "465"),
("Ziraldo", "bcziraldo@baixadaliteraria.org", "(21) 2779-2552", "https://rnbc.org.br/biblioteca/ziraldo/", "RJ", "Nova Iguaçu", "Vila de Cava", "Rua Muniz Barreto", "1010"),

("Coletivo Tapete Literário", "tapeteliterario@gmail.com", "(21) 99912-1040", "https://rnbc.org.br/biblioteca/coletivo-tapete-literario/", "RJ", "Duque de Caxias", "Jardim Primavera", "Rua D", "15"),
("Espaço Literário Balaio de Leitura", "balaiodeleitura@gmail.com", "(21) 98111-5540", "https://rnbc.org.br/biblioteca/espaco-literario-balaio-de-leitura/", "RJ", "Duque de Caxias", "Jardim Primavera", "Rua Onofre Silva", ""),
("Espaço Literário Gigi Guerra", "saladeleituraluar@gmail.com", "(21) 98363-3956", "https://rnbc.org.br/biblioteca/espaco-literario-gigi-guerra/", "RJ", "Duque de Caxias", "Jardim Primavera", "Rua La Rouche Foucault", "151"),
("Josimar Coelho da Silva", "bcjosimarcoelhodasilva2020@gmail.com", "(21) 99430-6937", "https://rnbc.org.br/biblioteca/josimar-coelho-da-silva/", "RJ", "Duque de Caxias", "Jardim Primavera", "Rua Professor Hélio Rangel", "911"),
("MANNS", "mchocobim@yahoo.com.br", "(21) 97627-1091", "https://rnbc.org.br/biblioteca/manns/", "RJ", "Duque de Caxias", "Saracuruna", "Av. Carlos Maia", "8"),
("Varanda Literária Maria de Lourdes Miranda", "bcmlm123@gmail.com", "(21) 2677-0454", "https://rnbc.org.br/biblioteca/varada-literaria-maria-de-lourdes-miranda/", "RJ", "Duque de Caxias", "Saracuruna", "Rua José Fichiman", "655"),
("Vila Aracy", "bibliotecacomunitariavilaaracy@gmail.com", "(21) 3656-0702", "https://rnbc.org.br/biblioteca/vila-aracy/", "RJ","Duque de Caxias", "Parada Angélica", "Rua Américo Klarc Leite", "");

INSERT INTO rede_biblioteca(id_rede_fk,id_biblioteca_fk) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),

(2,8),
(2,9),
(2,10),
(2,11),
(2,12),
(2,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,18),
(2,19),
(2,20),
(2,21),
(2,22),

(3,23),
(3,24),
(3,25),
(3,26),
(3,27),
(3,28),
(3,29);


insert into pedidos(numeroExemplar_pedido, titulo_pedido, genero_pedido, id_biblioteca_fk) values
(1,"Harry Potter", "Ficção", 16),
(2,"Em Ritmo De Fuga", "Ação", 9),
(3,"Toy Story", "Infantil", 25),
(1,"A Fabrica de Chocolate", "Ficção", 23);