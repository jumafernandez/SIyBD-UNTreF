#
# En este script se utiliza xgboost para clasificar variedades de vinos del dataset wine
# presente en https://archive.ics.uci.edu/dataset/109/wine
#
# Cargo una librería que posee el dataset "wine" para no descargarlo
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
library(dplyr)
set.seed(1)
wine_train <- sample_frac(wine, .70)
wine_test <- setdiff(wine, wine_train)

# Cargar la librería xgboost
library(xgboost)

# Crear una matriz de características y un vector de etiquetas
X_train <- as.matrix(wine_train[, -which(names(wine_train) == "clase")])  # Excluir la columna de clase
y_train <- as.numeric(wine_train$clase)   # Mantener la clase como factor

# Convertir todas las columnas de la matriz a numéricas 
# (por alguna razón as.matrix las pasa a factor)
X_train <- apply(X_train, 2, as.numeric)

X_test <- as.matrix(wine_test[, -which(names(wine_test) == "clase")])  # Excluir la columna de clase
y_test <- as.numeric(wine_test$clase)     # Mantener la clase como factor

# Convertir todas las columnas de la matriz a numéricas 
# (por alguna razón as.matrix las pasa a factor)
X_test <- apply(X_test, 2, as.numeric)

# Convertir etiquetas a números enteros y restar 1
y_train <- as.integer(wine_train$clase) - 1
y_test <- as.integer(wine_test$clase) - 1

# Entrenar el modelo XGBoost
modelo_xgboost <- xgboost(data = X_train, label = y_train, nrounds = 100, 
                          objective = "multi:softmax", num_class = length(unique(y_train)))

# Realizar predicciones con el modelo XGBoost
predicciones_xgboost <- predict(modelo_xgboost, newdata = X_test)

# Convertimos las predicciones a factor y las y a factor
predicciones_xgboost <- as.factor(predicciones_xgboost)
y_train <- as.factor(y_train)
y_test <- as.factor(y_test)

# Verificar las predicciones
print(predicciones_xgboost)

# Graficamos la matriz de confusión
library(caret)
confusionMatrix(predicciones_xgboost, y_test)

# Crea un gráfico de barras para la importancia de las características
library(ggplot2)
importancia_vars <- xgb.importance(model = modelo_xgboost)
print(importancia_vars)
xgb.plot.importance(importancia_vars)

# Es posible imprimir los árboles individuales
library("DiagrammeR")
xgb.plot.tree(model=modelo_xgboost, trees=0:1, render=TRUE)
