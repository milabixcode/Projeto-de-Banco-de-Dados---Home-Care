--Procedure que desmarca consultas futuras
--Precisa ser chamada diretamente por triggers ou usando call e não retorna nada
create or replace procedure remarca_consultas_futuras(data_atual date, nova_data date) as $$
begin
    update consulta
    set 
        data = case 
                  when nova_data is null then null
                  else nova_data
              end,
        status = case 
                    when nova_data is null then 'desmarcado'
                    else 'remarcado'
                 end
    where data = data_atual;
end;
$$ language plpgsql;

call remarca_consultas_futuras('2025-01-14', '2025-01-20');

-------------------

--Function que formata endereço para string
--Para cada linha da tabela endereco, a função endereco_completo é chamada, passando o valor da linha inteira como argumento (que é do tipo composto).
A função retorna o endereço formatado como uma string.
--Pode ser usada em uma consulta
create or replace function endereco_completo(endereco endereco) returns text as $$
begin
    return format('%s, Numero %s - %s, %s - %s (%s)', endereco.rua, endereco.numero, endereco.bairro, endereco.cidade, endereco.uf, endereco.cep);
end;
$$ language plpgsql;

select endereco_completo(endereco) from endereco;

-------------------

--Abrevia o nome completo. Ex: Maria Silva de Oliveira -> M. S. Oliveira
create or replace function abrevia_nome(nome text) returns text as $$
declare
    nome_abreviado text;
    nome_array text[];
    i int;
begin
    nome_array := string_to_array(nome, ' ');

    nome_abreviado := substring(nome_array[1], 1, 1) || '.';
    for i in 2..array_length(nome_array, 1) - 1 loop
		if nome_array[i] in ('de', 'da') then
			continue;
		end if;
        nome_abreviado := nome_abreviado || ' ' || substring(nome_array[i], 1, 1) || '.';
    end loop;

    nome_abreviado := nome_abreviado || ' ' || nome_array[array_length(nome_array, 1)];

    return nome_abreviado;
end;
$$ language plpgsql;

select abrevia_nome(nome) from paciente p;

-------------------


create or replace function resume_prescricao(id_prescricao int) returns text as $$
declare
    procedimentos text := '';
    medicamentos text := '';
    dietas text := '';
begin
    -- Resumir procedimentos
    -- Dado um id de prescrição ele concatena todos os nomes de procedimentos associados
    select string_agg(nomeproced, ', ') into procedimentos
    from procedimentos p
    join prescricao_procedimento pp on p.idprocedimento = pp.idprocedimento
    where pp.idprescricao = id_prescricao;

    -- Resumir medicamentos
    select string_agg(nome, ', ') into medicamentos
    from medicamentos m
    join prescricao_medicamentos pm on m.nregistroanvisa = pm.nregistroanvisa
    where pm.idprescricao = id_prescricao;

    -- Resumir dietas
    select string_agg(conteudo, ', ') into dietas
    from dieta d
    join prescricao_dieta pd on d.iddieta = pd.iddieta
    where pd.idprescricao = id_prescricao;

    return format('Procedimentos: %s; Medicamentos: %s;Dietas: %s;', procedimentos, medicamentos, dietas);
end;
$$ language plpgsql;

select resume_prescricao(idprescricao) from prescricao;

-------------------

-- Procedure que desmarca plantões e consultas de um profissional ausente dentro do período informado
create or replace procedure profissional_ausente(numregistroprof int, data_inicio timestamp, data_fim timestamp) as $$
begin
    update plantao
    set data = null
    where plantao.numregistroprof = profissional_ausente.numregistroprof
    and data between profissional_ausente.data_inicio and profissional_ausente.data_fim;

    update consulta
    set data = null
    where consulta.numregistroprof = profissional_ausente.numregistroprof
    and data between profissional_ausente.data_inicio and profissional_ausente.data_fim;
end;
$$ language plpgsql;

call profissional_ausente(1, '2024-10-01', '2025-12-01');
