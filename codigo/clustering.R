# Cargar el conjunto de datos Iris
data("iris")

# Ver las primeras filas del conjunto de datos
head(iris)

# Seleccionar las columnas que se utilizarán para el clustering (por ejemplo, las cuatro medidas)
datos <- iris[, 1:4]

# Realizar el clustering K-Means con 3 clusters
numero_clusters <- 3
kmeans_result <- kmeans(datos, centers = numero_clusters)

# Ver los resultados del clustering
print(kmeans_result)

# Añadir las etiquetas de cluster al conjunto de datos original
datos$cluster <- as.factor(kmeans_result$cluster)

# Ver las primeras filas del conjunto de datos con las etiquetas de cluster
head(datos)

# Visualizar los resultados del clustering
library(ggplot2)

# Diagrama de dispersión de Sepal.Length y Sepal.Width coloreado por el cluster
ggplot(datos, aes(x = Sepal.Length, y = Sepal.Width, color = cluster)) +
  geom_point() +
  labs(title = "Clustering K-Means de Flores Iris (Sepal.Length vs Sepal.Width)")

# Diagrama de dispersión de Petal.Length y Petal.Width coloreado por el cluster
ggplot(datos, aes(x = Petal.Length, y = Petal.Width, color = cluster)) +
  geom_point() +
  labs(title = "Clustering K-Means de Flores Iris (Petal.Length vs Petal.Width)")

# Cálculo y gráfico del coeficiente de silueta
# Cargar la librería 'cluster' para la función silhouette
library(cluster)

# Defino el rango de números de clusters
rango_clusters <- 2:8

# Crear un vector para almacenar los coeficientes de silueta
coeficientes_silueta <- numeric()

# Realizar el clustering K-Means para diferentes números de clusters
for (k in rango_clusters) {
  kmeans_result <- kmeans(datos, centers = k)
  coef_silueta <- silhouette(kmeans_result$cluster, dist(datos))
  coeficientes_silueta <- c(coeficientes_silueta, mean(coef_silueta[, "sil_width"]))
}

data_frame <- data.frame(NumeroClusters = rango_clusters, CoeficienteSilueta = coeficientes_silueta)

ggplot(data_frame, aes(x = NumeroClusters, y = CoeficienteSilueta)) +
  geom_line() +
  geom_point() +
  labs(title = "Coeficiente de Silueta para Diferentes Números de Clusters", 
       x = "Número de Clusters", y = "Coeficiente de Silueta")


# Cálculo y grafico el método de Elbow
# Crear un vector para almacenar la variabilidad intra-cluster (elbow)
variabilidad_intra_cluster <- numeric()

# Realizar el clustering K-Means para diferentes números de clusters
for (k in rango_clusters) {
  kmeans_result <- kmeans(datos, centers = k)
  
  # Calcular la variabilidad intra-cluster (elbow)
  variabilidad_intra_cluster <- c(variabilidad_intra_cluster, kmeans_result$tot.withinss)
}

# Crear un gráfico para visualizar el método del codo
library(ggplot2)

data_frame <- data.frame(NumeroClusters = rango_clusters, 
                         VariabilidadIntraCluster = variabilidad_intra_cluster)

# Gráfico del método del codo
ggplot(data_frame, aes(x = NumeroClusters, y = VariabilidadIntraCluster)) +
  geom_line() +
  geom_point() +
  labs(title = "Método Elbow  para Determinar el Número Óptimo de Clusters", 
       x = "Número de Clusters", y = "Variabilidad Intra-Cluster")
