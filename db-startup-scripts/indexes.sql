--Consulta 1: Listar os nomes dos pacientes que possuem consulta agendada com o profissional de registro 
--número 2.
-- e --Consulta 4: Listar os nomes dos pacientes e os nomes dos profissionais que os atenderam em consultas.

   CREATE INDEX idx_consulta_numregistroprof ON Consulta (NumRegistroProf);
    CREATE INDEX idx_consulta_idpaciente ON Consulta (IDPaciente);
    CREATE INDEX idx_paciente_idpaciente ON Paciente (IDPaciente);

--Consulta 2: Mostrar os nomes dos profissionais e os tipos de plantões que eles realizaram.
   CREATE INDEX idx_plantao_numregistroprof ON Plantao (NumRegistroProf);
   CREATE INDEX idx_profissional_numregistroprof ON Profissional (NumRegistroProf);
   

--Consulta 3: Contar o número de pacientes atendidos por cada profissional.
--Os índices das tabelas Paciente e Profissional podem ser reaproveitados.   

--Consulta 5: Listar os nomes dos pacientes que receberam dieta específica em suas prescrições.   
   CREATE INDEX idx_prescricao_idpaciente ON Prescricao (IDPaciente);
   CREATE INDEX idx_prescricao_dieta_idprescricao ON Prescricao_Dieta (IDPrescricao);
   CREATE INDEX idx_dieta_iddieta ON Dieta (IDDieta);

--Consulta 6: Encontrar o número total de procedimentos realizados por tipo de procedimento.   
   CREATE INDEX idx_prescricao_procedimento_idprocedimento ON Prescricao_Procedimento (IDProcedimento);
   CREATE INDEX idx_procedimentos_idprocedimento ON Procedimentos (IDProcedimento);


--Consulta 7: Listar os nomes dos pacientes que moram em São Paulo.
--Indice composto nas colunas Cidade e UF da tabela Endereço
   CREATE INDEX idx_endereco_cidade_uf ON Endereco (Cidade, UF);
   CREATE INDEX idx_paciente_endereco_idpaciente ON Paciente_Endereco (IDPaciente);
  
--Consulta 8: Listar todas as consultas feitas por um determinado profissional.
--Compartilha os índices de Consulta e Paciente já criados para a Consulta 1 e Consulta 4. (Não é necessário adicionar novos índices.)
  

--Consulta 9: Listar todos os medicamentos prescritos com o nome do paciente.
--Os índices de Paciente_Profissional, Paciente, e Profissional cobrem essa consulta, já definidos em consultas anteriores. (Não é necessário adicionar novos índices.)
   

--Consulta 10: Listar todos os pacientes que têm mais de um endereço cadastrado.
--Outras consultas ja cobrem os indices necessários