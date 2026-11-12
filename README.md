# NFL-Statistical-Modeling-Project-
Statistical analysis of 2023 NFL passing vs. rushing efficiency and team win percentage using Multiple Linear Regression and ANOVA in R.
# 🏈 2023 NFL Offensive Strategy & Success Analysis

An exploratory and statistical analysis evaluating whether pass-heavy or rush-heavy offensive strategies are more effective in achieving team success during the 2023 NFL regular season[cite: 6]. 

## 📊 Executive Summary & Key Findings
This project utilizes official 2023 NFL regular-season data combined with player-level stats via `nflreadr` to analyze the relationship between yardage volume, playoff status, and team win percentages[cite: 6, 20]. 

* **Passing Impact:** A positive linear relationship exists between total passing yards and team win percentage ($p = 9.87e-05$), proving passing volume is a reliable predictor of success[cite: 7, 10].
* **Rushing Impact:** Higher rushing yard totals are also significantly linked to higher win percentages ($p = 0.00368$)[cite: 8].
* **Balanced Offense Conclusion:** Statistical modeling (multiple linear regression and ANOVA) reveals that teams relying too heavily on a single approach can become predictable[cite: 6, 18]. The findings indicate that a balanced combination of passing and rushing yields optimal team performance and consistency[cite: 6, 18].

---

## 🛠️ Methods & Statistical Techniques
* **Data Wrangling & Cleaning:** Processed and aggregated player-level weekly statistics into team totals, joining them with official 2023 standings[cite: 20].
* **Multiple Linear Regression:** Built models evaluating the simultaneous impact of total passing and rushing yards on winning percentages ($R^2 = 0.518$)[cite: 10, 20].
* **Hypothesis Testing & T-Tests:** Conducted Welch Two Sample t-tests comparing high-volume vs. low-volume passing and rushing groups[cite: 11, 14, 20].
* **Two-Way ANOVA:** Analyzed the interaction effects between offensive volume groupings and playoff status[cite: 16, 20].

---

## 📁 Repository Contents
- **[Presentation PDF](./Presentation.pdf):** The full slide deck breaking down the statistical analysis, visualizations, and conclusions[cite: 1].
- **[R Markdown Report](./Group%20Project%20ANYL%20RMarkDwn%20Final%20Draft.Rmd):** The reproducible R Markdown source file containing the complete narrative, code chunks, and outputs[cite: 20].
- **[R Source Script](./Group%20Project%20ANYL%203334%20(1).R):** Clean R script containing data pipelines, model training, and visualization code[cite: 21].

---

## 📈 Featured Visualization: Passing vs. Rushing Yardage Quadrants
*(Below is an overview of how team yardage maps to success levels across the league)*[cite: 17]

```R
# Example snippet from the analysis pipeline for linear modeling
model_2023 <- lm(Win_Pct ~ total_pass_yards + total_rush_yards, data = final_data_2023)
summary(model_2023)
