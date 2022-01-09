
setwd("/Users/falco/Downloads/DM1 Project")
baseball = read.csv("baseball.csv")
str(baseball)

moneyball = subset(baseball, Year < 2002)
str(moneyball)

pairs = moneyball
pairs(pairs, labels = colnames(pairs), main = "Pairs matrix", pch = 21,
bg = c("red", "green3", "blue", "yellow"), upper.panel = NULL)
Create a new variable for Difference in Runs plotted against Wins
moneyball$RD = moneyball$RS - moneyball$RA
plot(moneyball$RD, moneyball$W)

regression_won_games = lm(W ~ RD, data=moneyball)
summary(regression_won_games)

regression_points_scored=lm(RS ~ OBP + SLG + BA, data=moneyball)
summary(regression_points_scored)
Here we see that all of them are significant but BA is negatively correlated. Let's take it out.
regression_runs_scored=lm(RS ~ OBP + SLG, data=moneyball)
summary(regression_runs_scored)

regression_runs_allowed=lm(RA ~ OOBP + OSLG, data=moneyball)
summary(regression_runs_allowed)
