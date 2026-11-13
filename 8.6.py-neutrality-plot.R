library(ggplot2)
library(cowplot)
library(ggpmisc)


data = read.csv('./8.out/6.neutrality-plot.tsv', sep = '\t')

lm_eqn <- function(data){
  m <- lm(y ~ x, df);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(unname(coef(m)[1]), digits = 2),
                        b = format(unname(coef(m)[2]), digits = 2),
                        r2 = format(summary(m)$r.squared, digits = 3)))
  as.character(as.expression(eq));
}


# 绘图
ggplot(data = data, aes(x = GC3,y = GC12)) + 
  geom_point(aes(color = Subtype), size = 0.5) +
  geom_smooth(method = "lm", se=FALSE, formula = y ~ x, 
              color="black", linewidth = 0.5) +
  stat_poly_eq(formula = y ~ x, 
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE, size = 1.8) +
  facet_wrap(~ Gene, scales = "free", nrow = 2)+
  xlim(0, 1) +
  ylim(0, 1) +
  labs(x = "GC3",y = "GC12") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())

pdf("./8.out/6.neutrality-plot.pdf", 
    width = 18/2.54, height = 9/2.54)
ggplot(data = data, aes(x = GC3,y = GC12)) + 
  geom_point(aes(color = Subtype), size = 0.5) +
  geom_smooth(method = "lm", se=FALSE, formula = y ~ x, 
              color="black", linewidth = 0.5) +
  stat_poly_eq(formula = y ~ x, 
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE, size = 1.8) +
  facet_wrap(~ Gene, scales = "free", nrow = 2)+
  xlim(0, 1) +
  ylim(0, 1) +
  labs(x = "GC3",y = "GC12") +
  theme_cowplot() +
  theme(axis.line = element_line(linewidth = 0.5),
        axis.ticks = element_line(linewidth = 0.5),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 8),
        text = element_text(size = 8),
        legend.title = element_blank(),
        strip.background = element_blank())
dev.off()
