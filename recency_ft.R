recency_ft <- function(date, date_current, duration_last=ddays(365)){
  # date : vector of dates to transform
  # date_current : the assumed current date (ignore after this)
  # duration_last : earliest date to consider as measured from date_current (duration)
  # **return** : days since last transaction
  
  
  answer <- as.duration(date_current - date) %>%
    as.numeric("days")
  answer[is.na(date)] <- NA
  answer[date > date_current] <- NA
  answer[date < (date_current - duration_last)] <- duration_last %>% as.numeric("days")
  return(answer)
} 