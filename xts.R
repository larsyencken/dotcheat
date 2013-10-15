# make a time series
library(xts)
ts = xts(d$value, d$date)

# select a date range
ts['2012']              # entire year
ts['2012/2013']         # year range inclusive
ts['2012-07/2013-06']   # month range inclusive
