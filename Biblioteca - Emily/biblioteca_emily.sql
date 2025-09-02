CREATE DATABASE biblioteca_emily;
USE biblioteca_emily;

CREATE TABLE Livro (
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    isbn VARCHAR (100) NOT NULL UNIQUE,
    decricao TEXT
);

CREATE TABLE Autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE,
    biografia TEXT
);

CREATE TABLE Usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    num_identificacao VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR (255) NOT NULL,
    data_cadastro DATE,
    nivel_associadado ENUM ("Bronze", "Prata", "Ouro")
);

CREATE TABLE Categoria (
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Livro_Autor (
	id_livro_autor INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);

CREATE TABLE Livro_Categoria (
	id_livro_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Emprestimo (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_livro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    data_devol_limite DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

INSERT INTO Livro (titulo, isbn, decricao) VALUES 
	("A Bela e a Fera", "978-0-111111-01-1", "Uma história de amor entre uma jovem e uma criatura encantada."),
	("O Pequeno Príncipe", "978-0-111111-02-8", "Um clássico infantil cheio de metáforas sobre amizade e vida."),
	("Alice no País das Maravilhas", "978-0-111111-03-5", "A aventura de Alice em um mundo mágico e curioso."),
	("Coraline", "978-0-111111-04-2", "A jornada de uma menina que descobre uma dimensão sombria."),
	("Peter Pan", "978-85-221-0290-3", "História do menino que não queria crescer."),
	("Pinóquio", "978-85-221-0107-4", "As aventuras do boneco de madeira que queria ser um menino de verdade."),
	("Cinderela", "978-85-221-0332-0", "O clássico conto da jovem que conquista seu lugar no baile."),
	("Branca de Neve e os Sete Anões", "978-85-221-0444-0", "A princesa perseguida por sua madrasta maldosa."),
	("Rapunzel", "978-85-221-0555-4", "A jovem de longos cabelos presa em uma torre."),
	("A Princesa e o Sapo", "978-85-221-0666-5", "História da princesa Tiana e do príncipe transformado em sapo.");
    
    
INSERT INTO Autor (nome, nascimento, biografia) VALUES
	("Gabrielle Suzanne","1695-11-28","scritora francesa, autora original do conto A Bela e a Fera"),
	("Antoine de Saint Exupéry","1900-06-29","Escritor e aviador francês, autor de obras marcantes como O Pequeno Príncipe."),
	("Lewis Carroll","1832-01-27","Escritor, matemático e fotógrafo inglês, conhecido pelo clássico Alice no País das Maravilhas."),
	("Neil Gaiman","1960-11-10","Escritor britânico de fantasia, terror e quadrinhos, autor de Coraline e Sandman."),
	("James Matthew Barrie","1860-05-09","Dramaturgo e novelista escocês, criador do personagem Peter Pan."),
	("Carlo Lorenzini","1826-11-24","Escritor e jornalista italiano, criador de As Aventuras de Pinóquio."),
	("Charles Perrault","1628-01-12","Escritor francês, famoso por reunir e adaptar contos como Cinderela e Chapeuzinho Vermelho."),
	("Irmãos Grimm - Jacob Grimm","1785-01-04","Filólogos e folcloristas alemães, responsáveis por coletar e popularizar contos como Branca de Neve e Rapunzel."),
	("Irmãos Grimm - Wilhelm Grimm","1786-02-24","Filólogos e folcloristas alemães, importantes para a preservação de contos de fadas."),
	("Elizabeth Dawson Baker","1952-09-16","Escritora norte-americana de literatura infantil e fantasia, autora de The Frog Princess, inspiração para a animação da Disney.");
    
INSERT INTO Usuario (nome, num_identificacao, email, data_cadastro, nivel_associadado) VALUES
	("Maria Oliveira", "U1001", "maria.oliveira@email.com", "2024-01-15", "Bronze"),
    ("João Silva", "U1002", "joao.silva@email.com", "2024-02-20", "Prata"),
    ("Carla Mendes", "U1003", "carla.mendes@email.com", "2024-05-25", "Prata"),
    ("Ana Souza", "U1004", "ana.souza@email.com", "2024-03-05", "Ouro"),
    ("Pedro Santos", "U1005", "pedro.santos@email.com", "2024-04-12", "Bronze"),
    ("Lucas Pereira", "U1006", "lucas.pereira@email.com", "2024-06-30", "Ouro"),
    ("Rafael Costa", "U1007", "rafael.costa@email.com", "2024-08-18", "Prata"),
    ("Juliana Alves", "U1008", "juliana.alves@email.com", "2024-09-01", "Ouro"),
    ("Gustavo Martins", "U1009", "gustavo.martins@email.com", "2024-10-22", "Bronze"),
    ("Fernanda Lima", "U1010", "fernanda.lima@email.com", "2024-07-10", "Bronze");
    
INSERT INTO Categoria (nome) VALUES
	("Conto de Fadas"),
	("Clássico Infantil"),
	("Fantasia"),
	("Aventura"),
	("Literatura Juvenil"),
	("Sátira"),
	("Terror Infantil"),
	("Romance Clássico"),
	("Mitologia e Lendas"),
	("Ficção Ilustrada");
    
INSERT INTO Livro_Autor (id_livro, id_autor) VALUES
	(1, 1),  
	(2, 2),  
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 8),
	(10, 10);
    
INSERT INTO Livro_Categoria (id_livro, id_categoria) VALUES
	(1, 1), 
	(2, 2),  
	(3, 2), 
	(4, 7), 
	(5, 4), 
	(6, 4),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 2);
    
INSERT INTO Emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao, data_devol_limite) VALUES
	(1, 1, '2025-08-01', '2025-08-15', '2025-08-20'),
	(2, 2, '2025-08-05', NULL, '2025-08-20'),     
	(3, 3, '2025-08-10', '2025-08-25', '2025-08-30'),  
	(4, 4, '2025-08-12', NULL, '2025-08-27'),        
	(5, 5, '2025-08-15', '2025-08-28', '2025-09-01'),
	(6, 6, '2025-08-18', '2025-09-02', '2025-09-05'), 
	(7, 7, '2025-08-20', NULL, '2025-09-04'),          
	(8, 8, '2025-08-22', '2025-09-03', '2025-09-06'),  
	(9, 9, '2025-08-25', NULL, '2025-09-09'),         
	(10, 10, '2025-08-28', NULL, '2025-09-12');       

SELECT * FROM Livro; 
SELECT nome, biografia from Autor;
SELECT nome, email FROM Usuario;
SELECT id_categoria, nome FROM Categoria;
SELECT id_livro, id_autor FROM Livro_Autor;
SELECT id_livro, id_categoria FROM Livro_categoria;
SELECT id_usuario, id_livro, data_emprestimo, data_devolucao FROM Emprestimo;
