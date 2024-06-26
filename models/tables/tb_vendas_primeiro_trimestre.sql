{% set meses = ("JAN","FEB","MAR") %}
{% set ano = 2008 %}

with source_date as (
    select 
        dateid as id_date,
        month as mes,
        year as ano
    from "sample_data_dev"."tickit"."date"
),
sales_date as (
    select source_date.mes,
        sum(QTD_VENDIDA)
    from {{ ref("vw_sales") }} sales inner join source_date
    on sales.id_date = source_date.id_date
    where source_date.mes in {{meses}}
    and source_date.mes = '{{ano}}'
    group by source_date.mes
)
select * from sales_date