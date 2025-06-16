-- Inserção de dados

-- Operações inclusas nesse script:
-- Inserir novo cliente (todos os dados)
-- Inserir novo cliente (somente os dados obrigatórios)
-- Inserir dados opcionais para um cliente já existente no banco (pelo id do cliente)
-- Inserir nova anotação
-- Inserir novo lembrete

-- Inserir novo cliente (todos os dados)
INSERT INTO Cliente (nome, telefone, uf, cep, complemento, cpf, numero_processo, status_cliente) VALUES
('Patrícia Oliveira', '71988776644', 'BA', '41610000', 'número 123', '36925814700', '2024X0014', 1);


-- Inserir novo cliente (somente os dados obrigatórios)
INSERT INTO Cliente (nome, telefone, uf, status_cliente) VALUES
('Bruno Almeida', '11944556677', 'SP', 1);

-- Inserir dados opcionais para um cliente já existente no banco (pelo id do cliente)
UPDATE Cliente
SET cep = '01311000',
    complemento = 'número 987',
    cpf = '74196385200',
    numero_processo = '2024X0015'
WHERE id = 15;

-- Inserir nova anotação
INSERT INTO Anotacao (id_cliente, descricao_anotacao) VALUES
(14, 'Cliente solicitou esclarecimento sobre o contrato.'),
(15, 'Foi realizada reunião de alinhamento inicial.');

-- Inserir novo lembrete
INSERT INTO Lembrete (id_cliente, data_hora, descricao_lembrete) VALUES
(14, '2025-07-13 10:00:00', 'Reunião para esclarecimentos.'),
(15, '2025-07-14 15:45:00', 'Reunião para esclarecimentos.');