use db_atividade_view;
/*
1. Exibir lista de alunos e seus cursos
Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.
*/
CREATE VIEW Alunos_Cursos AS
SELECT aluno.nome AS nome_aluno, curso.nome AS nome_curso, disciplina.nome AS nome_disciplina
FROM aluno
JOIN matricula ON aluno.id_aluno = matricula.id_aluno
JOIN disciplina ON matricula.id_disciplina = disciplina.id_disciplina
JOIN curso ON disciplina.id_curso = curso.id_curso;

select * from Alunos_Cursos;
/*
2. Exibir total de alunos por disciplina
Crie uma view que mostre o nome das disciplinas e a quantidade de alunos matriculados em cada uma.
*/
CREATE VIEW Total_Alunos_Por_Disciplina AS
SELECT disciplina.nome AS Nome_Disciplina, COUNT(matricula.id_aluno) AS Total_Alunos
FROM disciplina
JOIN matricula ON disciplina.id_disciplina = matricula.id_disciplina
GROUP BY disciplina.nome;

select * from Total_Alunos_Por_Disciplina;
/*
3. Exibir alunos e status das suas matrículas
Crie uma view que mostre o nome dos alunos, suas disciplinas e o status da matrícula (Ativo, Concluído, Trancado).
*/
CREATE VIEW Alunos_Status_Matricula AS
SELECT aluno.nome AS Nome_Aluno, disciplina.nome AS Nome_Disciplina, matricula.status AS Status_Matricula
FROM aluno
JOIN matricula ON aluno.id_aluno = matricula.id_aluno
JOIN disciplina ON matricula.id_disciplina = disciplina.id_disciplina;

select * from Alunos_Status_Matricula;
/*
4. Exibir professores e suas turmas
Crie uma view que mostre o nome dos professores e as disciplinas que eles lecionam, com os horários das turmas.
*/
CREATE VIEW Professores_Turmas AS
SELECT professor.nome AS Nome_Professor, disciplina.nome AS Nome_Disciplina, turma.horario AS Horario_Turma
FROM professor
JOIN turma ON professor.id_professor = turma.id_professor
JOIN disciplina ON turma.id_disciplina = disciplina.id_disciplina;

select * from Professores_Turmas;
/*
5. Exibir alunos maiores de 20 anos
Crie uma view que exiba o nome e a data de nascimento dos alunos que têm mais de 20 anos.
*/
CREATE VIEW Alunos_Maiores_20 AS
SELECT aluno.nome AS Nome_Aluno, aluno.data_nascimento AS Data_Nascimento
FROM aluno
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;

select * from ALunos_Maiores_20;
/*
6. Exibir disciplinas e carga horária total por curso
Crie uma view que exiba o nome dos cursos, a quantidade de disciplinas associadas e a carga horária total de cada curso.
*/

CREATE VIEW Carga_Horaria_Curso AS
SELECT curso.nome AS Nome_Curso, COUNT(disciplina.id_disciplina) AS Total_Disciplinas, SUM(curso.carga_horaria) AS Carga_Horaria_Total
FROM curso
JOIN disciplina ON curso.id_curso = disciplina.id_curso
GROUP BY curso.nome;

select * from Carga_horaria_curso;
/*
7. Exibir professores e suas especialidades
Crie uma view que exiba o nome dos professores e suas especialidades.
*/
CREATE VIEW Professores_Especialidades AS
SELECT professor.nome AS Nome_Professor, professor.especialidade AS Especialidade
FROM professor;

select * from Professores_Especialidades;

/*
8. Exibir alunos matriculados em mais de uma disciplina
Crie uma view que mostre os alunos que estão matriculados em mais de uma disciplina.
*/
CREATE VIEW Alunos_Mais_De_Uma_Disciplina AS
SELECT aluno.nome AS Nome_Aluno, COUNT(matricula.id_disciplina) AS Disciplinas_Matriculadas
FROM aluno
JOIN matricula ON aluno.id_aluno = matricula.id_aluno
GROUP BY aluno.nome
HAVING COUNT(matricula.id_disciplina) > 1;

select * from Alunos_Mais_De_Uma_Disciplina;
/*
9. Exibir alunos e o número de disciplinas que concluíram
Crie uma view que exiba o nome dos alunos e o número de disciplinas que eles concluíram.
*/
CREATE VIEW Alunos_Disciplinas_Concluidas AS
SELECT aluno.nome AS Nome_Aluno, COUNT(matricula.id_disciplina) AS Disciplinas_Concluidas
FROM aluno
JOIN matricula ON aluno.id_aluno = matricula.id_aluno
WHERE matricula.status = 'Concluído'
GROUP BY aluno.nome;

select * from Alunos_Disciplinas_Concluidas;
/*
10. Exibir todas as turmas de um semestre específico
Crie uma view que exiba todas as turmas que ocorrem em um determinado semestre (ex.: 2024.1).
*/
CREATE VIEW Turmas_Semestre AS
SELECT turma.id_turma AS Turma_ID, disciplina.nome AS Nome_Disciplina, turma.horario AS Horario_Turma
FROM turma
JOIN disciplina ON turma.id_disciplina = disciplina.id_disciplina
WHERE turma.semestre = '2024.1';

select * from Turmas_Semestre;
/*
11. Exibir alunos com matrículas trancadas
Crie uma view que exiba o nome dos alunos que têm matrículas no status "Trancado".
*/
CREATE VIEW Alunos_Matricula_Trancada AS
SELECT aluno.nome AS Nome_Aluno
FROM aluno
JOIN matricula ON aluno.id_aluno = matricula.id_aluno
WHERE matricula.status = 'Trancado';

select * from Alunos_Matricula_trancada;
/*
12. Exibir disciplinas que não têm alunos matriculados
Crie uma view que exiba as disciplinas que não possuem alunos matriculados.
*/
CREATE VIEW Disciplinas_Sem_Alunos AS
SELECT disciplina.nome AS Nome_Disciplina
FROM disciplina
LEFT JOIN matricula ON disciplina.id_disciplina = matricula.id_disciplina
WHERE matricula.id_aluno IS NULL;

select * from Disciplinas_Sem_Alunos;
/*
13. Exibir a quantidade de alunos por status de matrícula
Crie uma view que exiba a quantidade de alunos para cada status de matrícula (Ativo, Concluído, Trancado).
*/
CREATE VIEW Alunos_Por_Status_Matricula AS
SELECT matricula.status AS Status_Matricula, COUNT(matricula.id_aluno) AS Total_Alunos
FROM matricula
GROUP BY matricula.status;

select * from Alunos_Por_Status_Matricula;
/*
14. Exibir o total de professores por especialidade
Crie uma view que exiba a quantidade de professores por especialidade (ex.: Engenharia de Software, Ciência da Computação).
*/
CREATE VIEW Professores_Por_Especialidade AS
SELECT professor.especialidade AS Especialidade, COUNT(professor.id_professor) AS Total_Professores
FROM professor
GROUP BY professor.especialidade;

select * from Professores_POr_Especialidade;
/*
15. Exibir lista de alunos e suas idades
Crie uma view que exiba o nome dos alunos e suas idades com base na data de nascimento.
*/
CREATE VIEW Alunos_Idades AS
SELECT aluno.nome AS Nome_Aluno, TIMESTAMPDIFF(YEAR, aluno.data_nascimento, CURDATE()) AS Idade
FROM aluno;

select * from Alunos_Idades;
/*
16. Exibir alunos e suas últimas matrículas
Crie uma view que exiba o nome dos alunos e a data de suas últimas matrículas.
*/
CREATE VIEW Alunos_Ultimas_Matriculas AS
SELECT aluno.nome AS Nome_Aluno, MAX(matricula.data_matricula) AS Ultima_Matricula
FROM aluno
JOIN matricula ON aluno.id_aluno = matricula.id_aluno
GROUP BY aluno.nome;

select * from Alunos_Ultimas_Matriculas;
/*
17. Exibir todas as disciplinas de um curso específico
Crie uma view que exiba todas as disciplinas pertencentes a um curso específico, como "Engenharia de Software".
*/
CREATE VIEW Disciplinas_Curso AS
SELECT disciplina.nome AS Nome_Disciplina
FROM disciplina
JOIN curso ON disciplina.id_curso = curso.id_curso
WHERE curso.nome = 'Engenharia de Software';

select * from Disciplinas_Curso;
/*
18. Exibir os professores que não têm turmas
Crie uma view que exiba os professores que não estão lecionando em nenhuma turma.
*/
CREATE VIEW Professores_Sem_Turmas AS
SELECT professor.nome AS Nome_Professor
FROM professor
LEFT JOIN turma ON professor.id_professor = turma.id_professor
WHERE turma.id_turma IS NULL;

select * from Professores_Sem_Turmas;
/*
19. Exibir lista de alunos com CPF e email
Crie uma view que exiba o nome dos alunos, CPF e email.
*/
CREATE VIEW Alunos_CPF_Email AS
SELECT aluno.nome AS Nome_Aluno, aluno.cpf AS CPF, aluno.email AS Email
FROM aluno;

select * from Alunos_CPF_Email;
/*
20. Exibir o total de disciplinas por professor
Crie uma view que exiba o nome dos professores e o número de disciplinas que cada um leciona.
*/
CREATE VIEW Disciplinas_Por_Professor AS
SELECT professor.nome AS Nome_Professor, COUNT(turma.id_disciplina) AS Total_Disciplinas
FROM professor
JOIN turma ON professor.id_professor = turma.id_professor
GROUP BY professor.nome;

select * from Disciplinas_Por_Professor;