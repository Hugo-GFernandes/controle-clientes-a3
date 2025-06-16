-- Exclusões de dados

-- Operações inclusas nesse script:
-- Excluir um cliente, junto de suas anotações e lembretes (pelo id do cliente)
-- Excluir um cliente, junto de suas anotações e lembretes (pelo cpf do cliente)
-- Excluir uma anotação (pelo id da anotação)
-- Excluir um lembrete (pelo id do lembrete)
-- Excluir todas as anotações de um cliente (pelo id do cliente)
-- Excluir todas as anotações de um cliente (pelo cpf do cliente)
-- Excluir todos os lembretes de um cliente (pelo id do cliente)
-- Excluir todos os lembretes de um cliente (pelo cpf do cliente)

-- Excluir um cliente, junto de suas anotações e lembretes (pelo id do cliente)
DELETE FROM Cliente
WHERE id = 2;

-- Excluir um cliente, junto de suas anotações e lembretes (pelo cpf do cliente)
DELETE FROM Cliente
-- Impede exclusão dos CPFs nulos
WHERE cpf = '12345678901' AND cpf IS NOT NULL;

-- Excluir uma anotação (pelo id da anotação)
DELETE FROM Anotacao
WHERE id = 3;

-- Excluir um lembrete (pelo id do lembrete)
DELETE FROM Lembrete
WHERE id = 5;

-- Excluir todas as anotações de um cliente (pelo id do cliente)
DELETE FROM Anotacao
WHERE id_cliente = 1;

-- Excluir todas as anotações de um cliente (pelo cpf do cliente)
DELETE FROM Anotacao
-- Uso de subquery para localizar o id do cliente usando o CPF
WHERE id_cliente = (SELECT id FROM Cliente WHERE cpf = '12345678901' AND cpf IS NOT NULL);

-- Excluir todos os lembretes de um cliente (pelo id do cliente)
DELETE FROM Lembrete
WHERE id_cliente = 1;

-- Excluir todos os lembretes de um cliente (pelo cpf do cliente)
DELETE FROM Lembrete
-- Uso de subquery para localizar o id do cliente usando o CPF
WHERE id_cliente = (SELECT id FROM Cliente WHERE cpf = '12345678901' AND cpf IS NOT NULL);