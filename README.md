# Enterprise Smart Segmentation & Customer Profiling Engine

> Um motor analítico de Mineração de Dados e Machine Learning desenvolvido em **R** para segmentação inteligente de bases de clientes de grande porte, focado em inteligência de mercado e tomada de decisão estratégica.

---

## 🎯 Sobre o Projeto
Em ambientes corporativos de alta escala, campanhas de marketing genéricas resultam em desperdício de orçamento e baixo retorno. Este projeto demonstra a aplicação prática de **Data Mining** para resolver este problema, utilizando algoritmos de clusterização não supervisionada (**K-Means**) para agrupar clientes com base em critérios multidimensionais (idade, rendimento anual e índice de fidelidade).

O objetivo principal é traduzir dados brutos em personas de negócio claras, permitindo estratégias de retenção e cross-selling altamente direcionadas.

---

## 🛠️ Tecnologias e Ferramentas Utilizadas
* **Linguagem R** (Versão 4.6.1)
* **RStudio IDE**
* **Algoritmos de Machine Learning:** K-Means Clustering, Normalização de Dados (`scale`)
* **Estatística Aplicada:** Método do Cotovelo (*Elbow Method*) para otimização de K

---

## 📈 Metodologia e Pipeline de Dados
1. **Simulação e Tratamento de Dados:** Criação e normalização de uma base de dados estruturada para garantir a mesma escala de peso entre variáveis monetárias e demográficas.
2. **Definição de Clusters (Elbow Method):** Validação matemática do número ideal de agrupamentos para evitar viés analítico.
3. **Modelagem K-Means:** Execução do agrupamento não supervisionado.
4. **Tradução Executiva (Business Labelling):** Mapeamento dos clusters técnicos para perfis estratégicos de negócio:
   * *Em Ascensão*
   * *Standard / Base*
   * *VIPs / High-Value*

---

## 📊 Visualização de Resultados
O script gera gráficos de dispersão analíticos que mapeiam os clusters identificados pelo algoritmo:
