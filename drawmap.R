rm(list = ls())
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


##loop: try
name <- colnames(beta)
varlist <-name[4:5]

maps<-lapply(varlist, function(x){
  
  plot_usmap(data = beta, value = i, list(i = as.name(x)))+
    scale_fill_continuous(name = i, label = scales::comma)+
    theme(legend.position = 'right')+
    labs(title = "Wage gap", subtitle = i)
})


#####bar chart
install.packages("plotly")
library(plotly)
xname = c("no control","r","ro","roe","roew","roewh","roewhm","roewhms","roewhmsk")
data = data.frame(name = xname, ave_gwg = t(beta[52, 4:12]))
colnames(data) = c("Control_Variables","Average_GWG")

#plot_ly(x = rownames(data), y=data$X52, type="bar") %>% 
#  layout(title="AverageGWG", showlegend = FALSE)

data1 = data.frame(name = xname,t(beta[53, 4:12]))
colnames(data1) = c("Control_Variables","Std_GWG")
#plot_ly(x = rownames(data1), y=data1$X53, type="bar") %>% 
#  layout(title="Std GWG", showlegend = FALSE)

install.packages('ggplot2')
library(ggplot2)
chart1 = ggplot(data, aes(x= Control_Variables ,y = Average_GWG)) + geom_bar(stat = "identity")
chart1 = chart1 + labs(title = "Average Gender Wage Gap Through the Process of Controlling")
chart1

chart2 = ggplot(data1, aes(x= Control_Variables ,y = Std_GWG)) + geom_bar(stat = "identity")
chart2 = chart2 + labs(title = "Standard Deviation of Gender Wage Gaps Through the Process of Controlling")
chart2


histdata1 = data.frame(GWG = beta$no_control[1:51])
histdata2 = data.frame(GWG = beta$roewhmsk[1:51])
histdata1$condition = "no_control"
histdata2$condition= "all_control"

vegLengths = rbind(histdata1, histdata2)

hist1 = ggplot(vegLengths, aes(GWG, fill = condition)) + geom_density(alpha = 0.2)
hist1 = hist1 + labs(title = "Gender Wage Gap Distribution Before and After Controlling")
hist1

hist2 = ggplot(vegLengths, aes(GWG, fill = condition)) + geom_histogram(alpha = 0.2,aes(y = ..density..), position = "identity")
hist2



