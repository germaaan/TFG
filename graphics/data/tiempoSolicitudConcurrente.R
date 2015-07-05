#!/usr/bin/env Rscript
library("ggplot2")

datos <- data.frame(solicitudes = factor(c("30","30","30","50","50","50","100","100","100")),
                    concurrencia = factor(c("25%","50%","75%","25%","50%","75%","25%","50%","75%"),
                                          levels = c("25%","50%","75%")),
                    solsSegundo = c(294.087,251.733,227.563,204.296,250.128,279.178,269.658,228.497,244.729))

ggplot(data = datos, aes(x = concurrencia, y = solsSegundo, fill = solicitudes)) +
  geom_bar(stat = "identity", position = position_dodge(), colour = "black") + 
  coord_cartesian(ylim=c(0, 300)) + 
  scale_y_continuous(breaks=seq(0, 300, 25)) + 
  scale_fill_discrete(name="Número de\nsolicitudes") + 
  xlab("Nivel de concurrencia") + ylab("Milisegundos") + ggtitle("Tiempo por solicitud concurrente") +
  theme(plot.title=element_text(face="bold", size=20),
        axis.title=element_text(size=14))

ggsave("gra_tsc.png")