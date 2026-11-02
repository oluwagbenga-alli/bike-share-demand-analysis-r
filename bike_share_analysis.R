#bike share analysis
library(readr)

# Read day.csv from the project folder
bike_day <- read_csv("data/day.csv", show_col_types = FALSE)
# Show the first six rows to preview the data
head(bike_day)

# Show how many rows and columns the file contains
dim(bike_day)

# Show the column names
names(bike_day)

# Show each column's data type and a preview of its values
str(bike_day)

# Count missing values in each column
colSums(is.na(bike_day))

# Count exact duplicate rows
sum(duplicated(bike_day))

# Show a summary of the columns
summary(bike_day)

# Make a separate copy so the original imported data stays unchanged
bike <- bike_day

# Replace the year codes with readable labels
bike$yr <- factor(
  bike$yr,
  levels = c(0, 1),
  labels = c("2011", "2012")
)

# Replace the season codes with readable labels
bike$season <- factor(
  bike$season,
  levels = c(1, 2, 3, 4),
  labels = c("Winter", "Spring", "Summer", "Fall")
)

# Replace weekday codes with readable day names
bike$weekday <- factor(
  bike$weekday,
  levels = 0:6,
  labels = c("Sunday", "Monday", "Tuesday", "Wednesday",
             "Thursday", "Friday", "Saturday")
)

# Check that the labels look right
head(bike[, c("dteday", "yr", "season", "weekday")])

# Turn month numbers into names, like 1 into Jan
bike$month_name <- month.abb[bike$mnth]

# Calculate the average rentals for each month
average_by_month <- tapply(bike$cnt, bike$month_name, mean)

# Show months from highest average to lowest
sort(average_by_month, decreasing = TRUE)

# Calculate average daily rentals for each season
average_by_season <- tapply(bike$cnt, bike$season, mean)

# Show seasons from highest average to lowest
sort(average_by_season, decreasing = TRUE)

# Compare average rentals on non-working days (0) and working days (1)
tapply(bike$cnt, bike$workingday, mean)


# Compare the total casual and registered rentals
rider_totals <- c(
  Casual = sum(bike$casual),
  Registered = sum(bike$registered)
)

rider_totals


# Give the weather codes readable names
bike$weather <- factor(
  bike$weathersit,
  levels = 1:3,
  labels = c("Clear or partly cloudy", "Mist or cloudy", "Rain, snow or storms")
)

# Compare average rentals for each weather group
average_by_weather <- tapply(bike$cnt, bike$weather, mean)

sort(average_by_weather, decreasing = TRUE)


# Create a chart of average rentals by month
barplot(
  average_by_month[month.abb],
  names.arg = month.abb,
  main = "Average Bike Rentals by Month",
  xlab = "Month",
  ylab = "Average rentals per day",
  col = "steelblue"
)


# Create a chart of average rentals by season
barplot(
  average_by_season,
  main = "Average Bike Rentals by Season",
  xlab = "Season",
  ylab = "Average rentals per day",
  col = "steelblue"
)


# Create a chart comparing casual and registered rentals
barplot(
  rider_totals,
  main = "Total Rentals by Rider Type",
  xlab = "Rider type",
  ylab = "Total rentals",
  col = "steelblue"
)


# Create a chart of average rentals by weather
barplot(
  average_by_weather,
  main = "Average Bike Rentals by Weather",
  xlab = "Weather",
  ylab = "Average rentals per day",
  col = "steelblue"
)