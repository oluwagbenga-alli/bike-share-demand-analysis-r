# Bike-Share Demand Analysis with R

## Project Overview

This beginner-friendly project explores daily bike rentals in Washington, DC. Using R, I compared rental patterns by month, season, working-day status, rider type and weather.

The goal was to explore how these patterns could help a bike-share operator think about bike availability and service planning.

## Business Question

**How does bike-rental demand vary, and what might the patterns mean for planning bike availability?**

I explored these questions:

- Which months and seasons had the highest average rentals?
- Did average rentals differ between working and non-working days?
- How did casual and registered riders contribute to total rentals?
- How did average rentals vary across weather categories?

## Dataset

The analysis uses the daily file, `day.csv`, from the [UCI Bike Sharing dataset](https://archive.ics.uci.edu/dataset/275/bike+sharing+dataset). It contains **731 daily records** covering January 2011 to December 2012.

The dataset includes total, casual and registered rental counts, along with date, season, working-day and weather information. UCI lists the dataset under the [Creative Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/); please retain attribution when sharing it.

## Tools

- **R and RStudio** — analysis and report
- **readr** — loading the CSV file
- **Base R** — data checks, summaries and charts
- **R Markdown** — combining explanations, code and charts in a report

## Methodology

1. Loaded `day.csv` into R and reviewed its rows, columns and data types.
2. Checked for missing values and exact duplicate rows. Neither was found, so no rows were removed.
3. Replaced numeric month, season and weather codes with readable labels.
4. Compared average daily rentals by month, season, working-day status and weather.
5. Summed rentals by casual and registered rider type.
6. Created bar charts to show the main comparisons.

## Key Findings

- **June** had the highest average monthly rentals, at about **5,772 per day**. **January** had the lowest, at about **2,176**.
- **Summer** had the highest seasonal average, about **5,644 rentals per day**; **winter** had the lowest, about **2,604**.
- Average rentals were about **4,585 on working days** and **4,330 on non-working days**.
- The dataset recorded **620,017 casual rentals** and **2,672,662 registered rentals**. Registered riders made up about **81%** of rentals.
- Average rentals were highest in the **clear or partly cloudy** weather category and lowest in the **rain, snow or storms** category.

## Limitations

The data covers 2011–2012 and may not represent current demand. Because the dataset is aggregated by day, it does not show which hours had the most rentals. These comparisons describe patterns in the data; they do not prove that season, day type or weather caused rental counts to change.

## Run the Project

1. Keep the report file and `data/day.csv` in the repository structure.
2. In the R Markdown report, use this path to load the data:

   ```r
   bike_day <- readr::read_csv("data/day.csv", show_col_types = FALSE)
   ```

3. Open the `.Rmd` file in RStudio and click **Knit** to generate the report.

## Repository Contents

- `bike_share_report.Rmd` — report source with analysis code and charts
- `bike_share_report.html` — knitted report
- `day.csv` — dataset file
- `README.md` — project overview and findings

## Dataset Credit

Fanaee-T, H. (2013). *Bike Sharing* [Dataset]. UCI Machine Learning Repository. [https://doi.org/10.24432/C5W894](https://doi.org/10.24432/C5W894)
