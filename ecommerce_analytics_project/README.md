# E-commerce Analytics — Projeto (SQL + Python)

## Como usar
1. Coloque seus CSVs em `data/` com estes nomes (ajuste se necessário):
   - DIM_Customer.csv, DIM_Delivery.csv, DIM_Products.csv, DIM_Shopping.csv, FACT_Orders.csv
2. Abra e rode `notebooks/ecommerce_analytics.ipynb`.
3. Os gráficos e tabelas exportadas vão para `figures/`.
4. Preencha `report/report_template.md` e gere um PDF (ex.: VSCode Markdown PDF ou pandoc).

## Ambiente
- DuckDB, Python 3.x, pandas, scipy, statsmodels, matplotlib.

## Observações
- Gráficos usam apenas matplotlib, um por figura, sem estilos/cores explícitas.
- Ajuste de múltiplas comparações (ex.: Bonferroni) pode ser aplicado conforme necessário.
