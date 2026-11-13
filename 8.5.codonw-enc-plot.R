library(ggplot2)
library(cowplot)

ENC<-function(x){
  return(2 + x + 29/(x^2+(1-x)^2))
}

# 生成绘制曲线需要的数据
x = seq(0,1,by=0.005)
y = ENC(x)
enc = data.frame(A = x, B = y)
data = read.csv('./8.out/5.enc-plot.codonw.tsv', sep = '\t')

# 绘图
ggplot() + 
  geom_line(data = enc, aes(x = A, y = B), linewidth = 0.5) +
  geom_point(data = data, aes(x = GC3s,y = ENC, color = Subtype), size = 0.5) + 
  facet_wrap(~ Gene, scales = "free", nrow = 2)+
  xlim(0,1) +
  ylim(0,70) +
  labs(x = "GC3s",y = "ENC") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())

pdf("./8.out/5.enc-plot.codonw.pdf", 
    width = 18/2.54, height = 9/2.54)
ggplot() + 
  geom_line(data = enc, aes(x = A, y = B), linewidth = 0.5) +
  geom_point(data = data, aes(x = GC3s,y = ENC, color = Subtype), size = 0.5) + 
  facet_wrap(~ Gene, scales = "free", nrow = 2)+
  xlim(0,1) +
  ylim(0,70) +
  labs(x = "GC3s",y = "ENC") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())
dev.off()
