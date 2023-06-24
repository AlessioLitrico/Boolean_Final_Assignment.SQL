SELECT
 a.season,
 a.league_id,
 b.name AS league_name,
 b.country_id,
 MIN(a.home_team_goal) AS min_home_team_goal,
 AVG(a.home_team_goal) AS avg_home_team_goal,
 (MAX(a.home_team_goal) + MIN(a.home_team_goal)) / 2 AS mid_range_home_team_goal,
 MAX(a.home_team_goal) AS max_home_team_goal,
 SUM(a.home_team_goal) AS sum_home_team_goal
FROM
 `final-exercise-386809.european_soccer_data.match` a
INNER JOIN
 `final-exercise-386809.european_soccer_data.leagues` b
ON
 a.league_id = b.id
 AND a.country_id = b.country_id
GROUP BY
 a.season,
 a.league_id,
 b.name,
 b.country_id
