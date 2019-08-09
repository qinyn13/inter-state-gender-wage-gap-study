# NOTE: To load data, you must download both the extract's data and the DDI
# and also set the working directory to the folder with these files (or change the path below).

if (!require("ipumsr")) stop("Reading IPUMS data into R requires the ipumsr package. It can be installed using the following command: install.packages('ipumsr')")

install.packages('ipumsr')
library("ipumsr")
ddi <- read_ipums_ddi("usa_00007.xml")
data <- read_ipums_micro(ddi)

mydata <- subset(data, INCWAGE!=999999)

#group by race
mydata1 <- mydata
mydata1$"RACE"[mydata1$"RACE"== 6] <- 4
mydata1$"RACE"[mydata1$"RACE"== 5] <- 4
mydata1$"RACE"[mydata1$"RACE"== 7] <- 5
mydata1$"RACE"[mydata1$"RACE"== 8] <- 5
mydata1$"RACE"[mydata1$"RACE"== 9] <- 5

#group by education
mydata2 <- subset(mydata1, EDUCD > 1)
mydata2 <- subset(mydata1, EDUCD != 999)
mydata2$EDUCD[mydata2$EDUCD <= 61 ] = 1
mydata2$EDUCD[mydata2$EDUCD > 1 & mydata2$EDUCD <= 100 ] = 2
mydata2$EDUCD[mydata2$EDUCD > 2 & mydata2$EDUCD <= 113 ] = 3
mydata2$EDUCD[mydata2$EDUCD > 3 & mydata2$EDUCD <= 115 ] = 4
mydata2$EDUCD[mydata2$EDUCD > 5  ] = 5

#mydata3 <- subset(mydata2, EDUCD != 999)

###############group by industry######note IND not used
mydata3 <- subset(mydata2, IND != 0)
mydata3$IND[mydata3$IND <= 490 ] = 1
mydata3$IND[mydata3$IND <= 3990 & mydata3$IND >= 770 ] = 1
mydata3$IND[mydata3$IND <= 4590 & mydata3$IND >= 4070 ] = 2
mydata3$IND[mydata3$IND <= 5790 & mydata3$IND >= 4670 ] = 3
mydata3$IND[mydata3$IND <= 6390 & mydata3$IND >= 6070 ] = 4
mydata3$IND[mydata3$IND <= 690 & mydata3$IND >= 570 ] = 4
mydata3$IND[mydata3$IND <= 6780 & mydata3$IND >= 6470 ] = 5
mydata3$IND[mydata3$IND <= 7190 & mydata3$IND >= 6870 ] = 6
mydata3$IND[mydata3$IND <= 7790 & mydata3$IND >= 7270 ] = 7
mydata3$IND[mydata3$IND <= 8470 & mydata3$IND >= 7860] = 8
mydata3$IND[mydata3$IND <= 8690 & mydata3$IND >= 8560 ] = 9
mydata3$IND[mydata3$IND <= 9290 & mydata3$IND >= 8770 ] = 10
mydata3$IND[mydata3$IND <= 9590 & mydata3$IND >= 9370 ] = 11
mydata3$IND[mydata3$IND <= 9920 & mydata3$IND >= 9670 ] = 12

#group by occupation
#mydata4 <- subset(mydata3, OCC != 0)
#mydata4$OCC[mydata4$OCC <= 430 ] = "managers+"
#mydata4$OCC[mydata4$OCC <= 730 & mydata4$OCC >= 500 ] = "business_specialist"
#mydata4$OCC[mydata4$OCC <= 950 & mydata4$OCC >= 800 ] = "financial_specialist"
#mydata4$OCC[mydata4$OCC <= 1240 & mydata4$OCC >= 1000 ] = "computer_math"
#mydata4$OCC[mydata4$OCC <= 1560 & mydata4$OCC >= 1300 ] = "architecture_engi"
#mydata4$OCC[mydata4$OCC <= 1965 & mydata4$OCC >= 1600 ] = "LPSS"
#mydata4$OCC[mydata4$OCC <= 2060 & mydata4$OCC >= 2000 ] = "community"
#mydata4$OCC[mydata4$OCC <= 2140 & mydata4$OCC >= 2100 ] = "legal"
#mydata4$OCC[mydata4$OCC <= 2550 & mydata4$OCC >= 2200 ] = "education"
#mydata4$OCC[mydata4$OCC <= 2920 & mydata4$OCC >= 2600] = "arts"
#mydata4$OCC[mydata4$OCC <= 3540 & mydata4$OCC >= 3000 ] = "healthcare_practioner"
#mydata4$OCC[mydata4$OCC <= 3655 & mydata4$OCC >= 3600 ] = "healthcare_support"
#mydata4$OCC[mydata4$OCC <= 3955 & mydata4$OCC >= 3700 ] = "protective"
#mydata4$OCC[mydata4$OCC <= 4150 & mydata4$OCC >= 4000 ] = "food"
#mydata4$OCC[mydata4$OCC <= 4250 & mydata4$OCC >= 4200 ] = "cleaning_maintenance"
#mydata4$OCC[mydata4$OCC <= 4650 & mydata4$OCC >= 4300 ] = "personal_care"
#mydata4$OCC[mydata4$OCC <= 4965 & mydata4$OCC >= 4700 ] = "sales"
#mydata4$OCC[mydata4$OCC <= 5940 & mydata4$OCC >= 5000 ] = "office"
#mydata4$OCC[mydata4$OCC <= 6130 & mydata4$OCC >= 6000 ] = "farming"
#mydata4$OCC[mydata4$OCC <= 6765 & mydata4$OCC >= 6200 ] = "construction"
#mydata4$OCC[mydata4$OCC <= 6940 & mydata4$OCC >= 6800 ] = "extraction"
#mydata4$OCC[mydata4$OCC <= 7610 & mydata3$OCC >= 7000 ] = "installation"
#mydata4$OCC[mydata4$OCC <= 8950 & mydata3$OCC >= 7700 ] = "production"
#mydata4$OCC[mydata4$OCC <= 9750 & mydata3$OCC >= 9000 ] = "transportation"
#mydata4$OCC[mydata4$OCC <= 9920 & mydata3$OCC >= 9800 ] = "millitary"
###another try
mydata4 <- subset(mydata2, OCC != 0)
mydata4$OCC[mydata4$OCC <= 430 ] = 1
mydata4$OCC[mydata4$OCC <= 730 & mydata4$OCC >= 500 ] = 2
mydata4$OCC[mydata4$OCC <= 950 & mydata4$OCC >= 800 ] = 3
mydata4$OCC[mydata4$OCC <= 1240 & mydata4$OCC >= 1000 ] = 4
mydata4$OCC[mydata4$OCC <= 1560 & mydata4$OCC >= 1300 ] = 5
mydata4$OCC[mydata4$OCC <= 1965 & mydata4$OCC >= 1600 ] = 6
mydata4$OCC[mydata4$OCC <= 2060 & mydata4$OCC >= 2000 ] = 7
mydata4$OCC[mydata4$OCC <= 2140 & mydata4$OCC >= 2100 ] = 8
mydata4$OCC[mydata4$OCC <= 2550 & mydata4$OCC >= 2200 ] = 9
mydata4$OCC[mydata4$OCC <= 2920 & mydata4$OCC >= 2600] = 10
mydata4$OCC[mydata4$OCC <= 3540 & mydata4$OCC >= 3000 ] = 11
mydata4$OCC[mydata4$OCC <= 3655 & mydata4$OCC >= 3600 ] = 12
mydata4$OCC[mydata4$OCC <= 3955 & mydata4$OCC >= 3700 ] = 13
mydata4$OCC[mydata4$OCC <= 4150 & mydata4$OCC >= 4000 ] = 14
mydata4$OCC[mydata4$OCC <= 4250 & mydata4$OCC >= 4200 ] = 15
mydata4$OCC[mydata4$OCC <= 4650 & mydata4$OCC >= 4300 ] = 16
mydata4$OCC[mydata4$OCC <= 4965 & mydata4$OCC >= 4700 ] = 17
mydata4$OCC[mydata4$OCC <= 5940 & mydata4$OCC >= 5000 ] = 18
mydata4$OCC[mydata4$OCC <= 6130 & mydata4$OCC >= 6000 ] = 19
mydata4$OCC[mydata4$OCC <= 6765 & mydata4$OCC >= 6200 ] = 20
mydata4$OCC[mydata4$OCC <= 6940 & mydata4$OCC >= 6800 ] = 21
mydata4$OCC[mydata4$OCC <= 7610 & mydata4$OCC >= 7000 ] = 22
mydata4$OCC[mydata4$OCC <= 8950 & mydata4$OCC >= 7700 ] = 23
mydata4$OCC[mydata4$OCC <= 9750 & mydata4$OCC >= 9000 ] = 24
mydata4$OCC[mydata4$OCC <= 9920 & mydata4$OCC >= 9800 ] = 25


#group by work hours and dummies
#mydata4$UHRSWORK[mydata4$UHRSWORK < 30] = 0 #part-time
#mydata4$UHRSWORK[mydata4$UHRSWORK >= 30] = 1 #full-time

#group by hispanic
mydata4$HISPAN[mydata4$HISPAN > 0] = 1

#group by metropolitan status
mydata4$METRO[mydata4$METRO >= 2] = 2


#delete zero income
mydata5 <- subset(mydata4, INCWAGE != 0)

data_useful <- cbind(mydata5$YEAR, mydata5$STATEICP, mydata5$SEX,mydata5$RACE, mydata5$HISPAN,
                     mydata5$EDUCD, mydata5$INCWAGE, mydata5$OCC, mydata5$UHRSWORK, mydata5$METRO,mydata5$OCCSCORE, mydata5$NCHLT5 )

colnames(data_useful) <- c("year","state","sex","race","hispan","edu","wage","occupation","hours","metro","occscore","child5")

#create dummies for race
df <- as.data.frame(data_useful)
df$white <- df$race
df$white[df$white != 1] <- 0
df$black <- df$race
df$black[df$black != 2] <- 0
df$black[df$black == 2] <- 1
df$indian <- df$race
df$indian[df$indian != 3] <- 0
df$indian[df$indian == 3 ] <- 1
df$asian <- df$race
df$asian[df$asian != 4 ] <- 0
df$asian[df$asian == 4 ] <- 1

#create dummies for education
df$high <- df$edu
df$high[df$high != 2] <- 0
df$high[df$high == 2] <- 1
df$ba <- df$edu
df$ba[df$ba != 3] <- 0
df$ba[df$ba == 3] <- 1
df$ma <- df$edu
df$ma[df$ma != 4] <- 0
df$ma[df$ma == 4 ] <- 1
df$phd <- df$edu
df$phd[df$phd !=5 ] <- 0
df$phd[df$phd == 5 ] <- 1

#create dummies for occupation(industry)
occ_dummy <- c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25")
df1 <-df
df1 <- cbind(df1, sapply(occ_dummy, function(x) as.integer(df1$occupation == x )))
#occ_dummy <- c("1","2","3","4","5","6","7","8","9","10","11","12")
#df1 <- cbind(df1, sapply(ind_dummy, function(x) as.integer(df1$industry == x )))

#create dummies for sex
df1$male <- df1$sex
df1$male[df1$male == 2] <- 0

#create dummies for metropolitan status
df1$not_metro <- df1$metro
df1$not_metro[df1$not_metro != 1] = 0
df1$metro[df1$metro == 1] = 0
df1$metro[df1$metro == 2] = 1

#change occ names
df2 <- df1
install.packages("data.table")
library(data.table)
setnames(df2, old=c('1','2','3','4','5','6','7','8','9','10','11',"12","13","14","15","16","17","18","19","20","21","22","23","24","25"),
         new=c('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X',"Y"))



#####START THE REGRESSION!!!!

####1.no control
out_no <-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((wage ~ male), data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_no <- rbind(out_no, m)
}
colnames(out_no) <- c("state","intercept","male")
out_no_sort <- out_no[order(out_no$state),]
out_no_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                         'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                         "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                         'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                         'Washington',"Alaska",'Hawaii','DC') 

###1.regression with log
df3<-subset(df2, wage!= 0)
out_ln<-data.frame(NULL)
for (i in unique(df3$state)){
  n <- lm ((log(wage) ~ male), data = df3[df3$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_ln <- rbind(out_ln, m)
}
colnames(out_ln) <- c("state","intercept","male")
out_ln_sort <- out_ln[order(out_ln$state),]
out_ln_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                         'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                         "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                         'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                         'Washington',"Alaska",'Hawaii','DC') 

####2.control education
out_edu <-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + high + ba + ma + phd), data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_edu <- rbind(out_edu, m)
}
colnames(out_edu) <- c("state","intercept","male","high", "ba","ma","phd")
out_edu_sort <- out_edu[order(out_edu$state),]
out_edu_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                          'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                          "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                          'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                          'Washington',"Alaska",'Hawaii','DC') 


####3.control race
out_race<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian), data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_race <- rbind(out_race, m)
}

colnames(out_race) <- c("state","intercept","male","white","black","indian","asian" )
out_race_sort <- out_race[order(out_race$state),]

out_race_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                           'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                           "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                           'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                           'Washington',"Alaska",'Hawaii','DC') 

####4.control occupation
out_occ<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X ), data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_occ <- rbind(out_occ, m)
}

colnames(out_occ) <- c("state","intercept","male","A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X' )
out_occ_sort <- out_occ[order(out_occ$state),]
out_occ_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                          'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                          "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                          'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                          'Washington',"Alaska",'Hawaii','DC') 

####5.control working hours
out_ft<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + hours), data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_ft <- rbind(out_ft, m)
}

colnames(out_ft) <- c("state","intercept","male","full_time")
out_ft_sort <- out_ft[order(out_ft$state),]

out_ft_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                         'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                         "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                         'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                         'Washington',"Alaska",'Hawaii','DC') 
####6.edu+race
out_er<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian + high + ba + ma + phd), data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_er <- rbind(out_er, m)
}

colnames(out_er) <- c("state","intercept","male","white","black","indian","asian","high", "ba","ma","phd")
out_er_sort <- out_er[order(out_er$state),]

out_er_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                         'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                         "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                         'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                         'Washington',"Alaska",'Hawaii','DC') 

####7.edu+occ
out_eo<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + high + ba + ma + phd + 
              A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X ), data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_eo <- rbind(out_eo, m)
}

colnames(out_eo) <- c("state","intercept","male","high", "ba","ma","phd","A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X')
out_eo_sort <- out_eo[order(out_eo$state),]

out_eo_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                         'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                         "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                         'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                         'Washington',"Alaska",'Hawaii','DC') 

####8.race+occ
out_ro<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X ), 
           data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_ro <- rbind(out_ro, m)
}

colnames(out_ro) <- c("state","intercept","male","white","black","indian","asian",
                      "A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X' )
out_ro_sort <- out_ro[order(out_ro$state),]

out_ro_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                         'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                         "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                         'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                         'Washington',"Alaska",'Hawaii','DC') 

####9.race+occ+edu
out_roe<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian 
            + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X 
            + high + ba + ma + phd ), 
           data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_roe <- rbind(out_roe, m)
}

colnames(out_roe) <- c("state","intercept","male","white","black","indian","asian",
                       "A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X',
                       "high", "ba","ma","phd")
out_roe_sort <- out_roe[order(out_roe$state),]

out_roe_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                          'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                          "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                          'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                          'Washington',"Alaska",'Hawaii','DC') 


###10.race+occ+edu+hours
out_roew<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian 
            + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X 
            + high + ba + ma + phd + hours), 
           data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_roew <- rbind(out_roew, m)
}

colnames(out_roew) <- c("state","intercept","male","white","black","indian","asian",
                       "A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X',
                       "high", "ba","ma","phd","hours")
out_roew_sort <- out_roew[order(out_roew$state),]

out_roew_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                          'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                          "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                          'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                          'Washington',"Alaska",'Hawaii','DC') 


####11.race+occ+edu+hours+hispan
out_roewh<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian 
            + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X 
            + high + ba + ma + phd + hours + hispan ), 
           data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_roewh <- rbind(out_roewh, m)
}

colnames(out_roewh) <- c("state","intercept","male","white","black","indian","asian",
                       "A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X',
                       "high", "ba","ma","phd","hours","hispan")
out_roewh_sort <- out_roewh[order(out_roewh$state),]

out_roewh_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                          'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                          "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                          'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                          'Washington',"Alaska",'Hawaii','DC') 


####12.race+occ+edu+hours+hispan+metro
out_roewhm<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian 
            + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X 
            + high + ba + ma + phd + hours + hispan + metro + not_metro), 
           data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_roewhm <- rbind(out_roewhm, m)
}

colnames(out_roewhm) <- c("state","intercept","male","white","black","indian","asian",
                         "A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X',
                         "high", "ba","ma","phd","hours","hispan","metro","not_metro")
out_roewhm_sort <- out_roewhm[order(out_roewhm$state),]

out_roewhm_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                            'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                            "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                            'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                            'Washington',"Alaska",'Hawaii','DC') 



####13.race+occ+edu+hours+hispan+metro
out_roewhms<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian 
            + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X 
            + high + ba + ma + phd + hours + hispan + metro + not_metro + occscore), 
           data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_roewhms <- rbind(out_roewhms, m)
}

colnames(out_roewhms) <- c("state","intercept","male","white","black","indian","asian",
                          "A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X',
                          "high", "ba","ma","phd","hours","hispan","metro","not_metro","occscore")
out_roewhms_sort <- out_roewhms[order(out_roewhms$state),]

out_roewhms_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                             'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                             "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                             'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                             'Washington',"Alaska",'Hawaii','DC') 


####14.race+edu+hours+hispan+metro+ occscore
out_rewhms<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian
            + high + ba + ma + phd + hours + hispan + metro + not_metro + occscore), 
           data = df2[df2$state == i,])
  m <- n$coefficients
  m <- append(m, i, 0)
  out_rewhms <- rbind(out_rewhms, m)
}

colnames(out_rewhms) <- c("state","intercept","male","white","black","indian","asian",
                           "high", "ba","ma","phd","hours","hispan","metro","not_metro","occscore")
out_rewhms_sort <- out_rewhms[order(out_rewhms$state),]

out_rewhms_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                              'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                              "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                              'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                              'Washington',"Alaska",'Hawaii','DC') 








####final.race+occ+edu+hours+hispan+metro+ occscore+ child5

install.packages("car")
library("car")
out_roewhmsk<-data.frame(NULL)
for (i in unique(df2$state)){
  n <- lm ((log(wage) ~ male + white + black + indian + asian + A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X
            + high + ba + ma + phd + hours + hispan + metro + not_metro + occscore + child5), 
           data = df2[df2$state == 40,])
#  print(i)
  print(summary(n))
  car::vif(n)
  m <- n$coefficients
  m <- append(m, i, 0)
  out_roewhmsk <- rbind(out_roewhmsk, m)
}

colnames(out_roewhmsk) <- c("state","intercept","male","white","black","indian","asian","A","B","C","D","E","F","G","H","I","J","K",'L','M','N','O','P','Q','R','S','T','U','V','W','X',
                          "high", "ba","ma","phd","hours","hispan","metro","not_metro","occscore","child5")
out_roewhmsk_sort <- out_roewhmsk[order(out_roewhmsk$state),]

out_roewhmsk_sort$st_name <- c("Connecticut","Maine","Massachusetts","New Hampshire","Rhode Island","Vermont","Delaware","New Jersey","New York",'Pennsylvania','Illinois',
                             'Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota','Virginia',
                             "Alabama",'Arkansas','Florida','Georgia','Louisiana','Mississippi','North Carolina','South Carolina','Texas','Kentucky','Maryland',
                             'Oklahoma','Tennessee','West Virginia','Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','California','Oregon',
                             'Washington',"Alaska",'Hawaii','DC') 





######Regression Results#######
gaps <- NULL
gaps <- cbind(out_ln_sort$state, out_ln_sort$st_name, out_ln_sort$male,
              out_race_sort$male, out_occ_sort$male, out_edu_sort$male,
              out_ro_sort$male, out_er_sort$male, out_eo_sort$male,
              out_roe_sort$male, out_roew_sort$male, out_roewh_sort$male, 
              out_roewhm_sort$male,out_rewhms_sort$male,  out_roewhms_sort$male)
colnames(gaps) <- c("state_id","state","no_control","race","occ","edu",
                    "ro","er","eo","roe","roew","roewh","roewhm","rewhms","roewhms")
Gaps <- data.frame(gaps)
write.csv(Gaps, "ln_gaps.csv")


#####calculate the variable gaps
##working hours
library(dplyr)

w1= df2 %>%
  group_by(state,sex) %>% 
  summarise(mean = mean(hours), sd=sd(hours))
w2= w1 %>%
  group_by(state) %>%
  summarise(gap = mean[sex=1] - mean[sex=2])


s1 = df2 %>%
  group_by(state, sex) %>%
  summarise(mean = mean(occscore), sd=sd(occscore))
s2= s1 %>% 
  group_by(state) %>%
  summarise(gap = mean[sex=1] - mean[sex=2])

c1 = df2 %>%
  group_by(state, sex) %>%
  summarise(mean = mean(child5), sd=sd(child5))
c2= c1 %>% 
  group_by(state) %>%
  summarise(gap = mean[sex=1] - mean[sex=2])

write.csv(w1, "w1.csv")
write.csv(w1, "w2.csv")
write.csv(w1, "s1.csv")
write.csv(w1, "s2.csv")
write.csv(w1, "c1.csv")
write.csv(w1, "c2.csv")


beta<-read.csv("ln_gaps with ranking.csv")
beta


install.packages("usmap")
install.packages("ggplot2")
install.packages("colorspace")
library(usmap)
library(ggplot2)
library(colorspace)

hcl_palettes(type = "diverging")


################ignore################
plot_usmap(regions = "states") + 
  labs(title = "US map", subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"))

wage_gap_no_control <- plot_usmap(data = beta, value = 'no_control')+
  scale_fill_continuous(low = "yellow", high = "green", name = 'beta no control', label = scales::comma, limits = c(0,70))+
  theme(legend.position = 'right')+
  labs(title = "Wage gap (%)", subtitle = "no control")
wage_gap_no_control

wage_gap_all_control <- plot_usmap(data = beta, value = 'roewhmsk')+
  scale_fill_continuous(low = "yellow", high = "green", name = 'beta roewhmsk', label = scales::comma,limits = c(0,70))+
  theme(legend.position = 'right')+
  labs(title = "Wage gap(%)", subtitle = "all control (roewhmsk)")
wage_gap_all_control

################ignore################

###Graph 2. Gender Wage Gap Colour Map Before and After Controlling###
plot_usmap(regions = "states") + 
  labs(title = "US map", subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"))

wage_gap_no_control <- plot_usmap(data = beta, value = 'no_control')+
  scale_fill_continuous_diverging(palette = "Blue-Red 3",   name = 'beta no control', mid=  40.59, guide = "colourbar", limits= c(0,70))+
  theme(legend.position = 'right')+
  labs(title = "Wage gap (%)", subtitle = "no control")
wage_gap_no_control

wage_gap_all_control <- plot_usmap(data = beta, value = 'roewhmsk')+
  scale_fill_continuous_diverging(palette = "Blue-Red 3",  name = 'beta roewhmsk', mid=  40.59, guide = "colourbar", limits = c(0,70))+
  theme(legend.position = 'right')+
  labs(title = "Wage gap(%)", subtitle = "all control (roewhmsk)")
wage_gap_all_control

###Graph 4. Gender Wage Gap Heat Map After Controlling###
plot_usmap(regions = "states") + 
  labs(title = "US map", subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"))

wage_gap_all_control2 <- plot_usmap(data = beta, value = 'roewhmsk')+
  scale_fill_continuous_diverging(palette = "Blue-Red 3",  name = 'beta roewhmsk', mid=  8.68, guide = "colourbar", limits = c(0,20))+
  theme(legend.position = 'right')+
  labs(title = "Wage gap(%)", subtitle = "all control (roewhmsk)")
wage_gap_all_control2

###Graph 6. Gender Wage Gap vs. Political Ideology by States in the U.S.###
plot_usmap(regions = "states") + 
  labs(title = "US map", subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"))

wage_gap_all_control3 <- plot_usmap(data = beta, value = 'roewhmsk')+
  scale_fill_continuous_diverging(palette = "Blue-Red 3",  name = 'beta roewhmsk', mid=  8.68, guide = "colourbar", limits = c(0,20))+
  theme(legend.position = 'right')+
  labs(title = "Wage gap(%)", subtitle = "all control (roewhmsk)")+
  theme(panel.background = element_rect(colour = rgb(232,246,211, maxColorValue = 255), fill = rgb(232,246,211, maxColorValue = 255)))
wage_gap_all_control3


###Graph. Gender working hour gap among states###
wgap<-read.csv("w2.csv")
plot_usmap(regions = "states") + 
  labs(title = "US map", subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"))

workinghour_gap <- plot_usmap(data = wgap, value = 'gap')+
  scale_fill_continuous_diverging(palette = "Green-Orange",  name = 'Working hour gap', mid=  5.62, guide = "colourbar", limits = c(0,10))+
  theme(legend.position = 'right')+
  labs(title = "Working hour gap (h)")
workinghour_gap


###Graph. Occupation score gender gap among states###
sgap<-read.csv("s2.csv")
plot_usmap(regions = "states") + 
  labs(title = "US map", subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"))

score_gap <- plot_usmap(data = sgap, value = 'gap')+
  scale_fill_continuous_diverging(palette = "Green-Orange",  name = 'occupation score gap', mid=  3.19, guide = "colourbar", limits = c(0,5))+
  theme(legend.position = 'right')+
  labs(title = "Occupation score gap")
score_gap

###Graph. Kids under 5 gender gap among states###
kgap<-read.csv("k2.csv")
plot_usmap(regions = "states") + 
  labs(title = "US map", subtitle = "This is a blank map of the counties of the United States.") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue"))

kids5_gap <- plot_usmap(data = kgap, value = 'gap')+
  scale_fill_continuous_diverging(palette = "Green-Orange",  name = 'kids under 5 gap', mid=  0.012, guide = "colourbar", limits = c(-0.02,0.08))+
  theme(legend.position = 'right')+
  labs(title = "Kids under 5 gap")
kids5_gap