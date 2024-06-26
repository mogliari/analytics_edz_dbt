with sales as (

    select * from {{ ref("vw_sales") }}


),

compradores as (

    select
        (firstname ||' '|| lastname) as Nome_Completo, userid
    from "sample_data_dev"."tickit"."users"
),

top_10_compradores as (

    select 
        compradores.Nome_Completo as Nome_Completo,
        sum(sales.QTD_VENDIDA) as QTD_VENDIDA,
        sales.COMISSAO as COMISSAO
    from sales inner join compradores
    on sales.ID_COMPRADOR = compradores.userid
    group by compradores.userid, compradores.Nome_Completo, sales.COMISSAO
    order by QTD_VENDIDA desc
    limit 10

)

select * from top_10_compradores