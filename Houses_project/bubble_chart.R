#install.packages("plotly")

#library(plotly)

area <- c("Bloomsbury",
          "Covent Garden",
          "City of London",
          "Central London",
          "Paddington",
          "Acton",
          "Chiswick",
          "Ealing",
          "Hammersmith",
          "Kensington",
          "Maida Vale",
          "North Kensington",
          "Notting Hill",
          "Shepherd's Bush",
          "West Kensington",
          "Camden",
          "Cricklewood",
          "Hampstead",
          "Kilburn",
          "Mill Hill",
          "St Johns Wood",
          "Willesden",
          "Golders Green",
          "Westminster",
          "Brixton",
          "Chelsea",
          "Clapham",
          "Earls Court",
          "Fulham",
          "South Kensington",
          "South Lambeth",
          "West Brompton",
          "Battersea",
          "Balham",
          "Putney",
          "Streatham",
          "Tooting",
          "Wandsworth",
          "Wimbledon",
          "West Wimbledon",
          "Islington",
          "Finchley",
          "Highbury",
          "Highgate",
          "Holloway",
          "Hornsey",
          "Muswell Hill",
          "New Southgate",
          "Wapping",
          "Bethnal Green",
          "Poplar",
          "Stratford",
          "Canning Town",
          "Bermondsey",
          "Blackheath",
          "Greenwich",
          "Peckham",
          "Rotherhithe",
          "Beckenham",
          "Harrow",
          "Pinner",
          "Kington On Thames",
          "Brentford")

n = length(area)

price <- rnorm(n, mean = 1000, sd = 100)
crime_rate <- abs(round(rnorm(n, mean = 10, sd = 2), 1))
crime_rate <- sqrt(crime_rate/pi)
commuting_time <- abs(round(rnorm(n, mean = 45, sd = 10), 0))

houses <- data.frame(area = area, 
                     price = price, 
                     crime_rate = crime_rate, 
                     commuting_time = commuting_time)

#plot_ly(houses, x = commuting_time, 
#       y = price, size = crime_rate, mode = "markers")

#houses <- head(houses)

symbols(x = houses$commuting_time, 
        y = houses$price, 
        circles = houses$crime_rate, 
        inches = 0.25)

text(labels = houses$area, 
     x = houses$commuting_time, 
     y = houses$price, 
     cex = 0.5)

#d <- diamonds[sample(nrow(diamonds), 1000), ]
#plot_ly(d, x = carat, y = price, size = carat, mode = "markers")


