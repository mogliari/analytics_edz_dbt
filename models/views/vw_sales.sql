with source_sales as (

    select * from "sample_data_dev"."tickit"."sales"

),

renamed as (

    select 
        SALESID as ID_VENDA,
        LISTID as ID_LISTA,
        SELLERID as ID_VENDEDOR,
        BUYERID as ID_COMPRADOR,
        EVENTID as ID_EVENTO,
        DATEID as ID_DATE,
        QTYSOLD as QTD_VENDIDA,
        PRICEPAID as VALOR_PAGO,
        COMMISSION as COMISSAO,
        TO_CHAR(SALETIME, 'dd/mm/yyyy HH24:MI:SS') as DATA_HORA_VENDA,
        TO_CHAR(SALETIME, 'HH24:MI:SS') as HORA_VENDA,
        cast(SALETIME as date) as DATA_VENDA



    from source_sales

)

select * from renamed