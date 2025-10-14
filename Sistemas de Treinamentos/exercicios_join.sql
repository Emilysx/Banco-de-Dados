-- Atividade 14/10/2025 - Inner Join - Emily Gabrielle 
USE sistema_treinamentos;

-- Passo 2.1
SELECT alunos.nome as Alunos, turmas.nome as Turma
FROM alunos
INNER JOIN turmas ON turmas.id = alunos.turma_id;

-- Passo 2.2
SELECT atividades.descricao, turmas.nome as Turmas, materias.nome as Matéria, instrutores.nome as Instrutor
FROM atividades
INNER JOIN turmas ON turmas.id = atividades.turma_id
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id;

-- Passo 2.3
SELECT instrutores.nome as Instrutor, materias.nome as Matéria
FROM instrutores
INNER JOIN instrutor_materia ON instrutor_materia.instrutor_id = instrutores.id
INNER JOIN materias ON materias.id = instrutor_materia.materia_id;

-- Passo 2.4
SELECT atividades.descricao as Descrição, instrutores.nome as Instrutor, instrutores.especialidade as Especialidade
FROM atividades
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id; 

-- Passo 2.5
SELECT atividades.descricao, turmas.data_inicio, turmas.data_fim, materias.nome as Matéria
FROM atividades
INNER JOIN turmas ON turmas.id = atividades.turma_id
INNER JOIN materias ON materias.id = atividades.materia_id;

-- Passo 2.6
SELECT alunos.nome as Aluno, turmas.nome as Turma, atividades.descricao as Atividade, materias.nome as Matéria, instrutores.nome as Intrutor
FROM alunos
INNER JOIN turmas ON turmas.id = alunos.turma_id
INNER JOIN atividades ON atividades.turma_id = turmas.id
INNER JOIN materias ON materias.id = atividades.materia_id
INNER JOIN instrutores ON instrutores.id = atividades.instrutor_id;
