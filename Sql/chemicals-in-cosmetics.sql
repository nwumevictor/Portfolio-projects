-- Viewing the whole table

select *
from Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']

--(1) chemicals used the most in cosmetics and personal care products**

SELECT TOP 10 ChemicalName,
COUNT(ChemicalName) as numberOfTimesAppeared
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']
group by ChemicalName
ORDER By numberOfTimesAppeared Desc


--(2) brand that has chemicals discontinued and removed

SELECT distinct BrandName, ChemicalDateRemoved
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']
WHERE DiscontinuedDate is not null and ChemicalDateRemoved is not null


--(3) brands that had chemicals which were mostly reported in 2018.


SELECT DISTINCT BrandName
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']
WHERE InitialDateReported like '%2018%' and MostRecentDateReported like '%2018%'
GROUP BY BrandName


-- (4) brand that has chemicals discontinued and removed, identify the chemicals

SELECT DISTINCT ChemicalName AS ChemicalsDiscontinuedAndRemoved
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']
WHERE DiscontinuedDate <> '' and ChemicalDateRemoved <> ''
ORDER BY ChemicalName Desc


--(5) Can you tell if discontinued chemicals in bath products were removed. 

SELECT PrimaryCategory, DiscontinuedDate, ChemicalDateRemoved
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']
WHERE DiscontinuedDate is not null and ChemicalDateRemoved is not null
GROUP BY PrimaryCategory, DiscontinuedDate, ChemicalDateRemoved
ORDER BY 3

--(6) total number of products
SELECT COUNT(ProductName) as NumberOfProducts
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']

--(7) Total number of companies

SELECT COUNT(distinct CompanyName) as NumberOfCompanies
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']

--(8) Total number of Chemicals

SELECT count(distinct ChemicalName) as NumberOfChemicals
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']


--(9) Total number of brands

SELECT count(distinct BrandName) as NumberOfBrands
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']

--(10) companies using chemicals more **

SELECT TOP 10 CompanyName, count(ChemicalName) as NumberOfChemicals
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']
GROUP BY CompanyName
ORDER BY NumberOfChemicals DESC

--(11) most reported Products**

SELECT TOP 10 ProductName, count(InitialDateReported) as NumberOfTimesReported
FROM Cosmeticsproject.dbo.['chemicals-in-cosmetics-$']
WHERE InitialDateReported is not null
GROUP BY ProductName
ORDER BY NumberOfTimesReported DESC