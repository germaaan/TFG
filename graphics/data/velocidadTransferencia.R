#!/usr/bin/env Rscript
library("ggplot2")

datos <- data.frame(solicitudes = factor(c("30","30","30","50","50","50","100","100","100")),
                    concurrencia = factor(c("25%","50%","75%","25%","50%","75%","25%","50%","75%"),
                                          levels = c("25%","50%","75%")),
                    solsSegundo = c(747.735,873.789,982.389,645.866,527.515,472.469,245.783,296.416,276.707))

ggplot(data = datos, aes(x = concurrencia, y = solsSegundo, fill = solicitudes)) +
  geom_bar(stat = "identity", position = position_dodge(), colour = "black") + 
  coord_cartesian(ylim=c(0, 1000)) + 
  scale_y_continuous(breaks=seq(0, 1000, 100)) + 
  scale_fill_discrete(name="Número de\nsolicitudes") + 
  xlab("Nivel de concurrencia") + ylab("KB/s") + ggtitle("Velocidad de transferencia") +
  theme(plot.title=element_text(face="bold", size=20),
        axis.title=element_text(size=14))

ggsave("gra_vt.png")