-- Inserindo dados na tabela Conselho
INSERT INTO Conselho (Tipo) VALUES
('CRM'),
('COREN'),
('CREFITO'),
('CRN'),
('CRP');

-- Inserindo dados na tabela Prontuario
INSERT INTO Prontuario (IDProntuario) VALUES
(1), (2), (3), (4), (5);

-- Inserindo dados na tabela Paciente
INSERT INTO Paciente (IDPaciente, IDProntuario, Nome, DataNasc, NomeMae, Tel) VALUES
(1, 1, 'João da Silva', '1985-06-15', 'Maria da Silva', '123456789'),
(2, 2, 'Maria Souza', '1990-12-20', 'Ana Souza', '987654321'),
(3, 3, 'Pedro Oliveira', '1975-03-25', 'Beatriz Oliveira', '123123123'),
(4, 4, 'Ana Costa', '1982-07-30', 'Clara Costa', '456456456'),
(5, 5, 'Lucas Lima', '2000-09-10', 'Rita Lima', '789789789');

-- Inserindo dados na tabela Profissional
INSERT INTO Profissional (NumRegistroProf, Conselho, Tipo, Nome, Tel) VALUES
(1, 'CRM', 'Medico', 'Dr. Carlos Mendes', '1122334455'),
(2, 'COREN', 'Enfermeiro', 'Enf. Juliana Pereira', '2233445566'),
(3, 'CREFITO', 'Fisioterapeuta', 'Fisio. Ricardo Alves', '3344556677'),
(4, 'CRN', 'Nutricionista', 'Nutri. Fernanda Silva', '4455667788'),
(5, 'CRP', 'Psicologia', 'Psico. Marina Costa', '5566778899');

-- Inserindo dados na tabela Plantao
INSERT INTO Plantao (IDPlantao, Tipo, Data, IDPaciente, NumRegistroProf) VALUES
(1, 'Diurno', '2028-06-10 08:00:00', 1, 1),
(2, 'Noturno', '2028-06-10 20:00:00', 2, 2),
(3, 'Diurno', '2028-06-11 08:00:00', 3, 3),
(4, 'Noturno', '2028-06-11 20:00:00', 4, 4),
(5, 'Diurno', '2028-06-12 08:00:00', 5, 5);

-- Inserindo dados na tabela Consulta
INSERT INTO Consulta (IDConsulta, IDPaciente, NumRegistroProf, Data) VALUES
(1, 1, 1, '2028-09-10 10:00:00'),
(2, 2, 2, '2028-06-10 14:00:00'),
(3, 3, 3, '2028-06-11 09:00:00'),
(4, 4, 4, '2028-06-11 15:00:00'),
(5, 5, 5, '2028-06-12 11:00:00');

-- Inserindo dados na tabela Aplicacao
INSERT INTO Aplicacao (IDAplicacao, NumRegistroProf, IDPlantao, IDConsulta) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5);

-- Inserindo dados na tabela Paciente_Profissional
INSERT INTO Paciente_Profissional (IDPaciente, NumRegistroProf) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Endereco
INSERT INTO Endereco (IDEndereco, CEP, Rua, Numero, Bairro, Cidade, UF) VALUES
(1, '12345-678', 'Rua A', '10', 'Centro', 'São Paulo', 'SP'),
(2, '23456-789', 'Rua B', '20', 'Jardim', 'Rio de Janeiro', 'RJ'),
(3, '34567-890', 'Rua C', '30', 'Industrial', 'Belo Horizonte', 'MG'),
(4, '45678-901', 'Rua D', '40', 'Alto', 'Curitiba', 'PR'),
(5, '56789-012', 'Rua E', '50', 'Baixo', 'Porto Alegre', 'RS');

-- Inserindo dados na tabela Paciente_Endereco
INSERT INTO Paciente_Endereco (IDPaciente, IDEndereco) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Prontuario_Profissional
INSERT INTO Prontuario_Profissional (IDProntuario, NumRegistroProf) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Registro
INSERT INTO Registro (IDRegistro, IDProntuario, Tipo) VALUES
(1, 1, 'Consulta Inicial'),
(2, 2, 'Retorno'),
(3, 3, 'Exame de Rotina'),
(4, 4, 'Tratamento'),
(5, 5, 'Alta');

-- Inserindo dados na tabela Prescricao
INSERT INTO Prescricao (IDPrescricao, Data, NumRegistroProf, IDPaciente) VALUES
(1, '2024-06-10 09:00:00', 1, 1),
(2, '2024-06-10 13:00:00', 2, 2),
(3, '2024-06-11 08:30:00', 3, 3),
(4, '2024-06-11 14:30:00', 4, 4),
(5, '2024-06-12 10:30:00', 5, 5);

-- Inserindo dados na tabela Profissional_Prescricao
INSERT INTO Profissional_Prescricao (NumRegistroProf, IDPrescricao) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Dieta
INSERT INTO Dieta (IDDieta, Conteudo) VALUES
(1, 'Dieta hipocalórica'),
(2, 'Dieta hipercalórica'),
(3, 'Dieta rica em proteínas'),
(4, 'Dieta para hipertensão'),
(5, 'Dieta vegetariana');

-- Inserindo dados na tabela Prescricao_Dieta
INSERT INTO Prescricao_Dieta (IDPrescricao, IDDieta) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Medicamentos
INSERT INTO Medicamentos (NRegistroAnvisa, Nome, Tipo) VALUES
(1, 'Paracetamol', 'Analgésico'),
(2, 'Ibuprofeno', 'Anti-inflamatório'),
(3, 'Amoxicilina', 'Antibiótico'),
(4, 'Omeprazol', 'Antiácido'),
(5, 'Metformina', 'Antidiabético');

-- Inserindo dados na tabela Prescricao_Medicamentos
INSERT INTO Prescricao_Medicamentos (IDPrescricao, NRegistroAnvisa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Procedimentos
INSERT INTO Procedimentos (IDProcedimento, NomeProced, Horario) VALUES
(1, 'Exame de sangue', '2024-06-10 07:30:00'),
(2, 'Raio-X', '2024-06-10 09:30:00'),
(3, 'Eletrocardiograma', '2024-06-11 08:00:00'),
(4, 'Tomografia', '2024-06-11 10:00:00'),
(5, 'Ressonância magnética', '2024-06-12 07:30:00');

-- Inserindo dados na tabela Prescricao_Procedimento
INSERT INTO Prescricao_Procedimento (IDPrescricao, IDProcedimento) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Vacina
INSERT INTO Vacina (NomeVacina, DataValidade) VALUES
('Hepatite B', '2025-01-01'),
('Febre Amarela', '2026-02-01'),
('Tétano', '2027-03-01'),
('Gripe', '2029-09-01'),
('Covid-19', '2025-05-01');

-- Inserindo dados na tabela Procedimento_Vacina
INSERT INTO Procedimento_Vacina (IDProcedimento, NomeVacina) VALUES
(1, 'Hepatite B'),
(2, 'Febre Amarela'),
(3, 'Tétano'),
(4, 'Gripe'),
(5, 'Covid-19');

-- Inserindo dados na tabela Exame
INSERT INTO Exame (IDExame, Conteudo) VALUES
(1, 'Hemograma completo'),
(2, 'Radiografia de tórax'),
(3, 'ECG normal'),
(4, 'Tomografia com contraste'),
(5, 'Ressonância magnética cerebral');

-- Inserindo dados na tabela Procedimento_Exame
INSERT INTO Procedimento_Exame (IDProcedimento, IDExame) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserindo dados na tabela Curativo
INSERT INTO Curativo (Tipo) VALUES
('Simples'),
('Complexo');

-- Inserindo dados na tabela Procedimento_Curativo
INSERT INTO Procedimento_Curativo (IDProcedimento, TipoCurativo) VALUES
(1, 'Simples'),
(2, 'Simples'),
(3, 'Complexo'),
(4, 'Complexo'),
(5, 'Simples');

-- Inserindo dados na tabela Sessao
INSERT INTO Sessao (Tipo) VALUES
('Fisioterapia'),
('Terapia Ocupacional');

-- Inserindo dados na tabela Procedimento_Sessao
INSERT INTO Procedimento_Sessao (IDProcedimento, TipoSessao) VALUES
(1, 'Fisioterapia'),
(2, 'Fisioterapia'),
(3, 'Terapia Ocupacional'),
(4, 'Fisioterapia'),
(5, 'Terapia Ocupacional');

-- Inserindo dados na tabela Kit
INSERT INTO Kit (Insumos) VALUES
('Luvas, Gazes, Soro Fisiológico'),
('Esparadrapo, Tesoura, Seringa'),
('Atadura, Compressa, Antisséptico'),
('Micropore, Termômetro, Agulha'),
('Seringa, Cateter, Fita Métrica');

-- Inserindo dados na tabela Curativo_Kit
INSERT INTO Curativo_Kit (TipoCurativo, IDKit) VALUES
('Simples', 1),
('Simples', 2),
('Complexo', 3),
('Complexo', 4),
('Simples', 5);
