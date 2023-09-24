#
# En este script se utilizan reglas de asociación para analizar co-ocurrencias en
# el dataset Groceries
#

# Verifico si la librería arules está instalada y sino la instalo, luego la cargo en memoria
librerias_instaladas<-rownames(installed.packages())
if("arules" %in% librerias_instaladas == FALSE) {
  install.packages("arules", dependencies = TRUE)
}
library(arules)

# Cargamos el dataset Groceries (que viene con arules) en memoria
data("Groceries")

# Generamos las reglas con arules, estableciendo soporte y confianza mínimos como parámetro.
reglas <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"))

# Cantidad de reglas:
print(reglas)

# Reglas generadas:
inspect(reglas)

# Como podemos observar, cada regla posee los siguientes atributos:
# lhs: (left-hand-sides) es la parte izquierda de la regla, o antecedente.
# rhs: ( right-hand-sides ) es la parte derecha de la regla, o resultado.
# Support: es la frecuencia relativa de una regla sobre el total de transacciones.
# Confidence: Mide cuantas veces sucede el rhs cuando se presenta el lhs, para cada regla.
# Lift: es la confianza de la regla sobre el soporte del consecuente de la misma.

# Podríamos ordenar las reglas por alguna de las métricas presentadas, por ejemplo
inspect(sort(reglas, by="lift", decreasing = TRUE))

# O podríamos tomar solo las primeras N (en este caso 10) reglas con mayor lift
inspect(head(sort(reglas, by="lift", decreasing = TRUE),10))

# Por otro lado, podemos analizar reglas que poseen determinado antecedente o consecuente

# Las reglas que poseen como antecedente -lhs- a la cerveza en botella (bottled beer):
reglas_beer <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"), appearance = list(lhs="bottled beer"))
inspect(reglas_beer)

# Las reglas que poseen como consecuente -rhs- a la mantequilla (butter):
reglas_butter <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"), appearance = list(rhs="butter"))
inspect(reglas_butter)

# Filtramos reglas que contengan waffles en el antecedente
reglas_waffles <- subset(reglas, subset = lhs %pin% "waffles")
inspect(reglas_waffles)

# Gráficos con arules y arulesViz

library(arulesViz)
# Documentación: https://cran.r-project.org/web/packages/arulesViz/vignettes/arulesViz.pdf

# Plot x-y con 3 dimensiones
plot(reglas)

# Es posible redefinir el orden de las métricas
plot(reglas, measure = c("support", "lift"), shading = "confidence")

# El método two-key permite incluir la dimensión de orden (cantidad de items)
plot(reglas, method = "two-key plot")

# Es posible generar un gráfico interactivo
sel <- plot(reglas, measure = c("support", "lift"), shading = "confidence", interactive = TRUE)
