-- Consultas

-- Operações inclusas nesse script
-- Listar todos os clientes (com seus status)
-- Listar todos os clientes (com suas anotações)
-- Listar todos os lembretes de afazeres futuros
-- Buscar cliente específico (por id)
-- Buscar cliente específico (por cpf)
-- Buscar anotações de um cliente específico (por id)
-- Buscar anotações de um cliente específico (por cpf)
-- Buscar lembretes de um cliente específico (por id)
-- Buscar lembretes de um cliente específico (por cpf)

-- Listar todos os clientes (com seus status)
SELECT 
    c.id,
    c.nome,
    c.telefone,
    c.uf,
    c.cep,
    c.complemento,
    c.cpf,
    c.numero_processo,
    c.data_cadastro,
    s.descricao_status
FROM Cliente c
-- Join com a tabela StatusCliente, para usar a descrição de cada status de atendimento ao invés do código
JOIN StatusCliente s ON c.status_cliente = s.codigo
ORDER BY c.id ASC;

-- Listar todos os clientes (com suas anotações)
SELECT 
    c.id,
    c.nome,
    c.telefone,
    c.uf,
    c.cep,
    c.complemento,
    c.cpf,
    c.numero_processo,
    c.data_cadastro,
    a.id AS id_anotacao,
    a.descricao_anotacao,
    a.data_hora AS data_hora_anotacao
FROM Cliente c
JOIN Anotacao a ON c.id = a.id_cliente
-- Ordena pelo id, depois pela anotação mais recente
ORDER BY c.id ASC, a.data_hora DESC;

-- Listar todos os lembretes de afazeres futuros
SELECT
    c.id AS id_cliente,
    c.nome,
	l.id AS id_lembrete,
	l.data_hora AS data_hora_lembrete,
    l.descricao_lembrete
FROM Lembrete l
JOIN Cliente c ON l.id_cliente = c.id
-- Filtra somente reuniões e afazeres futuros
WHERE l.data_hora > NOW()
-- Ordena pelo lembrete mais próximo da data atual
ORDER BY l.data_hora;

-- Buscar cliente específico (por id)
SELECT 
    c.id,
    c.nome,
    c.telefone,
    c.uf,
    c.cep,
    c.complemento,
    c.cpf,
    c.numero_processo,
    c.data_cadastro,
    s.descricao_status
FROM Cliente c
JOIN StatusCliente s ON c.status_cliente = s.codigo
-- Especifica o ID para a busca
WHERE c.id = 1;

-- Buscar cliente específico (por cpf)
SELECT 
    c.id,
    c.nome,
    c.telefone,
    c.uf,
    c.cep,
    c.complemento,
    c.cpf,
    c.numero_processo,
	c.data_cadastro,
    s.descricao_status
FROM Cliente c
JOIN StatusCliente s ON c.status_cliente = s.codigo
-- Especifica o CPF para a busca
WHERE c.cpf = '12345678901';

-- Buscar anotações de um cliente específico (por id)
SELECT 
	c.id AS id_cliente,
    c.nome AS cliente,
    a.id AS id_anotacao,
    a.descricao_anotacao,
    a.data_hora
FROM Anotacao a
JOIN Cliente c ON a.id_cliente = c.id
-- Especifica o ID para a busca
WHERE a.id_cliente = 1;

-- Buscar anotações de um cliente específico (por cpf)
SELECT 
	c.id AS id_cliente,
    c.nome AS cliente,
    a.id AS id_anotacao,
    a.descricao_anotacao,
    a.data_hora
FROM Anotacao a
JOIN Cliente c ON a.id_cliente = c.id
-- Especifica o CPF para a busca
WHERE c.cpf = '12345678901';

-- Buscar lembretes de um cliente específico (por id)
SELECT 
	c.id AS id_cliente,
    c.nome AS cliente,
	l.id AS id_lembrete,
	l.data_hora AS data_hora_lembrete,
    l.descricao_lembrete
FROM Lembrete l
JOIN Cliente c ON l.id_cliente = c.id
-- Especifica o ID para a busca
WHERE l.id_cliente = 1;

-- Buscar lembretes de um cliente específico (por cpf)
SELECT 
	c.id AS id_cliente,
    c.nome AS cliente,
	l.id AS id_lembrete,
	l.data_hora AS data_hora_lembrete,
    l.descricao_lembrete
FROM Lembrete l
JOIN Cliente c ON l.id_cliente = c.id
-- Especifica o ID para a busca
WHERE c.cpf = '12345678901';