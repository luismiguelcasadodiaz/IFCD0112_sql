--  total parcial y total general  por Person Type y email del número de personas

SELECT PersonType, EmailPromotion, count(*) as total,
grouping(PersonType)  as grupoperson,
grouping(EmailPromotion)  as grupoEmailP
FROM [AdventureWorks2022].[Person].[Person]
GROUP BY ROLLUP( PersonType, EmailPromotion)
