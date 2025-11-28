# Relatório Analítico — E-commerce

**Equipe:** Beatriz Paredes, Catarina Loureiro, Isabella Batista._

**Data:** 28/11/25


## Sumário Executivo (3–5 achados)

 Este relatório apresenta a análise estatística de um e-commerce brasileiro, com foco em
 métricas de receita, margens, prazos de entrega, comportamento do cliente e eficiência
 operacional. Utilizou-se um conjunto de dados simulado com 500 pedidos, abrangendo
 tabelas dimensionais e fato (DIM_Customer, DIM_Delivery, DIM_Products,
 DIM_Shopping e FACT_Orders). O objetivo foi construir um pipeline de dados que
 permitisse realizar análises descritivas, inferenciais e testes de hipótese para apoiar a
 tomada de decisão da direção da empresa.
 
 Principais conclusões: - Ticket médio de aproximadamente R$ 2.400, com intervalo de
 confiança de 95% entre R$ 2.282 e R$ 2.517. - Atraso médio de 0,44 dias (IC95%:
 0,31–0,58). - 42% dos pedidos apresentaram atraso (IC95%: 37,8%–46,5%). - 11% das
 compras foram canceladas (IC95%: 8,6%–14,1%). Esses resultados indicam que, embora
 a operação apresente bom desempenho, há espaço para melhorias logísticas e de
 conversão

## Dados & Método

 As tabelas foram integradas a partir do esquema estrela sugerido, relacionando
 dimensões de cliente, produto, entrega e pedido. Os dados passaram por processos de
 limpeza, checagem de chaves, tratamento de ausentes, remoção de duplicatas e
 verificação de integridade referencial. Ferramentas utilizadas: Python (pandas, scipy,
 statsmodels, matplotlib) e DuckDB para consultas SQL locais.

## EDA

 Na análise descritiva, observou-se forte correlação (0.99) entre subtotal e total, o que
 valida a consistência dos cálculos. A variável de frete apresentou correlação negativa com
 o valor total (-0.52), sugerindo que pedidos de maior valor tendem a ter
 proporcionalmente menor custo de frete. Distribuições de ticket e desconto apresentaram
 comportamento aproximadamente normal, com poucos outliers

## Inferência

 Foram estimados intervalos de confiança para as principais métricas de interesse. Os
 cálculos indicam estabilidade no ticket médio e variações controladas em atraso e
 cancelamento. As proporções de atraso e cancelamento mostram variabilidade
 moderada, sugerindo necessidade de acompanhamento constante.

 | Métrica | Média | IC 95% Inferior | IC 95% Superior |
 |---------|-------|-----------------|-----------------|
 |Ticket médio (R$)|2399.74|2282.41|2517.07|
 | Atraso (dias)| 0.44| 0.31|0.58|
 | Taxa de atraso|42.2%|37.8%| 46.5%|
 |Taxa de cancelamento|11.4%| 8.6%| 14.1%|

## Testes de Hipótese

Foram realizados 10 testes de hipótese principais, incluindo ANOVA, testes de proporção
e correlação. Os resultados mais relevantes indicaram: - Diferenças significativas entre
ticket médio por método de pagamento (p < 0.05). - Correlação entre desconto e total (ρ ≈-0.13, p < 0.05). - Dependência entre tipo de frete e atraso (p < 0.05). - Taxas de cancelamento significativamente maiores para boletos em comparação ao PIX (p < 0.05).

## KPIs & Recomendações

O estudo confirmou a solidez da base de dados e revelou padrões operacionais
relevantes. Sugere-se: 1. Reavaliar processos logísticos em regiões com maior proporção
de atrasos. 2. Manter incentivos para pagamentos via PIX, que apresentam menor taxa
de cancelamento. 3. Continuar monitorando descontos e elasticidade de demanda. 4.
Ampliar análises sazonais e por categoria para aprimorar estratégias comerciais.

## Apêndice Técnico
O código-fonte do projeto (Python e SQL) foi organizado nos diretórios `notebooks/` e
`sql/`. As figuras e tabelas derivadas foram armazenadas em `figures/` e `report/`. O
pipeline de dados é totalmente reprodutível, podendo ser executado com DuckDB e
Python 3.11.

