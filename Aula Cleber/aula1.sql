-- Database: aula1
-- DROP DATABASE IF EXISTS aula1;

-- CREATE TABLE Nivel (
-- 	id_nivel INT PRIMARY KEY,
-- 	descricao VARCHAR(90) NOT NULL

-- );

-- CREATE TABLE Curso (
-- 	id_curso INT PRIMARY KEY,
-- 	nome VARCHAR(90) NULL,
-- 	data_criacao DATE NULL,
-- 	id_nivel INT,
-- 	CONSTRAINT FK_Curso_Nivel FOREIGN KEY (id_nivel) REFERENCES Nivel (id_nivel)
-- );

-- ALTER TABLE Curso DROP COLUMN data_criacao;
-- ALTER TABLE Curso ADD COLUMN data_criacao_nova DATE;
-- SELECT * FROM Curso;

-- DROP TABLE Curso;
-- DROP TABLE Nivel;

-- Exercicio 2

CREATE TABLE Curso (
	id_curso INT PRIMARY KEY,
	nome CHAR(90) NULL,
	data_criacao DATE NULL
);

CREATE TABLE Disciplina (
	id_disciplina INT PRIMARY KEY,
	nome CHAR(90) NULL,
	carga_horaria int
);

CREATE TABLE Curso_Disciplina (
    id_curso INT,
    id_disciplina INT,
    CONSTRAINT PK_CursoDisciplina PRIMARY KEY (id_curso, codigo_disciplina),
    CONSTRAINT FK_CursoDisciplina_Curso FOREIGN KEY (id_disciplina) REFERENCES Curso (id_disciplina),
    CONSTRAINT FK_CursoDisciplina_Disciplina FOREIGN KEY (id_disciplina) REFERENCES Disciplina (id_disciplina)
);
💡 