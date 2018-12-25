aggregate_ft <- function(value, date, date_current, FUN=sum, duration_last=ddays(365)){
  # value : value to be aggregated
  # date : date to transform
  # date_current : the assumed current date (ignore after this)
  # FUN : aggregation function
  # duration_last : earliest date to consider as measured from date_current (duration)
  # **return** : days since last transaction
  value[date > date_current] <- NA
  value[date < (date_current - duration_last)] <- NA
  value[is.na(date)] <- NA
  answer <- FUN(value[!is.na(value)])
  return(answer)
}

# use with aggregate_ft for minimums

min_NA <- function(vec){
  as.numeric(ifelse(all(is.na(vec)), NA, min(vec, na.rm=TRUE)))
}