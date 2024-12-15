--Criação de tabelas
CREATE TABLE Conselho (
    Tipo VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Profissional (
    NumRegistroProf SERIAL PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL,
    Conselho VARCHAR(50) not NULL, 
    Nome VARCHAR(100) NOT NULL,
    Tel VARCHAR(20),
    foreign key (Conselho) references Conselho(Tipo)
);

CREATE TABLE Prontuario (
    IDProntuario SERIAL PRIMARY KEY
);

CREATE TABLE Endereco (
    IDEndereco SERIAL PRIMARY KEY,
    CEP VARCHAR(50) NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    UF CHAR(2) NOT NULL 
);

CREATE TABLE Paciente (
    IDPaciente SERIAL PRIMARY KEY,
    IDProntuario INT,
    Nome VARCHAR(100) NOT NULL,
    DataNasc DATE NOT NULL,
    NomeMae VARCHAR(100) NOT NULL,
    Tel VARCHAR(20),
    FOREIGN KEY (IDProntuario) REFERENCES Prontuario(IDProntuario)
);

CREATE TABLE Plantao (
    IDPlantao SERIAL PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL,
    Data TIMESTAMP,
    IDPaciente INT NOT NULL,
    NumRegistroProf INT NOT NULL,
    FOREIGN KEY (IDPaciente) REFERENCES Paciente(IDPaciente),
    FOREIGN KEY (NumRegistroProf) REFERENCES Profissional(NumRegistroProf)
);

CREATE TABLE Consulta (
    IDConsulta SERIAL PRIMARY KEY,
    IDPaciente INT NOT NULL,
    NumRegistroProf INT NOT NULL,
    Data TIMESTAMP,
    FOREIGN KEY (IDPaciente) REFERENCES Paciente(IDPaciente),
    FOREIGN KEY (NumRegistroProf) REFERENCES Profissional(NumRegistroProf)
);

CREATE TABLE Aplicacao (
    IDAplicacao SERIAL PRIMARY KEY,
    NumRegistroProf INT NOT NULL,
    IDPlantao INT NOT NULL,
    IDConsulta INT NOT NULL,
    FOREIGN KEY (NumRegistroProf) REFERENCES Profissional(NumRegistroProf),
    FOREIGN KEY (IDPlantao) REFERENCES Plantao(IDPlantao),
    FOREIGN KEY (IDConsulta) REFERENCES Consulta(IDConsulta)
);

CREATE TABLE Paciente_Profissional (
    IDPaciente INT NOT NULL,
    NumRegistroProf INT NOT NULL,
    PRIMARY KEY (IDPaciente, NumRegistroProf),
    FOREIGN KEY (IDPaciente) REFERENCES Paciente(IDPaciente),
    FOREIGN KEY (NumRegistroProf) REFERENCES Profissional(NumRegistroProf)
);

CREATE TABLE Paciente_Endereco (
    IDPaciente INT NOT NULL,
    IDEndereco INT NOT NULL,
    PRIMARY KEY (IDPaciente, IDEndereco),
    FOREIGN KEY (IDPaciente) REFERENCES Paciente(IDPaciente),
    FOREIGN KEY (IDEndereco) REFERENCES Endereco(IDEndereco)
);

CREATE TABLE Prontuario_Profissional (
    IDProntuario INT NOT NULL,
    NumRegistroProf INT NOT NULL,
    PRIMARY KEY (IDProntuario, NumRegistroProf),
    FOREIGN KEY (IDProntuario) REFERENCES Prontuario(IDProntuario),
    FOREIGN KEY (NumRegistroProf) REFERENCES Profissional(NumRegistroProf)
);

CREATE TABLE Registro (
    IDRegistro SERIAL PRIMARY KEY,
    IDProntuario INT NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    FOREIGN KEY (IDProntuario) REFERENCES Prontuario(IDProntuario)
);

CREATE TABLE Prescricao (
    IDPrescricao SERIAL PRIMARY KEY,
    Data TIMESTAMP NOT NULL,
    NumRegistroProf INT NOT NULL,
    IDPaciente INT NOT NULL,
    FOREIGN KEY (NumRegistroProf) REFERENCES Profissional(NumRegistroProf),
    FOREIGN KEY (IDPaciente) REFERENCES Paciente(IDPaciente)
);

CREATE TABLE Profissional_Prescricao (
    NumRegistroProf INT NOT NULL,
    IDPrescricao INT NOT NULL,
    PRIMARY KEY (NumRegistroProf, IDPrescricao),
    FOREIGN KEY (NumRegistroProf) REFERENCES Profissional(NumRegistroProf),
    FOREIGN KEY (IDPrescricao) REFERENCES Prescricao(IDPrescricao)
);

CREATE TABLE Dieta (
    IDDieta SERIAL PRIMARY KEY,
    Conteudo TEXT NOT NULL
);

CREATE TABLE Prescricao_Dieta (
    IDPrescricao INT NOT NULL,
    IDDieta INT NOT NULL,
    PRIMARY KEY (IDPrescricao, IDDieta),
    FOREIGN KEY (IDPrescricao) REFERENCES Prescricao(IDPrescricao),
    FOREIGN KEY (IDDieta) REFERENCES Dieta(IDDieta)
);

CREATE TABLE Medicamentos (
    NRegistroAnvisa SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Prescricao_Medicamentos (
    IDPrescricao INT NOT NULL,
    NRegistroAnvisa INT NOT NULL,
    PRIMARY KEY (IDPrescricao, NRegistroAnvisa),
    FOREIGN KEY (IDPrescricao) REFERENCES Prescricao(IDPrescricao),
    FOREIGN KEY (NRegistroAnvisa) REFERENCES Medicamentos(NRegistroAnvisa)
);

CREATE TABLE Procedimentos (
    IDProcedimento SERIAL PRIMARY KEY,
    NomeProced VARCHAR(100) NOT NULL,
    Horario TIMESTAMP
);

CREATE TABLE Prescricao_Procedimento (
    IDPrescricao INT NOT NULL,
    IDProcedimento INT NOT NULL,
    PRIMARY KEY (IDPrescricao, IDProcedimento),
    FOREIGN KEY (IDPrescricao) REFERENCES Prescricao(IDPrescricao),
    FOREIGN KEY (IDProcedimento) REFERENCES Procedimentos(IDProcedimento)
);

CREATE TABLE Vacina (
    NomeVacina VARCHAR(100) PRIMARY KEY,
    DataValidade DATE NOT NULL
);

CREATE TABLE Procedimento_Vacina (
    IDProcedimento INT NOT NULL,
    NomeVacina VARCHAR(100) NOT NULL,
    PRIMARY KEY (IDProcedimento, NomeVacina),
    FOREIGN KEY (IDProcedimento) REFERENCES Procedimentos(IDProcedimento),
    FOREIGN KEY (NomeVacina) REFERENCES Vacina(NomeVacina)
);

CREATE TABLE Exame (
    IDExame SERIAL PRIMARY KEY,
    Conteudo TEXT NOT NULL
);

CREATE TABLE Procedimento_Exame (
    IDProcedimento INT NOT NULL,
    IDExame INT NOT NULL,
    PRIMARY KEY (IDProcedimento, IDExame),
    FOREIGN KEY (IDProcedimento) REFERENCES Procedimentos(IDProcedimento),
    FOREIGN KEY (IDExame) REFERENCES Exame(IDExame)
);

CREATE TABLE Curativo (
    Tipo VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Procedimento_Curativo (
    IDProcedimento INT NOT NULL,
    TipoCurativo VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDProcedimento, TipoCurativo),
    FOREIGN KEY (IDProcedimento) REFERENCES Procedimentos(IDProcedimento),
    FOREIGN KEY (TipoCurativo) REFERENCES Curativo(Tipo)
);

CREATE TABLE Sessao (
    Tipo VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Procedimento_Sessao (
    IDProcedimento INT NOT NULL,
    TipoSessao VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDProcedimento, TipoSessao),
    FOREIGN KEY (IDProcedimento) REFERENCES Procedimentos(IDProcedimento),
    FOREIGN KEY (TipoSessao) REFERENCES Sessao(Tipo)
);

CREATE TABLE Kit (
    IDKit SERIAL PRIMARY KEY,
    Insumos TEXT NOT NULL
);

CREATE TABLE Curativo_Kit (
    TipoCurativo VARCHAR(50) NOT NULL,
    IDKit INT NOT NULL,
    PRIMARY KEY (TipoCurativo, IDKit),
    FOREIGN KEY (TipoCurativo) REFERENCES Curativo(Tipo),
    FOREIGN KEY (IDKit) REFERENCES Kit(IDKit)
);