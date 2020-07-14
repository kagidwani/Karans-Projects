myDF <- read.csv("/Users/kgidwani/Documents/Python/COVID-19/COVID_Cases.csv")

install.packages("tidyverse")
library(dplyr)
library("ggmap")


register_google(key = "AIzaSyD1nEKqqX_1jWyP-XGg9huWYjTk_l1XlOg", write = TRUE)

US_cases <- myDF %>% filter(Country_Region == "US")
case_loc <- data.frame(lon=US_cases$Long, lat=US_cases$Lat, type=US_cases$Case_Type)
case_loc$color="black"
case_loc$color[case_loc$type=="Recovered"]="blue"
case_loc$color[case_loc$type=="Confirmed"]="red"
case_loc$color[case_loc$type=="Active"]="yellow"


USA <- as.numeric(geocode("USA"))
USA_map <- ggmap(get_googlemap(center=USA, zoom=4))

USA_map <- USA_map + geom_point(data=case_loc, size=0.1)
USA_map