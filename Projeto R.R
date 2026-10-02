# =====================================================================
# PROJETO: Enterprise Smart Segmentation & Customer Profiling
# LINGUAGEM: R | TÉCNICA: Data Mining & K-Means Clustering
# =====================================================================

# 1. Instalar e carregar pacotes necessários (se necessário)
if(!require(cluster)) install.packages("cluster")
library(cluster)

# 2. Criar a base de dados simulada de clientes com alto volume
set.seed(42)
clientes_enterprise <- data.frame(
  Cliente_ID = 1:20,
  Idade = c(23, 45, 31, 52, 29, 60, 38, 41, 25, 55, 34, 48, 27, 51, 36, 43, 22, 58, 33, 46),
  Salario_Anual = c(32000, 115000, 62000, 138000, 55000, 145000, 78000, 85000, 38000, 142000, 
                    71000, 125000, 42000, 130000, 75000, 92000, 31000, 148000, 68000, 118000),
  Score_Fidelidade = c(3, 8, 5, 9, 4, 10, 6, 7, 3, 9, 6, 8, 4, 9, 6, 7, 2, 10, 5, 8)
)

# 3. Preparação e Normalização dos Dados para Machine Learning
# Selecionamos apenas as variáveis numéricas para a clusterização
dados_cluster <- clientes_enterprise[, c("Idade", "Salario_Anual", "Score_Fidelidade")]
dados_normalizados <- scale(dados_cluster)

# 4. Aplicação do Método do Cotovelo (Elbow Method) para encontrar o K ideal
wss <- numeric(5)
for (k in 1:5) {
  wss[k] <- sum(kmeans(dados_normalizados, centers = k, nstart = 25)$tot.withinss)
}

# Gráfico do Cotovelo
plot(1:5, wss, type = "b", pch = 19, frame = FALSE,
     xlab = "Número de Clusters (K)",
     ylab = "Soma dos Quadrados Internos (WSS)",
     main = "Método do Cotovelo para Definição de K")

# 5. Execução do Algoritmo K-Means final (definindo K = 3 grupos estratégicos)
set.seed(42)
resultado_final <- kmeans(dados_normalizados, centers = 3, nstart = 25)

# Adicionar os grupos de volta à base original
clientes_enterprise$Segmento_Cliente <- as.factor(resultado_final$cluster)

# Tradução executiva dos segmentos para o negócio
levels(clientes_enterprise$Segmento_Cliente) <- c("Em Ascensão", "Standard / Base", "VIPs / High-Value")

# Visualizar a base segmentada
print("=== CLIENTES SEGMENTADOS COM SUCESSO ===")
print(clientes_enterprise)

# 6. Gráfico de Dispersão Profissional dos Clusters
plot(clientes_enterprise$Idade, clientes_enterprise$Salario_Anual,
     col = clientes_enterprise$Segmento_Cliente,
     pch = 19, cex = 1.8,
     main = "Segmentação Estratégica de Clientes (Data Mining)",
     xlab = "Idade", ylab = "Salário Anual (R$)")

# Adicionar legenda explicativa no gráfico
legend("topleft", legend = levels(clientes_enterprise$Segmento_Cliente), 
       col = 1:3, pch = 19, bty = "n", cex = 0.9)