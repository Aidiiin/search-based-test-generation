# avg
# standard dev
# avg in each project
# box plot of coverages 
# histogram of coverage buckets
# mut scores
#lines
# covered lines
#total methods
#fitness evals
#time
#size
# length
library(ggplot2)
library(dplyr)

print(getwd())

#read raw data
data1 <- read.csv("./commons-cli-statistics.csv")
data2 <- read.csv("./commons-math-statistics.csv")
data3 <- read.csv("./http-request-statistics.csv")
data4 <- read.csv("./joda-time-statistics.csv")
data5 <- read.csv("./json-java-statistics.csv")
data6 <- read.csv("./jsoup-statistics.csv")
data7 <- read.csv("./spatial4j-statistics.csv")
data8 <- read.csv("./joda-money-statistics.csv")
data9 <- read.csv("./commons-codec-statistics.csv")
data10 <- read.csv("./vertx-statistics.csv")

# calculate means and sd for each project 
res1 <- aggregate(data1[,c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data1$configuration_id), mean)
res1sd <- aggregate(data1[, c("Coverage")], list(data1$configuration_id), sd)
res1["Coverage_SD"] <- res1sd[,2]

res2 <- aggregate(data2[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data2$configuration_id), mean)
res2sd <- aggregate(data2[, c("Coverage")], list(data2$configuration_id), sd)
res2["Coverage_SD"] <- res2sd[,2]

res3 <- aggregate(data3[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data3$configuration_id), mean)
res3sd <- aggregate(data3[, c("Coverage")], list(data3$configuration_id), sd)
res3["Coverage_SD"] <- res3sd[,2]

res4 <- aggregate(data4[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data4$configuration_id), mean)
res4sd <- aggregate(data4[, c("Coverage")], list(data4$configuration_id), sd)
res4["Coverage_SD"] <- res4sd[,2]

res5 <- aggregate(data5[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data5$configuration_id), mean)
res5sd <- aggregate(data5[, c("Coverage")], list(data5$configuration_id), sd)
res5["Coverage_SD"] <- res5sd[,2]

res6 <- aggregate(data6[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data6$configuration_id), mean)
res6sd <- aggregate(data6[, c("Coverage")], list(data6$configuration_id), sd)
res6["Coverage_SD"] <- res6sd[,2]

res7 <- aggregate(data7[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data7$configuration_id), mean)
res7sd <- aggregate(data7[, c("Coverage")], list(data7$configuration_id), sd)
res7["Coverage_SD"] <- res7sd[,2]

res8 <- aggregate(data8[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data8$configuration_id), mean)
res8sd <- aggregate(data8[, c("Coverage")], list(data8$configuration_id), sd)
res8["Coverage_SD"] <- res8sd[,2]

res9 <- aggregate(data9[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data9$configuration_id), mean)
res9sd <- aggregate(data9[, c("Coverage")], list(data9$configuration_id), sd)
res9["Coverage_SD"] <- res9sd[,2]

res10 <- aggregate(data10[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(data10$configuration_id), mean)
res10sd <- aggregate(data10[, c("Coverage")], list(data10$configuration_id), sd)
res10["Coverage_SD"] <- res10sd[,2]

#par(cex.axis=0.6)
#par(las=3)
#boxplot(Coverage~configuration_id, data1, xlab="Configuration", horizontal = TRUE)

# box plots for each project
pl1 <- ggplot(data1, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ ggtitle("Commons CLI")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/commons-cli-boxplot.png", plot=pl1, dpi = 300, width = 5, height = 4)

pl2 <- ggplot(data2, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ ggtitle("Commons Math")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/commons-math-boxplot.png", plot=pl2, dpi = 300, width = 5, height = 4)

pl3 <- ggplot(data3, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ ggtitle("http-request")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/http-request-boxplot.png", plot=pl3, dpi = 300, width = 5, height = 4)

pl4 <- ggplot(data4, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ggtitle("Joda Time")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/joda-time-boxplot.png", plot=pl4, dpi = 300, width = 5, height = 4)

pl5 <- ggplot(data5, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ ggtitle("Json Java")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/json-java-boxplot.png", plot=pl5, dpi = 300, width = 5, height = 4)

pl6 <- ggplot(data6, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ggtitle("Jsoup")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/jsoup-boxplot.png", plot=pl6, dpi = 300, width = 5, height = 4)

pl7 <- ggplot(data7, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ggtitle("Spatial4j")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/spatial4j-boxplot.png", plot=pl7, dpi = 300, width = 5, height = 4)

pl8 <- ggplot(data8, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ggtitle("Joda Money")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/joda-money-boxplot.png", plot=pl8, dpi = 300, width = 5, height = 4)

pl9 <- ggplot(data9, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ggtitle("Commons Codec")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/commons-codec-boxplot.png", plot=pl9, dpi = 300, width = 5, height = 4)

pl10 <- ggplot(data10, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ggtitle("Vert.X")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/vertx-boxplot.png", plot=pl10, dpi = 300, width = 5, height = 4)


# box plot on all data
dataAll = rbind(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10)
resAll <- aggregate(dataAll[, c("Coverage", "Size", "Length", "MutationScore", "Fitness_Evaluations")],list(dataAll$configuration_id), mean)
resAllSd <- aggregate(dataAll[, c("Coverage")], list(dataAll$configuration_id), sd)
resAll["Coverage_SD"] <- resAllSd[,2]

plAll <- ggplot(dataAll, aes(x=configuration_id, y=Coverage))+
  geom_boxplot()+xlab('Configuration')+ylim(0,1)+ggtitle("All")+
  theme(plot.title = element_text(face = "bold"), axis.text.x = element_text(angle = 45, margin=margin(t=16)))+
  stat_summary(fun = mean, geom = "point", shape = 18, size = 1.5, color = "red")
ggsave("./output/all-boxplot.png", plot=plAll, dpi = 300, width = 5, height = 4)


# write csv file of results
write.csv((res1 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/commons-cli-means.csv", row.names=FALSE)
write.csv((res2 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/commons-math-means.csv", row.names=FALSE)
write.csv((res3 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/http-request-means.csv", row.names=FALSE)
write.csv((res4 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/joda-time-means.csv", row.names=FALSE)
write.csv((res5 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/json-java-means.csv", row.names=FALSE)
write.csv((res6 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/jsoup-means.csv", row.names=FALSE)
write.csv((res7 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/spatial4j-means.csv", row.names=FALSE)
write.csv((res8 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/joda-money-means.csv", row.names=FALSE)
write.csv((res9 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/commons-codec-means.csv", row.names=FALSE)
write.csv((res10 %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/vertx-means.csv", row.names=FALSE)

write.csv((resAll %>% mutate_if(is.numeric, round, digits=4))[,1:7], "./output/all-means.csv", row.names=FALSE)

# average of target goals and methods in all classes
classes <- aggregate(dataAll[, c("Total_Goals", "Total_Methods")],list(dataAll$TARGET_CLASS), mean)
mean(classes$Total_Goals)
mean(classes$Total_Methods)

