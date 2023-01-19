-- 1. odify it to show the matchid and player name for all goals scored by Germany.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'


-- 2. We can look up information about game 1012 by finding that row in the game table.
-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game
WHERE id = '1012'


-- 3. Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid, stadium, mdate 
  FROM game JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER'


-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT  team1, team2, player
FROM game JOIN goal ON(game.id=goal.matchid)
WHERE player LIKE 'Mario%'


-- 5. The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10


-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
FROM game JOIN eteam ON(team1=eteam.id)
WHERE coach = 'Fernando Santos'


-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player FROM goal JOIN game ON (id=matchid)
WHERE stadium = 'National Stadium, Warsaw'


-- The example query shows all goals scored in the Germany-Greece quarterfinal.
-- 8. Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid!='GER'


-- 9. Show teamname and the total number of goals scored.
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname


