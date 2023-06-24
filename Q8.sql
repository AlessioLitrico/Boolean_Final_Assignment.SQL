CREATE TABLE `final-exercise-386809.european_soccer_data.TopScorer` AS (
 SELECT team.team_api_id, team.team_long_name, SUM(match.total_goals) AS total_goals_scored
 FROM (
  SELECT
    home_team_api_id AS team_api_id,
    SUM(home_team_goal) AS total_goals
  FROM
    `final-exercise-386809.european_soccer_data.match`
  WHERE
    season = (SELECT MAX(season) FROM `final-exercise-386809.european_soccer_data.match`)
  GROUP BY
    home_team_api_id
  UNION ALL
  SELECT
    away_team_api_id AS team_api_id,
    SUM(away_team_goal) AS total_goals
  FROM
    `final-exercise-386809.european_soccer_data.match`
  WHERE
    season = (SELECT MAX(season) FROM `final-exercise-386809.european_soccer_data.match`)
  GROUP BY
    away_team_api_id
 ) AS match
 INNER JOIN
  `final-exercise-386809.european_soccer_data.team` AS team
 ON
  match.team_api_id = team.team_api_id
 GROUP BY
  team.team_api_id, team.team_long_name
 ORDER BY
  total_goals_scored DESC
 LIMIT
  10
);


SELECT COUNT(*) AS total_combinations
FROM (
 SELECT t1.team_long_name AS team1, t2.team_long_name AS team2
 FROM `final-exercise-386809.european_soccer_data.TopScorer` t1
 CROSS JOIN `final-exercise-386809.european_soccer_data.TopScorer` t2
 WHERE t1.team_api_id <> t2.team_api_id
) AS combinations;