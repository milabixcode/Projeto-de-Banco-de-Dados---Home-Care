-- Função usada por um trigger que valida se o conselho bate com a profissão
create or replace
function valida_profissional_conselho()
returns trigger as $$
begin
    if (new.conselho,
new.tipo) not in (
('CRM', 'Medico'),
('COREN', 'Enfermeiro'),
('CREFITO', 'Fisioterapeuta'),
('CRN', 'Nutricionista'),
('CRP', 'Psicologia')
) then
        raise exception 'O profissional nao esta vinculado ao conselho de sua profissao';
end if;

return new;
end;

$$ language plpgsql;
-- Trigger que executa a validação antes do insert ou update na tabela profissional
create or replace
trigger valida_profissional_conselho
before
insert
	or
update
	on
	profissional
for each row
execute function valida_profissional_conselho();

-------------------

-- Função que valida se a data é válida
create or replace function valida_data_compromisso() returns trigger as $$
begin
    if new.data < now() then
        raise exception 'Data do compromisso nao pode ser no passado';
    end if;

    return new;
end;
$$ language plpgsql;
-- Trigger que executa a validação antes de um insert ou update na tabela plantão
create or replace trigger valida_data_plantao
before insert or update on plantao
for each row
execute function valida_data_compromisso();
-- Trigger que executa a validação antes de um insert ou update na tabela consulta
create or replace trigger valida_data_consulta
before insert or update on consulta
for each row
execute function valida_data_compromisso();

-------------------

-- Função que checa se a data de validade passou ou não
create or replace
function valida_vacina_vencida_em_procedimento() returns trigger as $$
begin
    if exists (
select
	1
from
	vacina
where
	nomevacina = new.nomevacina
	and datavalidade < now()
    ) then
        raise exception 'Vacina vencida nao pode ser aplicada';
end if;

return new;
end;

$$ language plpgsql;

-- Trigger pra garantir que uma vacina vencida nao é mais usada em novos procedimentos
create or replace
trigger valida_vacina_vencida
before
insert
	or
update
	on
	Procedimento_Vacina
for each row
execute function valida_vacina_vencida_em_procedimento();
