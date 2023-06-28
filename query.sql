#The total number of new active Covid-19 cases in each province which sorted based on the largest number of cases
SELECT province,sum(New_Active_Cases) as total_new_active_cases
FROM `dataset_covid.Indonesia`
where province not like 'null'
group by province
order by total_new_active_cases DESC;

#Take 2 (two) iso code locations that have the least total number of deaths due to Covid-19
SELECT Location_ISO_Code,sum(Total_Deaths) as Total_Deaths
FROM `dataset_covid.Indonesia`
group by Location_ISO_Code
order by Total_Deaths asc
LIMIT 2;

#Data on the dates when the rate of recovered cases in Indonesia was the highest along with the number of rates
SELECT Distinct Date,ROUND((MAX(Case_Recovered_Rate)*100),2) as recovered_rate
FROM `dataset_covid.Indonesia`
group by Date
order by recovered_rate desc;

#The total case fatality rate and case recovered rate for each location iso code are sorted from the lowest data
SELECT Location_ISO_Code, ROUND(((SUM(Total_Deaths)/SUM(Total_Cases))*100),2) AS total_cases_fatality_rate
FROM `dataset_covid.Indonesia`
group by Location_ISO_Code
order by total_cases_fatality_rate asc;

SELECT Location_ISO_Code, ROUND(((SUM(Total_Recovered)/SUM(Total_Cases))*100),2) AS total_cases_recovered_rate
FROM `dataset_covid.Indonesia`
group by Location_ISO_Code
order by total_cases_recovered_rate asc;

#Data on dates when the total number of Covid-19 cases started to reach the 30.000 mark
SELECT Distinct Date
FROM `dataset_covid.Indonesia`
WHERE total_cases>=30000;

#The amount of data recorded when the Covid-19 case is more than or equal to 30.000
SELECT COUNT(total_cases) as total_kasus
FROM `dataset_covid.Indonesia`
where total_cases=30000 or total_cases>30000;
