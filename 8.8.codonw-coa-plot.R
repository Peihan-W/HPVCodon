library(ggplot2)
library(cowplot)


data = read.csv('./8.out/8.coa-plot.codonw.tsv', sep = '\t')


# 绘图
ggplot(data = data, aes(x = Axis1,y = Axis2, color = Subtype)) + 
  geom_point(size = 0.5) +
  geom_hline(yintercept = 0, linewidth = 0.5, color ="grey") +
  geom_vline(xintercept = 00, linewidth = 0.5, color ="grey") + 
  facet_wrap(~ Gene, scales = "free", nrow = 2) +
  # xlim(-1, 1) +
  # ylim(-1, 1) +
  labs(x = "Axis1",y = "Axis2") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())

pdf("./8.out/8.coa-plot.codonw.pdf", 
    width = 18/2.54, height = 9/2.54)
ggplot(data = data, aes(x = Axis1,y = Axis2, color = Subtype)) + 
  geom_point(size = 0.5) +
  geom_hline(yintercept = 0, linewidth = 0.5, color ="grey") +
  geom_vline(xintercept = 0, linewidth = 0.5, color ="grey") + 
  facet_wrap(~ Gene, scales = "free", nrow = 2)+
  # xlim(-1, 1) +
  # ylim(-1, 1) +
  labs(x = "Axis1",y = "Axis2") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())
dev.off()
