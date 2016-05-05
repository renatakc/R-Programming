# Challenge #1 
max <- 9800
load <- 49
mean <- 205
st.dev <- 15
m_box <- max/load
sd_1 <- st.dev/(sqrt(load))

prob <- pnorm(load, mean = mean, sd = sd_1, lower.tail = FALSE)
prob

# Challenge #2
max <- 250
load <- 100
mean <- 2.4
st.dev <- 2
m_box <- max/load
sd_1 <- round(st.dev/(sqrt(load)), digits = 4)