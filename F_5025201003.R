# P2_Probstat_F_5025201003


# NOMOR 1

## 1a (standar deviasi)
x <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

dataku = data.frame(x,y)

stdev = sd(dataku$y - dataku$x)
stdev

## 1 b (t atau p-value)
t.test(dataku$y,dataku$x,paired = TRUE)


# NOMOR 2
install.packages("BSDA")
library(BSDA)
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          alternative = "less", mu = 20000)


#NOMOR 3

## 3a (h0 & h1)
h0 = (3.64-0)/(1.67/sqrt(19))
h0

h1 = (2.79-0)/(1.32/sqrt(27))
h1

## 3b (hitung sampel statistik)
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

## 3c (uji statistik dengan df=2)
install.packages("mosaic")
library(mosaic)

plotDist(dist='t', df=2, col="red")

##3d (nilai kritikal)
qchisq(p = 0.05, df = 2, lower.tail=FALSE)


#NOMOR 4

## 4a
data_oneway <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt",h=T)
head(data_oneway)

data_oneway$Group <- as.factor(data_oneway$Group)
table(data_oneway$Group)

str(data_oneway)

data_oneway$Group = factor(data_oneway$Group,labels = c("kucing oren", "kucing hitam", "kucing putih"))

Group1 <- subset(data_oneway, Group == "kucing oren")
Group2 <- subset(data_oneway, Group == "kucing hitam")
Group3 <- subset(data_oneway, Group == "kucing putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

##4b
bartlett.test(Length ~ Group, data = data_oneway)

##4c
model = lm(Length ~ Group, data = data_oneway)
anova(model)

model1 = aov(Length ~ Group, data=data_oneway)
summary(model1)

##4e
TukeyHSD(aov(model))

TukeyHSD(model1)

##4f
library("ggplot2")
ggplot(data_oneway, aes(x = Group, y = Length)) +
  geom_boxplot(fill = "grey100", colour = "black") +
  scale_x_discrete() + xlab("Treatment Group") +
  ylab("Length (cm)")

#NOMOR 5
#Pada penyelesaian soal nomor 5 ini saya menggunakan referensi kode dari internet dengan link sebagai berikut: https://statdoe.com/two-way-anova-in-r/
##5a
install.packages("multcompView")
library(multcompView)
library(readr)
library(dplyr)
library(ggplot2)

GTL <- read_csv("GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

##5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

##5c
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

##5d
tukey <- TukeyHSD(anova)
print(tukey)

##5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)