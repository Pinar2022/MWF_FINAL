#read data
evs_17_clean <- readRDS("C:/Users/pinar/Desktop/DWFassig2/clean/evs_17_clean.rds")
data_clean<-evs_17_clean

#library(tidyverse)
#library(haven)
#Outcome variables: child_suffer, job_national
#Controls:  Sex (male, female), education (lower, medium, higher)
#Age polynomial: 1 to 5
#Exploration

#Graphs
# graph with age and child_suffer
data_clean %>%
  ggplot(aes(age, child_suffer)) +
  stat_summary(geom = "line", fun = "mean") +
  theme_bw() +
  labs(x = "Age",
       y = "Average agreement",
       caption = "EVS 2017")

# graph with age and job_national
data_clean %>%
  ggplot(aes(age, job_national)) +
  stat_summary(geom = "line", fun = "mean") +
  theme_bw() +
  labs(x = "Age",
       y = "Average agreement",
       caption = "EVS 2017")

#graph with education and child_suffer

plot(child_suffer ~ edu,
     data=data_clean,
     xlab = "Education",
     ylab = "Child suffers agreement")


#graph with education and job_national
plot(job_national ~ edu,
     data=data_clean,
     xlab = "Education",
     ylab = "Job to national agreement")

#graph with sex and child_suffer
plot(child_suffer ~ sex,
     data=data_clean,
     xlab = "Sex",
     ylab = "Child suffers agreement")

#graph with sex and job_national
plot(job_national ~ sex,
     data=data_clean,
     xlab = "Sex",
     ylab = "Job to national aggrement")

#Regression models



library(kableExtra)
library(xtable)

#child_suffer with age, sex and edu
m1 <- lm("child_suffer ~ age+sex + edu", data = data_clean)
xtable(summary(m1)) %>%
  kable(digits=3) %>%
  kable_styling()

#child_suffer with age,age^2, sex and edu
m2 <- lm("child_suffer ~ age+ I(age^2)  + sex + edu", data = data_clean)
xtable(summary(m2)) %>%
  kable(digits=3) %>%
  kable_styling()

#child_suffer with age,age^2,age^3, sex and edu
m3 <- lm("child_suffer ~ age+ I(age^2)+I(age^3)+ sex + edu", data = data_clean)
xtable(summary(m3)) %>%
  kable(digits=3) %>%
  kable_styling()

#child_suffer with age,age^2,age^3,age^4, sex and edu
m4 <- lm("child_suffer ~ age+ I(age^2)+I(age^3)+I(age^4)+ sex + edu", data = data_clean)
xtable(summary(m4)) %>%
  kable(digits=3) %>%
  kable_styling()

#child_suffer with age,age^2,age^3,age^4, age^5, sex and edu
m5 <- lm("child_suffer ~ age+ I(age^2)+I(age^3)+I(age^4)+ I(age^5)+sex + edu", data = data_clean)
xtable(summary(m5)) %>%
  kable(digits=3) %>%
  kable_styling()

#job_national with age, sex and edu
m6 <- lm("job_national ~ age+sex + edu", data = data_clean)
xtable(summary(m6)) %>%
  kable(digits=3) %>%
  kable_styling()

#job_national with age,age^2, sex and edu
m7 <- lm("job_national ~ age+ I(age^2)  + sex + edu", data = data_clean)
xtable(summary(m7)) %>%
  kable(digits=3) %>%
  kable_styling()

#job_national with age,age^2,age^3, sex and edu
m8 <- lm("job_national ~ age+ I(age^2)+I(age^3)+ sex + edu", data = data_clean)
xtable(summary(m8)) %>%
  kable(digits=3) %>%
  kable_styling()

#job_national with age,age^2,age^3,age^4, sex and edu
m9 <- lm("job_national ~ age+ I(age^2)+I(age^3)+I(age^4)+ sex + edu", data = data_clean)
xtable(summary(m9)) %>%
  kable(digits=3) %>%
  kable_styling()

#job_national with age,age^2,age^3,age^4, age^5, sex and edu
m10 <- lm("job_national ~ age+ I(age^2)+I(age^3)+I(age^4)+ I(age^5)+sex + edu", data = data_clean)
xtable(summary(m10)) %>%
  kable(digits=3) %>%
  kable_styling()

#child_suffer with age
m11 <- lm("child_suffer ~ age", data = data_clean)
xtable(summary(m11)) %>%
  kable(digits=3) %>%
  kable_styling()

#job_national with age
m12 <- lm("job_national ~ age", data = data_clean)
xtable(summary(m12)) %>%
  kable(digits=3) %>%
  kable_styling()

#residual for m12
m12_res<-resid(m12)

#plot 
plot(data_clean$job_national, m12_res[1:length(data_clean$job_national)],
     main = "Residual Plot",
     xlab = "job_national",
     ylab = "Residuals")

#preparation for interactive
#overall data
data_full<-data_clean
#Albenia graph age job_national
input.country <- "Albania"
data_clean <- subset(data_full, cntry ==input.country)
data_clean %>%
  ggplot(aes(age, job_national)) +
  stat_summary(geom = "line", fun = "mean") +
  theme_minimal() +
  labs(x = "Age",
       y = "Average agreement",
       caption = paste("EVS 2017 for", input.country))

#regression input job national age -regression
input.y <-"job_national"
input.x <- "age"

