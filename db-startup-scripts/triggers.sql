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

create or replace function valida_data_compromisso() returns trigger as $$
begin
    if new.data < now() then
        raise exception 'Data do compromisso nao pode ser no passado';
    end if;

    return new;
end;
$$ language plpgsql;

create or replace trigger valida_data_plantao
before insert or update on plantao
for each row
execute function valida_data_compromisso();

create or replace trigger valida_data_consulta
before insert or update on consulta
for each row
execute function valida_data_compromisso();

-------------------


-- trigger pra garantir que uma vacina vencida nao eh mais usada em novos procedimentos

create or replace function valida_vacina_vencida_em_procedimento() returns trigger as $$
begin
    if exists (
        select 1
        from vacina
        where idvacina = new.idvacina
        and data_vencimento < now()
    ) then
        raise exception 'Vacina vencida nao pode ser aplicada';
    end if;

    return new;
end;
$$ language plpgsql;

create or replace trigger valida_vacina_vencida
before insert or update on Procedimento_Vacina
for each row
execute function valida_vacina_vencida_em_procedimento();


-------------------


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
