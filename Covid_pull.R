library(RPostgres)
library(tidyverse)

#Store my system environment variables in files so that they cannot be translated via this code
Sys.setenv(Postgres_USER = "wemmtroaflvnqq")
Sys.setenv(Postgres_PASS = scan(file = 'C:/Users/garve/OneDrive/Desktop/R/.netrc', what = "character"))
Sys.setenv(Postgres_HOST = scan(file = 'C:/Users/garve/OneDrive/Desktop/R/.netrc1', what = "character"))
Sys.setenv(Postgres_DB = scan(file = 'C:/Users/garve/OneDrive/Desktop/R/.netrc2', what = "character"))


#Connect to my Heroku postgres database
db_con <- dbConnect(
  RPostgres::Postgres(),
  dbname = Sys.getenv('Postgres_DB'),
  host = Sys.getenv('Postgres_HOST'),
  port = 5432,
  user = "wemmtroaflvnqq",
  password = Sys.getenv('Postgres_PASS'),
  sslmode = "require"
)

#Read covid confirmed and death cases from John Hopkins covid github data
Covid_confirmedUSA <-
  read.csv(
    "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"
  )
Covid_deathsUSA <-
  read.csv(
    "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_US.csv"
  )


#Write covid confirmed and death cases to my db which will overwrite any existing information stored there
dbWriteTable(
  db_con,
  name = 'COVID_confirmed',
  value = Covid_confirmedUSA,
  overwrite = TRUE,
  date = TRUE
)

dbWriteTable(
  db_con,
  name = 'COVID_deaths',
  value = Covid_deathsUSA,
  overwrite = TRUE,
  date = TRUE
)

#disconnect
dbDisconnect(db_con) 