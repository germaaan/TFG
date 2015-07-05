#!/usr/bin/env Rscript
library("ggplot2")

datos <- data.frame(solicitudes = factor(c("30","30","30","50","50","50","100","100","100")),
                    concurrencia = factor(c("25%","50%","75%","25%","50%","75%","25%","50%","75%"),
                                          levels = c("25%","50%","75%")),
                    solsSegundo = c(3.402,3.976,4.470,4.898,4.000,3.583,3.728,4.496,4.197))

ggplot(data = datos, aes(x = concurrencia, y = solsSegundo, fill = solicitudes)) +
  geom_bar(stat = "identity", position = position_dodge(), colour = "black") + 
  coord_cartesian(ylim=c(0, 5)) + 
  scale_y_continuous(breaks=seq(0, 5, 0.5)) + 
  scale_fill_discrete(name="Número de\nsolicitudes") + 
  xlab("Nivel de concurrencia") + ylab("Solicitudes/segundo") + ggtitle("Solicitudes por segundo") +
  theme(plot.title=element_text(face="bold", size=20),
        axis.title=element_text(size=14))

ggsave("gra_sps.png")