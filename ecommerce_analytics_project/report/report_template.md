# Relatório Analítico — E-commerce

**Equipe:** _preencha com os nomes (máx. 3)._

**Autora/Autor (entrega individual):** _seu nome aqui._

**Data:** _preencha_


## Sumário Executivo (3–5 achados)
- [ ] Insight 1
- [ ] Insight 2
- [ ] Insight 3
- [ ] Insight 4

## Dados & Método
- Esquema em estrela (FACT_Orders, DIM_*) conforme especificação.
- Joins: `FACT_Orders.Customer_Id ↔ DIM_Customer.Customer_Id`, `FACT_Orders.Delivery_Id ↔ DIM_Delivery.Delivery_Id`.
- Tipos, NA, deduplicação, chaves e outliers documentados.
- Reprodutibilidade: DuckDB + Python (este repositório).

## EDA
Inclua histogramas, boxplots, correlações e sazonalidade (figuras em `/figures`).

## Inferência
- Intervalos de Confiança (95%): ticket, atraso, proporções (atraso, cancelamento).
- Suposições: normalidade, independência.
- **≥ 10 Testes de hipótese:** descreva H0/H1, método, p-valor, tamanho de efeito e interpretação de negócio.
  - Veja `figures/tests_results.csv` produzido pelo notebook.

## Modelagem Leve
- Regressão linear para `Total`.
- Regressão logística para `is_late`.
- Interprete coeficientes e impactos gerenciais.

## KPIs & Recomendações
- Receita, ticket médio, frete, desconto médio, take-rate de frete, prazos e atrasos.
- Conversão por payment, performance logística por Services, mix por Category/Subcategory, sazonalidade.
- Recomendações acionáveis (pricing, frete, operações, incentivos de pagamento).

## Apêndice Técnico
- SQL usado: `sql/schema.sql` e `sql/analysis.sql`.
- Python: `notebooks/ecommerce_analytics.ipynb`.
- Limitações e riscos (viés, amostragem, qualidade de dados).

