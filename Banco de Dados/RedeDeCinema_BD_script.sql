create database if not exists rededecinema_bd;
use rededecinema_bd;

CREATE TABLE IF NOT EXISTS Filme(
    tituloTraduzido char(50) not null PRIMARY KEY,
    tituloOriginal char(50),
    diretor char(35) not null,
    anoDeLancamento date not null,
    atores char(200),
    tipo3d2d char(2) not null,
    legendado boolean not null,
    sinopse char(250),
    genero int not null,
    faixaEtaria tinyint not null
);

CREATE TABLE IF NOT EXISTS  SalasCinema (
    nomeSala char(100) not null PRIMARY KEY,
    capacidade INTEGER not null,
    tipo varchar(2) not null,
    shopping char(30) not null
);

CREATE TABLE IF NOT EXISTS  Ingresso (
    numeroIngresso int not null auto_increment PRIMARY KEY,
    dataHoraVenda datetime not null,
    salaDeExibicao char(100) not null,
    filme char(50) not null,
    tipoDeIngresso int not null,
    valorIngresso decimal(3,2) not null,
    formaPagamento int not null,
    dataHoraExibicao datetime not null,
    shoppingComprado char(30) not null
);

CREATE TABLE IF NOT EXISTS  Funcionario (
    carteiraTrabalho varchar(11) not null PRIMARY KEY,
    nome varchar(40)not null,
    dataDeAdmissao date not null,
    salario decimal(7,2) not null,
    localTrabalho char(30)not null
);

CREATE TABLE IF NOT EXISTS  Propaganda (
    codigo int not null auto_increment PRIMARY KEY,
    nome char(40),
    agencia char(40) not null,
    faixaEtaria tinyint not null
);

CREATE TABLE IF NOT EXISTS  Sessao (
    S_tituloTraduzido char(50) not null,
    S_nomeSala char(100) not null,
    horario time not null,
    codProgramacao int not null auto_increment PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS  Premios (
    filmeIndicado char(50) not null,
    premioIndicado int not null,
    GanhouPremio boolean
);

CREATE TABLE IF NOT EXISTS  ProgramacaoProp (
    codigoProp int not null,
    CodProgramacao int not null
);

CREATE TABLE IF NOT EXISTS  Shopping (
    nome char(30) not null PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS  genero (
    cod_genero int not null auto_increment PRIMARY KEY,
    genero varchar(20) not null
);

CREATE TABLE IF NOT EXISTS  TipoPagamento (
    cod_tipo_pagamento int not null auto_increment PRIMARY KEY,
    tipo_Pagamento varchar(20) not null
);

CREATE TABLE IF NOT EXISTS  Turnos (
    cod_Turno int not null auto_increment PRIMARY KEY,
    entrada time not null,
    saida time not null
);

CREATE TABLE IF NOT EXISTS  Alocacao_turnos (
    cod_turno int not null,
    cod_funcao int not null,
    cod_funcionario varchar(11) not null
);

CREATE TABLE IF NOT EXISTS  funcao (
    cod_Funcao int not null auto_increment PRIMARY KEY,
    tipoFuncao varchar(20) not null
);

CREATE TABLE IF NOT EXISTS  tipoIndicacao (
    cod_Premios int not null auto_increment PRIMARY KEY,
    tipoPremiacao char(50) not null
);

CREATE TABLE IF NOT EXISTS  TipoIngresso (
    cod_tipo_ingresso int not null auto_increment PRIMARY KEY,
    tipo_ingresso char(20) not null
);
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (genero)
    REFERENCES genero (cod_genero);
 
ALTER TABLE SalasCinema ADD CONSTRAINT FK_SalasCinema_2
    FOREIGN KEY (shopping)
    REFERENCES Shopping (nome);
 
ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_2
    FOREIGN KEY (shoppingComprado)
    REFERENCES Shopping (nome);
 
ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_3
    FOREIGN KEY (formaPagamento)
    REFERENCES TipoPagamento (cod_tipo_pagamento);
 
ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_4
    FOREIGN KEY (tipoDeIngresso)
    REFERENCES TipoIngresso (cod_tipo_ingresso);
 
ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_5
    FOREIGN KEY (salaDeExibicao)
    REFERENCES SalasCinema (nomeSala);
 
ALTER TABLE Ingresso ADD CONSTRAINT FK_Ingresso_6
    FOREIGN KEY (filme)
    REFERENCES Filme (tituloTraduzido);
 
ALTER TABLE Funcionario ADD CONSTRAINT FK_Funcionario_2
    FOREIGN KEY (localTrabalho)
    REFERENCES Shopping (nome);
 
ALTER TABLE Sessao ADD CONSTRAINT FK_Sessao_1
    FOREIGN KEY (S_tituloTraduzido)
    REFERENCES Filme (tituloTraduzido)
    ON DELETE NO ACTION;
 
ALTER TABLE Sessao ADD CONSTRAINT FK_Sessao_2
    FOREIGN KEY (S_nomeSala)
    REFERENCES SalasCinema (nomeSala)
    ON DELETE NO ACTION;
 
ALTER TABLE Premios ADD CONSTRAINT FK_Premios_1
    FOREIGN KEY (filmeIndicado)
    REFERENCES Filme (tituloTraduzido);
 
ALTER TABLE Premios ADD CONSTRAINT FK_Premios_2
    FOREIGN KEY (premioIndicado)
    REFERENCES tipoIndicacao (cod_Premios);
 
ALTER TABLE ProgramacaoProp ADD CONSTRAINT FK_ProgramacaoProp_1
    FOREIGN KEY (codigoProp)
    REFERENCES Propaganda (codigo);
 
ALTER TABLE ProgramacaoProp ADD CONSTRAINT FK_ProgramacaoProp_2
    FOREIGN KEY (CodProgramacao)
    REFERENCES Sessao (codProgramacao);
 
ALTER TABLE Alocacao_turnos ADD CONSTRAINT FK_Alocacao_turnos_1
    FOREIGN KEY (cod_turno)
    REFERENCES Turnos (cod_Turno);
 
ALTER TABLE Alocacao_turnos ADD CONSTRAINT FK_Alocacao_turnos_2
    FOREIGN KEY (cod_funcao)
    REFERENCES funcao (cod_Funcao);
 
ALTER TABLE Alocacao_turnos ADD CONSTRAINT FK_Alocacao_turnos_3
    FOREIGN KEY (cod_funcionario)
    REFERENCES Funcionario (carteiraTrabalho);