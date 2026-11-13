library(ggplot2)
library(cowplot)

while (!is.null(dev.list())) dev.off()

data = read.csv('./8.out/1.dist.emboss-distmat-nt.tsv', sep = '\t')

# 绘图
ggplot(data = data, aes(x = Gene, y = dist, color = Gene)) + 
  geom_boxplot(outlier.size=0) +
  facet_wrap(~ Subtype, scales = "free_y", nrow = 2)+
  labs(x = "", y = "Distance") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text.x = element_blank(),
        axis.text.y = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())

pdf("./8.out/1.dist.emboss-distmat-nt.pdf", 
    width = 18/2.54, height = 9/2.54)
ggplot(data = data, aes(x = Gene, y = dist, color = Gene)) + 
  geom_boxplot(outlier.size=0) +
  facet_wrap(~ Subtype, scales = "free_y", nrow = 2)+
  labs(x = "", y = "Distance") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text.x = element_blank(),
        axis.text.y = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())
dev.off()

data = read.csv('./8.out/1.dist.emboss-distmat-aa.tsv', sep = '\t')

# 绘图
ggplot(data = data, aes(x = Gene, y = dist, color = Gene)) + 
  geom_boxplot(outlier.size=0) +
  facet_wrap(~ Subtype, scales = "free_y", nrow = 2)+
  labs(x = "", y = "Distance") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text.x = element_blank(),
        axis.text.y = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())

pdf("./8.out/1.dist.emboss-distmat-aa.pdf", 
    width = 18/2.54, height = 9/2.54)
ggplot(data = data, aes(x = Gene, y = dist, color = Gene)) + 
  geom_boxplot(outlier.size=0) +
  facet_wrap(~ Subtype, scales = "free_y", nrow = 2)+
  labs(x = "", y = "Distance") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text.x = element_blank(),
        axis.text.y = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())
dev.off()
