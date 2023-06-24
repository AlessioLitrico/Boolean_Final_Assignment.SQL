SELECT
 season,
 league_id,
 COUNT(*) AS match_count
FROM
 `final-exercise-386809.european_soccer_data.match`
GROUP BY
 season,
 league_id
ORDER BY
 season,
 league_id
