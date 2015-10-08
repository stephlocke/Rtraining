library(reportsWS)
library(forecast)

# Select name and gender
name <- "Garrett"    # Always capitalize
sex <- "M"           # or "F"
names <- get_babyname(name, sex)

# Create time series and forecast
nbirths <- ts(names$n, start = 1880)
mod <- auto.arima(nbirths)
pred <- forecast(mod, h = 12) # 12 for 2025

# Results
sum(nbirths, na.rm = TRUE)                  # total number with name
round(xts::last(pred$mean))                 # predicted number in 2025
trim_whitespace(pred$method)                # which ARIMA method used
data.frame(
  method = trim_whitespace(pred$method),
  predicted_2025 = round(xts::last(pred$mean)))  # a tabular display
all <- bind_as_xts(nbirths, pred)           # time series with forecast

# Make plot
title <- paste0("Number of children named ", name)
plot(all, main = title)                     # ignore the warning
