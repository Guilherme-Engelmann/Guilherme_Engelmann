CREATE DATABASE petshop_db;
USE petshop_db;

-- Tabela de Clientes
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    telefone CHAR(11) NOT NULL,
    email VARCHAR(120) NOT NULL
);

-- Tabela de Pets
CREATE TABLE Pet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    especie ENUM('Caninos','Felinos','Roedores','Exoticos') NOT NULL,
    porte ENUM('Pequeno','Medio','Grande') NOT NULL,
    nascimento DATE NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

-- Tabela de Serviços
CREATE TABLE Servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL UNIQUE,
    preco DECIMAL(10,2) NOT NULL CHECK (preco >= 0),
    duracao_min INT NOT NULL
);

-- Tabela de Agendamentos
CREATE TABLE Agendamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status ENUM('Agendado','Em andamento','Concluido') NOT NULL,
    pet_id INT NOT NULL,
    servico_id INT NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES Pet(id),
    FOREIGN KEY (servico_id) REFERENCES Servico(id)
);
