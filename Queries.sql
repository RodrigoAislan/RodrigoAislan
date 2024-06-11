USE[EstadosUnidos_Salários]



SELECT *
INTO Salários_EstadosUnidos 
FROM [dbo].[Dados_salários_USA]
WHERE Industry IN (
    'Law',
    'Business or Consulting',
    'Engineering or Manufacturing',
    'Health Care',
    'Accounting,Banking & Finance',
    'Marketing,Advertising & PR',
    'Government and Public Administration',
    'Nonprofits',
    'Marketing,Advertisement',
    'Media & Digital',
    'Oil & Gas',
    'Technology',
    'Education (Higher Education)',
    'Education (Primary/Secondary)',
    'Environmental',
    'Agriculture or Forestry',
    'Food',
    'Biotechnology',
    'Art & Design',
    'Energy',
    'Entertainment'
);


Select * from
Salários_EstadosUnidos


-- Calculando a quantidade de entrevistados por gênero

SELECT 
    Gender,
    COUNT(*) AS Count
FROM 
    Salários_EstadosUnidos
WHERE 
    Gender IN ('Man', 'Woman')
GROUP BY 
    Gender;

-- TOP 10 INDUSTRIAS POR MÉDIA DE SALÁRIO ANUAL

SELECT TOP 10 Industry, 
       AVG(TRY_CAST(Annual_Salary AS FLOAT)) AS AverageSalary
FROM Salários_EstadosUnidos
GROUP BY Industry
ORDER BY AverageSalary DESC;


--Media de salário por industria e Estado

SELECT industry, state, AVG(TRY_CAST(Annual_Salary AS FLOAT)) AS AverageSalary
FROM Salários_EstadosUnidos
GROUP BY industry, state
ORDER BY AverageSalary DESC;


-- Média de salário em relação ao nível de educaçao

SELECT industry, education_level, AVG(TRY_CAST(Annual_Salary AS FLOAT)) AS AverageSalary
FROM Salários_EstadosUnidos
where [Education_level] in ('High School','College degree','PhD','Master"s degree')
AND [Industry] in ('Energy','Law','Entertainment','Biotechnology','Oil & gas')
GROUP BY industry, education_level
ORDER BY industry, AverageSalary DESC;


--	Média de salário por anos na empresa (Empresas de energia)

SELECT Experience_Years_In_your_Field,Industry,
       AVG(TRY_CAST(Annual_Salary AS FLOAT)) AS AverageSalary
FROM [dbo].[Dados_salários_USA]
where Industry in ('Energy')
GROUP BY Experience_Years_In_your_Field,Industry
ORDER BY Experience_Years_In_your_Field;

--	Média de salário por anos na empresa (Advocacia)

SELECT Experience_Years_In_your_Field,Industry, 
       AVG(TRY_CAST(Annual_Salary AS FLOAT)) AS AverageSalary
FROM [dbo].[Dados_salários_USA]
where Industry in ('Law')
GROUP BY Experience_Years_In_your_Field,Industry
ORDER BY Experience_Years_In_your_Field;



--	Média de salário por anos na empresa (Entretinimento)

SELECT Experience_Years_In_your_Field,Industry,
       AVG(TRY_CAST(Annual_Salary AS FLOAT)) AS AverageSalary
FROM [dbo].[Dados_salários_USA]
where Industry in ('Entertainment')
GROUP BY Experience_Years_In_your_Field,Industry
ORDER BY Experience_Years_In_your_Field;



SELECT Gender, Experience_Years_In_your_Field, AVG(TRY_CAST(Annual_Salary AS FLOAT)) AS AverageSalary
FROM [dbo].[Dados_salários_USA]
GROUP BY Gender, Experience_Years_In_your_Field;



-- Indústria com o maior número de homens
SELECT TOP 1 industry, COUNT(*) AS [Funcionários Homens]
FROM Salários_EstadosUnidos
WHERE Gender = 'Man'
GROUP BY industry
ORDER BY [Funcionários Homens] DESC
;

-- Indústria com o maior número de mulheres
SELECT TOP 1 industry, COUNT(*) AS [Funcionárias Mulheres]
FROM Salários_EstadosUnidos
WHERE Gender = 'Woman'
GROUP BY industry
ORDER BY [Funcionárias Mulheres] DESC
;

-- Cargo da pessoa com maior salário na industria de energia

SELECT TOP 1 job_title, Annual_Salary
FROM Salários_EstadosUnidos
WHERE Industry = 'Energy'
ORDER BY TRY_CAST(Annual_Salary AS FLOAT) DESC

-- Cargo da pessoa com maior salário na industri de advocacia

SELECT TOP 1 job_title, Annual_Salary
FROM Salários_EstadosUnidos
WHERE Industry = 'Law'
ORDER BY TRY_CAST(Annual_Salary AS FLOAT) DESC

-- Cargo da pessoa com maior salário na industria de Entretenimento

SELECT TOP 1 job_title, Annual_Salary
FROM Salários_EstadosUnidos
WHERE Industry = 'Entertainment'
ORDER BY TRY_CAST(Annual_Salary AS FLOAT) DESC