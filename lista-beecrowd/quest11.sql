/*
O Campeonato Cearense de Futebol atrai milhares de torcedores todos os anos e você trabalha em um jornal
e é responsável por calcular a tabela de pontuação. Mostre uma tabela com as seguintes linhas: 
nome do time, número de partidas, vitórias, derrotas, empates e placares. Sabendo que o placar é calculado
com cada vitória valendo 3 pontos, empate valendo 1 e derrota valendo 0. 
Ao final mostre sua tabela com a pontuação do maior para o menor.
*/

CREATE TABLE teams (
    id integer PRIMARY KEY,
    name varchar(50)
);

CREATE TABLE matches  (
    id integer PRIMARY KEY,
    team_1 integer,
    team_2 integer,
    team_1_goals integer,
    team_2_goals integer,
    FOREIGN KEY (team_1) REFERENCES teams(id),
    FOREIGN KEY (team_2) REFERENCES teams(id)
);

insert into teams(id, name)
values
    (1, 'CEARA'),
    (2, 'FORTALEZA'),
    (3, 'GUARANY DE SOBRAL'),
    (4, 'FLORESTA');

insert into  matches(id, team_1, team_2, team_1_goals, team_2_goals)
values
    (1, 4, 1, 0, 4),
    (2, 3, 2, 0, 1),
    (3, 1, 3, 3, 0),
    (4, 3, 4, 0, 1),
    (5, 1, 2, 0, 0),
    (6, 2, 4, 2, 1);

/*
SELECT teams.name, count(teams.id) AS matches,
	SUM(CASE
    	WHEN (matches.team_1_goals > matches.team_2_goals
    		AND teams.id = matches.team_1)
            OR (matches.team_2_goals > matches.team_1_goals
            AND teams.id = matches.team_2) THEN 1 ELSE 0 END) AS victories,
    SUM(CASE
        WHEN (matches.team_1_goals < matches.team_2_goals
            AND teams.id = matches.team_1)
            OR (matches.team_2_goals < matches.team_1_goals
            AND teams.id = matches.team_2) THEN 1 ELSE 0 END) AS defeats,
    SUM(CASE
        WHEN (matches.team_1_goals=matches.team_2_goals
            AND teams.id = matches.team_1)
            OR (matches.team_2_goals = matches.team_1_goals
            AND teams.id = matches.team_2) THEN 1 ELSE 0 END) AS draws,
 	SUM(CASE
        WHEN (matches.team_1_goals=matches.team_2_goals
            AND teams.id = matches.team_1)
            OR (matches.team_2_goals = matches.team_1_goals
            AND teams.id = matches.team_2) THEN 1 ELSE 0 END) + 
  	SUM(CASE
        WHEN (matches.team_1_goals>matches.team_2_goals
            AND teams.id = matches.team_1)
            OR (matches.team_2_goals > matches.team_1_goals
            AND teams.id = matches.team_2) THEN 3 ELSE 0 END) AS score
FROM teams, matches 
WHERE teams.id = matches.team_1 OR teams.id = matches.team_2
GROUP BY teams.name
ORDER BY score DESC;