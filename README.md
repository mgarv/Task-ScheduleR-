# Task-ScheduleR-
To perform automated tasks in R to run R scripts

This task scheduleR example I have created to pull COVID deaths and confirmed cases in the USA to run daily and store directly into my postgres Heroku database.

The first script (Covid_pull) pulls the covid data from the John hopkins github available data (which is updated daily). 

The second script (taskscheduleR) sets a daily scheduled task at 8:30am to run my Covid_pull.

After these two have been created you simply go into your windows Task Scheduler, find your refresh_table task (that you had created in the taskscheduleR) and set the security option to "Run whether the user is logged in or not".  This will run now when you are not logged into your computer.  

:)
