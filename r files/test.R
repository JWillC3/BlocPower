source("functions_data.R")

#load data for first unit, room
D_01_bedroom <- (read_csv("./data/bedroom_124256.csv")) %>% 
  select(1:7) %>% 
  rename("time" = "timestamp(America/Denver)")

green <- read_csv("data/green_kitchen.csv")
blue <- read_csv(("data/blue_kitchen.csv"))

acoma <- rbind(green, blue) %>% 
  rename(Date = "Date Time", ID = "Monitor ID", Location = "Location ID",
         NO2 = "NO2(ppm)") %>% 
  mutate(Date = dmy_hm(Date)) %>% 
  mutate_at("ID", as.character)


acoma %>% 
  ggplot(aes(Date, NO2, color = ID)) +
  geom_line(size = 1, alpha = 0.5) +
  scale_x_datetime(breaks = "1 day", date_labels = "%b %d") +
  # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
  #               labels = trans_format("log10", math_format(10^.x))) +
  theme_bw() +
  theme(axis.text.x = element_text(size = 10)) + #angle = 45, hjust = 1)) +
  theme(axis.text.y = element_text(size = 10)) +
  labs(x = "Date", y = "NO2 (ppm)") +
  ggtitle("Acoma Kitchens NO2 by Date (12 hour)") + 
  scale_color_manual(name = "Home",
                            values = c("darkgreen","darkblue"),
                            labels = c("Green", "Blue"))

p_acoma <- plot(acoma, "Acoma Property Kitchens")
