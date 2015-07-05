#!/usr/bin/env Rscript
library("ggplot2")

datos <- data.frame(solicitudes = factor(c("30","30","30","50","50","50","100","100","100")),
                    concurrencia = factor(c("25%","50%","75%","25%","50%","75%","25%","50%","75%"),
                                          levels = c("25%","50%","75%")),
                    segundos = c(8.823,7.552,6.827,10.215,12.506,13.959,26.966,22.850,24.473))

ggplot(data = datos, aes(x = concurrencia, y = segundos, fill = solicitudes)) +
  geom_bar(stat = "identity", position = position_dodge(), colour = "black") + 
  coord_cartesian(ylim=c(0, 30)) + 
  scale_y_continuous(breaks=seq(0, 30, 2.5)) + 
  scale_fill_discrete(name="Número de\nsolicitudes") + 
  xlab("Nivel de concurrencia") + ylab("Segundos") + ggtitle("Tiempo de ejecución") +
  theme(plot.title=element_text(face="bold", size=20),
        axis.title=element_text(size=14))

ggsave("gra_te.png")