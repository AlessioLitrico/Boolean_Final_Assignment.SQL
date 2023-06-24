WITH season_goals AS (
 SELECT
   season,
   team_long_name,
   SUM(home_team_goal + away_team_goal) AS total_goals
 FROM
   `final-exercise-386809.european_soccer_data.match` AS a
 INNER JOIN
   `final-exercise-386809.european_soccer_data.team` AS b
 ON
   a.home_team_api_id = b.team_api_id
 GROUP BY
   season, team_long_name
),
ranked_season_goals AS (
 SELECT
   season,
   team_long_name,
   total_goals,
   ROW_NUMBER() OVER (PARTITION BY season ORDER BY total_goals DESC) AS rank
 FROM
   season_goals
)
SELECT
 season,
 team_long_name AS top_scoring_team,
 total_goals AS goals_scored
FROM
 ranked_season_goals
WHERE
 rank = 1;