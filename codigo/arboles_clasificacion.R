# Cargo una librería que posee el dataset "wine" para no descargarlo
# https://archive.ics.uci.edu/dataset/109/wine
library("HDclassif")
data("wine")

# Ver los nombres de las columnas actuales
print(colnames(wine))

# Definir nuevos nombres en español en minúsculas para las columnas (sin la columna de clase)
nuevos_nombres <- c("clase", "alcohol", "ácido_málico", "ceniza", "alcalinidad_de_la_ceniza", 
                    "magnesio", "fenoles_totales", "flavonoides", "fenoles_no_flavonoides", 
                    "proantocianidinas", "intensidad_de_color", "matiz", 
                    "od280_od315_de_vinos_diluidos", "proline")

# Cambiar los nombres de las columnas
colnames(wine) <- nuevos_nombres

# Cambiar el orden de las columnas
wine <- wine[, c(2:length(wine), 1)]

# Convertimos la variable de clase "clase" a factor
wine$clase <- as.factor(wine$clase)

# Verificar los nuevos nombres en minúsculas y la ubicación de la columna de clase
print(colnames(wine))

# Separamos en train y test
set.seed(1)
wine_train <- sample_frac(wine, .70)
wine_test <- setdiff(wine, wine_train)

# Entrenamos el árbol en función de la clase
library(rpart)
arbol_1 <- rpart(formula = clase ~ ., data = wine_train, parms = list(split = "information"))
print(arbol_1)

# Graficamos el árbol entrenado
library(rpart.plot)
rpart.plot(arbol_1)

# Hacemos la predicción sobre el conjunto de test para ver la efectividad del modelo
prediccion_1 <- predict(arbol_1, newdata = wine_test, type = "class")
print(prediccion_1)

# Graficamos la matriz de confusión
library(caret)
confusionMatrix(prediccion_1, wine_test$clase)
