SELECT * FROM dim_coping_mechanisms;
SELECT * FROM DIM_MENTAL_HEALTH_STATUS;
SELECT * FROM DIM_STUDENT_DEMOGRAPHICS;
SELECT * FROM FACT_SURVEY;

#number of respondents and average mental rating per degree 
SELECT DEGREE,AVG(MENTAL_HEALTH_RATING) AS AVG_MHS, COUNT(F.MENTAL_HEALTH_STATUS_ID) AS COUNT
FROM fact_survey AS F
JOIN dim_student_demographics AS DIM
ON DIM.STUDENT_ID=F.STUDENT_ID
JOIN dim_mental_health_status AS MHS
ON MHS.MENTAL_HEALTH_STATUS_ID = F.MENTAL_HEALTH_STATUS_ID
group by DEGREE
ORDER by COUNT DESC
;
#coping mechanisms compared to effectiveness
select coping_mechanisms, avg(coping_mechanism_effectiveness) as cme ,COUNT(coping_mechanisms) as 'count of coping mechanisms'
from dim_coping_mechanisms 
group by COPING_MECHANISMS
order by cme DESC
;

#gender compared to mental health rating
select gender,avg(mental_health_rating) as avg_mhr, count(f.student_id) as count_rhi
from fact_survey as f
join dim_student_demographics as dem
on dem.student_id = f.student_id
join dim_mental_health_status as mhr
on mhr.MENTAL_HEALTH_STATUS_ID= f.MENTAL_HEALTH_STATUS_ID
group by gender
;

#year of study vs anxiety for future 
select year_of_study,anxiety_about_future,count(anxiety_about_future) as count_anxiety
from fact_survey as f
join dim_student_demographics as dem
on dem.student_id = f.student_id 
join dim_mental_health_status as mhr
on mhr.MENTAL_HEALTH_STATUS_ID=f.MENTAL_HEALTH_STATUS_ID
group by YEAR_OF_STUDY,ANXIETY_ABOUT_FUTURE
order by count_anxiety desc;

#students who use uwc_support_services, the type and their mental ratings LOOKS BETTER WHEN WE REMOVE THE MAYBE WILL CLEAN THIS IN POWERBI
SELECT USE_OF_SUPPORT_SERVICES,SUPPORT_SERVICES_STUDENTS_USE,AVG(MENTAL_HEALTH_RATING) AS AVG_MHR
from fact_survey as f
join dim_mental_health_status as dms
on dms.MENTAL_HEALTH_STATUS_ID = f.MENTAL_HEALTH_STATUS_ID
join dim_coping_mechanisms as cmp
on cmp.COPING_MECHANISMS_ID = f.COPING_MECHANISMS_ID
WHERE NOT USE_OF_SUPPORT_SERVICES='MAYBE'  
group by USE_OF_SUPPORT_SERVICES,SUPPORT_SERVICES_STUDENTS_USE;


#proper sleeping haibits compared to MENTAL_HEALTH_RATING
select proper_sleeping_habits,avg(mental_health_rating) as avg_hr,COUNT(MENTAL_HEALTH_STATUS_ID)
from dim_mental_health_status
group by proper_sleeping_habits
order by avg_hr DESC;

