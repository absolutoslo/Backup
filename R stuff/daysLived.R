# Source with this code
# source('C:/Users/cdiloreto/Google Drive/Programming/Backup/R functions/daysLived.R')

daysLived = function(birthday) {
          today = Sys.Date()
          date_diff = today - as.Date(birthday, format = '%d-%m-%Y')
          cat("You have lived", date_diff, "days.", "\n",
              "You were born on a", weekdays(as.Date(birthday)))
}