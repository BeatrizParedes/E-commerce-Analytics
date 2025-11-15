
![capa](https://github.com/user-attachments/assets/7b9b1205-23be-4322-b2c4-df434e0e91b8)

# E-commerce Analytics — Relatório Analítico

Projeto desenvolvido para a disciplina **Estatística e Probabilidade**, com o objetivo de realizar uma análise exploratória e inferencial sobre o desempenho de um e-commerce brasileiro.  

---

### Equipe e Contato

| Integrante | Perfil |
|------------|--------|
| <div style="width:80px; height:80px; overflow:hidden; border-radius:8px;"> <img src="https://github.com/user-attachments/assets/ab3d5f4b-1a84-4660-b6ec-bae496e9dc1a" width="80" style="object-fit:cover;"> </div> | **Beatriz Paredes** <br> [LinkedIn](https://www.linkedin.com/in/beatriz-paredes-do-nascimento-91664a182/) |
| <div style="width:80px; height:80px; overflow:hidden; border-radius:8px;"> <img src="https://github.com/user-attachments/assets/c3b643ec-ebe1-4c73-991f-b7b60d6045bb" width="80" style="object-fit:cover;"> </div> | **Catarina Loureiro** <br> [LinkedIn](https://www.linkedin.com/in/catarina-virginia-lima-loureiro-xavier-439731338/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app) |
| <div style="width:80px; height:80px; overflow:hidden; border-radius:8px;"> <img src="https://github.com/user-attachments/assets/73402bd7-f077-4679-9cbe-57bcbb939b29" width="80" style="object-fit:cover;"> </div> | **Isabella Batista** <br> [LinkedIn](https://www.linkedin.com/in/isabella-b-a096452b2/) |

---

## Objetivo do Projeto

O objetivo principal deste projeto é **analisar estatisticamente o desempenho de um e-commerce** por meio de um conjunto de dados simulado com **500 pedidos**, a fim de:
- Avaliar métricas de receita e margem;
- Entender o comportamento do cliente;
- Investigar atrasos e cancelamentos;
- Identificar oportunidades de melhoria operacional e comercial.

---

## Estrutura dos Dados

Os dados seguem um **modelo estrela (Star Schema)** com as seguintes tabelas:

- `DIM_Customer` — informações dos clientes  
- `DIM_Products` — catálogo de produtos  
- `DIM_Delivery` — dados de entrega  
- `DIM_Shopping` — informações de carrinhos e pagamentos  
- `FACT_Orders` — fatos relacionados aos pedidos  

Os dados passaram por:
- Limpeza e padronização de variáveis;  
- Verificação de integridade referencial;  
- Tratamento de valores ausentes e duplicados.

---

## Tecnologias e Ferramentas

| Tecnologia | Uso Principal |
|-------------|----------------|
| **Python (3.11)** | Análise estatística e visualização |
| **Pandas, Scipy, Statsmodels, Matplotlib** | EDA, testes de hipótese e gráficos |
| **DuckDB** | Consultas SQL locais e integração de tabelas |

---

## Análises Realizadas

### Análise Exploratória (EDA)

- Correlação **subtotal x total:** 0.99 → valida consistência.  
- Correlação **frete x total:** -0.52 → pedidos caros têm menor proporção de frete.  
- Distribuições de **ticket médio e desconto** próximas do normal, com poucos outliers.

### Inferência Estatística (ICs 95%)

| Métrica | Média | IC 95% Inferior | IC 95% Superior |
|----------|--------|----------------|----------------|
| Ticket médio (R$) | 2.399,74 | 2.282,41 | 2.517,07 |
| Atraso (dias) | 0,44 | 0,31 | 0,58 |
| Taxa de atraso | 42,2% | 37,8% | 46,5% |
| Taxa de cancelamento | 11,4% | 8,6% | 14,1% |

---

## Testes de Hipótese

Foram realizados **10 testes principais**, incluindo ANOVA, testes de proporções e correlação.

Principais resultados:
-  Diferenças significativas no **ticket médio por método de pagamento** (p < 0,05);  
-  Correlação entre **desconto e valor total** (ρ ≈ -0,13, p < 0,05);  
-  Dependência entre **tipo de frete e atraso** (p < 0,05);  
-  **Boletos** apresentaram **maior taxa de cancelamento** que pagamentos via PIX (p < 0,05).

---

## Conclusões e Recomendações

- Reavaliar **processos logísticos** em regiões com maior atraso;  
- Manter **incentivos para pagamentos via PIX**;  
- Monitorar **elasticidade de demanda e descontos**;  
- Expandir análises **sazonais e por categoria de produto**.

---

## Estrutura do Projeto

```plaintext
ecommerce-analytics/
│
├── notebooks/        # Cadernos Jupyter com análises e testes
├── sql/              # Scripts SQL para integração e consultas
├── figures/          # Gráficos e visualizações geradas
├── report/           # Saídas analíticas e tabelas
└── README.md         # Este arquivo
````

## Reprodutibilidade
O pipeline é totalmente reprodutível com as seguintes dependências:
````
python==3.11
duckdb
pandas
scipy
statsmodels
matplotlib
````

## Execução do pipeline
````
python -m notebooks.eda
python -m notebooks.inferencia
python -m notebooks.hypothesis_tests
