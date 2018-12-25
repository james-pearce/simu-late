nth_ft <- function(value, date, date_current, index=1, duration_last=ddays(365)){
  # value : value to be find the nth most recent
  # date : date to transform and sort
  # date_current : the assumed current date (ignore after this)
  # index : the nth last version to return, ie 1 = last
  # duration_last : earliest date to consider as measured from date_current (duration)
  # **return** : sorted value at index
  value[date > date_current] <- NA
  value[date < (date_current - duration_last)] <- NA
  value[is.na(date)] <- NA
  value <- value[rev(order(date))]
  value <- value[!is.na(value)]
  answer <- value[index]
  return(answer)
}
