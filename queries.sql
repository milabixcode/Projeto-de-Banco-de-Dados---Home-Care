-- Listar os nomes dos pacientes que possuem consulta agendada com o profissional de registro número 2
SELECT P.Nome
FROM Paciente P
JOIN Consulta C ON P.IDPaciente = C.IDPaciente
WHERE C.NumRegistroProf = 2;

--Mostrar os nomes dos profissionais e os tipos de plantões que eles realizaram
SELECT Pr.Nome, Pl.Tipo
FROM Profissional Pr
JOIN Plantao Pl ON Pr.NumRegistroProf = Pl.NumRegistroProf;

--Contar o número de pacientes atendidos por cada profissional
SELECT Pr.Nome, COUNT(P.IDPaciente) AS NumPacientes
FROM Profissional Pr
JOIN Paciente_Profissional PP ON Pr.NumRegistroProf = PP.NumRegistroProf
JOIN Paciente P ON PP.IDPaciente = P.IDPaciente
GROUP BY Pr.Nome;

--Listar os nomes dos pacientes e os nomes dos profissionais que os atenderam em consultas
SELECT P.Nome AS Paciente, Pr.Nome AS Profissional
FROM Paciente P
JOIN Consulta C ON P.IDPaciente = C.IDPaciente
JOIN Profissional Pr ON C.NumRegistroProf = Pr.NumRegistroProf;

-- Listar os nomes dos pacientes que receberam dieta específica em suas prescrições
SELECT Pa.Nome, D.Conteudo
FROM Paciente Pa
JOIN Prescricao Ps ON Pa.IDPaciente = Ps.IDPaciente
JOIN Prescricao_Dieta PD ON Ps.IDPrescricao = PD.IDPrescricao
JOIN Dieta D ON PD.IDDieta = D.IDDieta;

-- Encontrar o número total de procedimentos realizados por tipo de procedimento
SELECT Pr.NomeProced, COUNT(PP.IDPrescricao) AS NumProcedimentos
FROM Procedimentos Pr
JOIN Prescricao_Procedimento PP ON Pr.IDProcedimento = PP.IDProcedimento
GROUP BY Pr.NomeProced;

-- Listar os nomes dos pacientes que moram em São Paulo 
SELECT Pa.Nome
FROM Paciente Pa
JOIN Paciente_Endereco PE ON Pa.IDPaciente = PE.IDPaciente
JOIN Endereco E ON PE.IDEndereco = E.IDEndereco
WHERE E.Cidade = 'São Paulo' AND E.UF = 'SP';

-- Listar todas as consultas feitas por um determinado profissional:
SELECT c.IDConsulta, c.Data, p.Nome AS NomePaciente
FROM Consulta c
JOIN Paciente p ON c.IDPaciente = p.IDPaciente
WHERE c.NumRegistroProf = '1';

-- Listar todos os medicamentos prescritos com o nome do paciente:
SELECT p.Nome AS NomePaciente, pr.Nome AS NomeProfissional
FROM Paciente p
JOIN Paciente_Profissional pp ON p.IDPaciente = pp.IDPaciente
JOIN Profissional pr ON pp.NumRegistroProf = pr.NumRegistroProf;

-- Listar todos os pacientes que têm mais de um endereço cadastrado:
SELECT p.Nome, COUNT(pe.IDEndereco) AS NumEnderecos
FROM Paciente p
JOIN Paciente_Endereco pe ON p.IDPaciente = pe.IDPaciente
GROUP BY p.Nome
HAVING COUNT(pe.IDEndereco) > 1;

