create or replace
view compromissos_profissionais as (
select
	p.nome,
	p.numregistroprof,
	'Consulta' as tipo_compromisso,
	paciente.nome as paciente,
		c.data as "data"
from
		profissional p
inner join consulta c on
		c.numregistroprof = p.numregistroprof
inner join paciente on
	paciente.idpaciente = c.idpaciente
union all
select
	p.nome,
	p.numregistroprof,
	'Plantao' as tipo_compromisso,
	paciente.nome as paciente,
	"data"
from
	profissional p
inner join plantao on
		plantao.numregistroprof = p.numregistroprof
inner join paciente on
	paciente.idpaciente = plantao.idpaciente
);

create or replace
view dietas_dos_pacientes as (
select
	distinct on
	(pac.idpaciente)
	pac.nome as "Nome Paciente",
	d.conteudo as Dieta,
	prof.nome as "Profissional que prescreveu",
	to_char(p.data,
	'DD/MM/YYYY') as "Data da Prescricao"
from
	paciente pac
inner join prescricao p on
	p.idpaciente = pac.idpaciente
inner join profissional prof on
	prof.numregistroprof = p.numregistroprof
inner join prescricao_dieta pd on
	pd.idprescricao = p.idprescricao
inner join dieta d on
	d.iddieta = pd.iddieta
order by
	pac.idpaciente,
	p.data desc
	);
	
