## Procedures/Functions (DONE)

- procedure pra desmarcar consultas futuras
- funcao que converte um endereco em um texto no formato:
  - Rua X, Numero Y - Bairro, Cidade - UF (CEP)
- funcao que abrevia nomes
  - Camila Vieira Ferrari Correia -> C.V.F. Correia
- resumo_prescricao
  - procedimento
  - medicamento
  - dieta
- profissional_ausente - cancela os exames e plantoes entre os dias informados

## Views (DONE)

- compromissos_profissionais (consultas e plantoes)
- dietas_dos_pacientes

## triggers (DONE)

- trigger pra validar se o profissional esta vinculado ao conselho da profissao dele
- trigger pra garantir que um plantao ou consulta nao eh criado no passado
- trigger pra garantir que uma vacina vencida nao eh mais usada em novos procedimentos
