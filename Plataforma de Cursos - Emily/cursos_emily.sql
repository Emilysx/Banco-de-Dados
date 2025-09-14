CREATE DATABASE Cursos_emily;
USE Cursos_emily;

-- Criação das Tabelas 
CREATE TABLE Curso (
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT 
);

CREATE TABLE Professor (
	id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE Plano (
	id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    valor VARCHAR (255) NOT NULL,
    tipo ENUM ('Mensal', 'Anual')
);

CREATE TABLE Aluno (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    id_plano INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES Plano(id_plano)
);

CREATE TABLE Perfil(
	id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT UNIQUE,
    foto VARCHAR(255),
    biografia TEXT,
    data_nascimento DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

CREATE TABLE Modulo(
	id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    ordem INT NOT NULL,
    carga_horaria INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Inscricao(
	id_inscricao INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_inscricao DATE NOT NULL,
    situacao ENUM('ativa', 'concluida', 'trancada') NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
	FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Professor_Curso(
	id_professor_curso INT PRIMARY KEY AUTO_INCREMENT,
    id_professor INT NOT NULL,
    id_curso INT NOT NULL,
    papel ENUM('titular', 'tutor') NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
	FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Inserindo os dados 
INSERT INTO Curso (titulo, descricao) VALUES
	('Python para Iniciantes', 'Aprenda os fundamentos da linguagem Python, com exercícios práticos.'),
	('Desenvolvimento Web', 'Curso completo de HTML, CSS e JavaScript para iniciantes e intermediários.'),
	('Banco de Dados', 'Aprenda a modelar, criar e consultar bancos de dados relacionais usando SQL.');

INSERT INTO Professor (nome, email) VALUES
	('Ana Silva', 'ana.silva@email.com'),
	('Mariany Lima', 'mariany.lima@email.com'),
	('Márcia Scanacapra', 'marcia.scanacapra@email.com');

INSERT INTO Plano (nome, descricao, valor, tipo) VALUES
	('Básico', 'Acesso limitado aos cursos e materiais.', 'R$ 20,00', 'Mensal'),
	('Intermediário', 'Acesso completo aos cursos e materiais.', 'R$ 50,00', 'Mensal'),
	('Premium', 'Acesso completo + suporte personalizado e conteúdos extras.', 'R$ 100,00', 'Anual');

INSERT INTO Aluno (id_plano, nome, email) VALUES
	(1, 'Nicole Menegate', 'nicole.menegate@email.com'),
	(2, 'Vitoria Monteiro', 'vitoria.monteiro@email.com'),
	(3, 'Anthony Amaral', 'anthony.amaral@email.com');

INSERT INTO Perfil (id_aluno, foto, biografia, data_nascimento) VALUES
	(1, 'nicole.jpg', 'Apaixonado por tecnologia e programação.', '2006-06-06'),
	(2, 'vitoria.jpg', 'Curiosa sobre ciência de dados e inovação.', '2006-05-19'),
	(3, 'anthony.jpg', 'Gosta de desenvolvimento backend.', '2005-12-16');

INSERT INTO Modulo (id_curso, titulo, ordem, carga_horaria) VALUES
	(3, 'Modelagem de Dados', 1, 20),
	(3, 'Consultas SQL Básicas', 2, 25),
	(2, 'HTML e CSS', 1, 30),
    (1, 'Python - basico', 1, 15);
    
INSERT INTO Inscricao (id_aluno, id_curso, data_inscricao, situacao) VALUES
	(1, 1, '2025-09-14', 'ativa'),
	(2, 2, '2025-09-10', 'concluida'),
	(3, 3, '2025-09-12', 'ativa');
    
INSERT INTO Professor_Curso (id_professor, id_curso, papel) VALUES
	(1, 1, 'titular'),
	(2, 2, 'titular'),
	(3, 3, 'tutor');

-- Consultas basicas
SELECT * FROM aluno;
SELECT * FROM curso;
SELECT * FROM inscricao;
SELECT * FROM modulo;
SELECT * FROM perfil;
SELECT * FROM plano;
SELECT * FROM professor;
SELECT * FROM professor_curso;