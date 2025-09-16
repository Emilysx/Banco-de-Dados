CREATE DATABASE manutencao_emily;
USE manutencao_emily;

-- Criação das tabelas
CREATE TABLE Equipamento(
	id_equipamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Setor(
	id_setor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Agendamento(
	id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_equipamento INT,
    FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento),
    tipo ENUM ('Corretivas','Preventivas') NOT NULL,
    data_proxima_manutencao DATE
);

CREATE TABLE Laudo_tecnico(
	id_laudo INT PRIMARY KEY AUTO_INCREMENT,
    obvervacao TEXT,
    data_laudo DATE,
    resultado VARCHAR(255) NOT NULL
);

CREATE TABLE Manutencao (
    id_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    id_equipamento INT,
    id_laudo INT,
    id_setor INT,
    id_agendamento INT NULL,
    status ENUM('Aberta','Em andamento','Concluída') NOT NULL,
    data_manutencao_concluida DATE,
    resultado VARCHAR(255),

    FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento),
    FOREIGN KEY (id_laudo) REFERENCES Laudo_tecnico(id_laudo),
    FOREIGN KEY (id_setor) REFERENCES Setor(id_setor),
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento)
);

CREATE TABLE Cadastro_peca (
    id_peca INT PRIMARY KEY AUTO_INCREMENT,
    nome_peca VARCHAR(255) NOT NULL,
    nome_fabricante VARCHAR(255) NOT NULL
);

CREATE TABLE Peca_usada (
    id_peca_usada INT PRIMARY KEY AUTO_INCREMENT,
    id_peca INT,
    id_manutencao INT,
    qtn_usada INT NOT NULL,
    FOREIGN KEY (id_peca) REFERENCES Cadastro_peca(id_peca),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id_manutencao)
);

CREATE TABLE Cadastro_tecnico (
    id_tecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE tecnico_manutencao (
    id_tecnico_manutencao INT PRIMARY KEY AUTO_INCREMENT,
    id_tecnico INT,
    id_manutencao INT,
    FOREIGN KEY (id_tecnico) REFERENCES Cadastro_tecnico(id_tecnico),
    FOREIGN KEY (id_manutencao) REFERENCES Manutencao(id_manutencao)
);

-- Inserir os dados
INSERT INTO Equipamento (nome) VALUES
	('Torno Mecânico'),
	('Furadeira Industrial'),
	('Esteira Transportadora');
    
INSERT INTO Setor (nome) VALUES
	('Produção'),
	('Manutenção'),
	('Logística');
    
INSERT INTO Cadastro_tecnico (nome, email, descricao) VALUES
	('Emily Gabrielle', 'emily.gabrielle@email.com', 'Especialista em mecânica industrial'),
	('Ana Clara', 'ana. clara@email.com', 'Técnica em automação e elétrica'),
	('Anthony Amaral', 'anthony.amaral@email.com', 'Experiência em manutenção preventiva');
    
INSERT INTO Cadastro_peca (nome_peca, nome_fabricante) VALUES
	('Rolamento', 'Bocsh'),
	('Correia', 'Bosch'),
	('Motor Elétrico', 'Bosch');

INSERT INTO Agendamento (id_equipamento, tipo, data_proxima_manutencao) VALUES
	(1, 'Preventivas', '2025-09-20'),
	(2, 'Preventivas', '2025-10-01'),
	(3, 'Corretivas', '2025-09-18');   
    
    
INSERT INTO Laudo_tecnico (obvervacao, data_laudo, resultado) VALUES
	('Troca de rolamento realizada com sucesso.', '2025-09-15', 'Concluída'),
	('Verificado desgaste na correia.', '2025-09-14', 'Aguardando peça'),
	('Reparo no motor concluído, equipamento liberado.', '2025-09-10', 'Concluída');


INSERT INTO manutencao (id_equipamento, id_laudo, id_setor, id_agendamento, status, data_manutencao_concluida, resultado) VALUES
	(1, 1, 2, 1, 'Concluída', '2025-09-15', 'Peça substituída'),
	(2, 2, 2, 2, 'Em andamento', NULL, 'Peça em falta'),
	(3, 3, 3, 3, 'Concluída', '2025-09-10', 'Motor reparado');


INSERT INTO tecnico_manutencao (id_tecnico, id_manutencao) VALUES
	(1, 1),
	(2, 2),
	(3, 3);


INSERT INTO peca_usada (id_peca, id_manutencao, qtn_usada) VALUES
	(1, 1, 2),
	(2, 2, 1),
	(3, 3, 1);

-- Buscas Simples
SELECT * FROM Equipamento;
SELECT * FROM Setor;
SELECT * FROM Agendamento;
SELECT * FROM Cadastro_tecnico;
SELECT * FROM Cadastro_peca;
SELECT * FROM Laudo_tecnico;
SELECT * FROM manutencao;
SELECT * FROM tecnico_manutencao;
SELECT * FROM peca_usada;