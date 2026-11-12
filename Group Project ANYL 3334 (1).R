
library(tidyverse)
library(nflreadr)

# 1. Load 2023 Regular Season Stats
team_yards_2023 <- load_player_stats(2023) %>%
  filter(season_type == "REG") %>%
  group_by(team) %>%
  summarize(
    total_pass_yards = sum(passing_yards, na.rm = TRUE),
    total_rush_yards = sum(rushing_yards, na.rm = TRUE),
    .groups = "drop"
  )

# 2. Official 2023 Standings for all 32 teams
official_2023_all <- data.frame(
  team = c("BAL", "BUF", "KC", "HOU", "CLE", "MIA", "PIT", "JAX", "IND", "LV", 
           "DEN", "CIN", "NYJ", "TEN", "LAC", "NE", "DAL", "DET", "SF", "PHI", 
           "LAR", "TB", "GB", "NO", "SEA", "MIN", "CHI", "ATL", "NYG", "WAS", 
           "ARI", "CAR"),
  W = c(13, 11, 11, 10, 11, 11, 10, 9, 9, 8, 8, 9, 7, 6, 5, 4, 
        12, 12, 12, 11, 10, 9, 9, 9, 9, 7, 7, 7, 6, 4, 4, 2),
  L = c(4, 6, 6, 7, 6, 6, 7, 8, 8, 9, 9, 8, 10, 11, 12, 13, 
        5, 5, 5, 6, 7, 8, 8, 8, 8, 10, 10, 10, 11, 13, 13, 15),
  T = rep(0, 32) # No ties occurred in the 2023 regular season
) %>%
  mutate(Win_Pct = (W + 0.5 * T) / (W + L + T))

# 3. Final Join
final_data_2023 <- team_yards_2023 %>%
  inner_join(official_2023_all, by = "team")

# Hypothesis testing 
model_2023 <- lm(Win_Pct ~ total_pass_yards + total_rush_yards, data = final_data_2023)
summary(model_2023)

# Simple Scatterplot using Base R 
plot(final_data_2023$total_pass_yards, final_data_2023$Win_Pct,
     main = "Passing Yards vs. Win Percentage",
     xlab = "Total Passing Yards",
     ylab = "Winning Percentage",
     pch = 19, col = "blue")
model_pass <- lm(Win_Pct ~ total_pass_yards, data = final_data_2023)
abline(model_pass, col = "red", lwd = 2)

# Simple Scatterplot for Rushing
plot(final_data_2023$total_rush_yards, final_data_2023$Win_Pct,
     main = "Rushing Yards vs. Win Percentage",
     xlab = "Total Rushing Yards",
     ylab = "Winning Percentage",
     pch = 19, col = "darkorange")
model_rush <- lm(Win_Pct ~ total_rush_yards, data = final_data_2023)
abline(model_rush, col = "red", lwd = 2)


pairs(final_data_2023[, c("Win_Pct", "total_pass_yards", "total_rush_yards")],
      main = "Scatterplot Matrix of Team Data")
