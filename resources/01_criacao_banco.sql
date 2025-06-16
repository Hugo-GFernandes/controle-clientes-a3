-- Criação do banco de dados

-- Operações inclusas nesse script:
-- Criar tabela de status de atendimento do cliente
-- Criar tabela de clientes
-- Criar tabela de anotações vinculadas ao cliente
-- Criar tabela de lembretes vinculados ao cliente

CREATE DATABASE IF NOT EXISTS controle_clientes_a3;

-- DROP DATABASE para testes
-- DROP DATABASE controle_clientes_a3;

USE controle_clientes_a3;

-- Tabela de status de atendimento do cliente
CREATE TABLE IF NOT EXISTS StatusCliente(
    codigo INT PRIMARY KEY,
    descricao_status VARCHAR(30) NOT NULL
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS Cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone CHAR(11) NOT NULL,
    uf CHAR(2) NOT NULL CHECK (uf IN ('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 
                                  'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI',
                                  'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO')),
	cep VARCHAR(8),
	complemento VARCHAR(150),
    cpf CHAR(11) UNIQUE,
    numero_processo VARCHAR(20),
    status_cliente INT NOT NULL DEFAULT 1,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key vinculada ao status de atendimento do cliente
    CONSTRAINT fk_cliente_status_cliente
	FOREIGN KEY (status_cliente) REFERENCES StatusCliente(codigo)
);

-- Tabela de anotações vinculadas ao cliente
CREATE TABLE IF NOT EXISTS Anotacao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    descricao_anotacao TEXT NOT NULL,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_anotacao_id_cliente
	FOREIGN KEY (id_cliente) REFERENCES Cliente(id) ON DELETE CASCADE
);

-- Tabela de lembretes vinculados ao cliente
CREATE TABLE IF NOT EXISTS Lembrete(
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_cliente INT NOT NULL,
    data_hora DATETIME NOT NULL,
    descricao_lembrete VARCHAR(255),
    
    CONSTRAINT fk_lembrete_id_cliente
	FOREIGN KEY (id_cliente) REFERENCES Cliente(id) ON DELETE CASCADE
);