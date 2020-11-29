library(tidyverse)
library(taskscheduleR)

#create a new task for my covid R script to schedule the pull daily
taskscheduler_create(
  taskname = 'refresh_table',
  rscript = "C:/Users/garve/OneDrive/Desktop/R/Covid_pull.R",
  schedule = 'DAILY',
  Rexe = file.path(Sys.getenv('R_HOME'), 'bin', '64', 'Rscript.exe'),
  startdate = as.Date('2020-11-29'),
  starttime = '08:30'
)

#Test your scheduleR by running it now or deleting existing task
taskscheduler_runnow('refresh_table')
taskscheduler_delete('refresh_table')

