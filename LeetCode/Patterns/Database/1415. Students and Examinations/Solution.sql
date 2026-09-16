select student_id,student_name,subject_name,coalesce(cnt,0) as attended_exams from(
        select t1.student_id,t1.student_name,t1.subject_name,t2.cnt from
            (select s.student_id,s.student_name,sb.subject_name from 
            students s cross join subjects sb) as t1
            left join (select student_id,subject_name,count(subject_name) as cnt from
            examinations group by student_id,subject_name)as t2 on
            t1.subject_name = t2.subject_name and t1.student_id = t2.student_id        
)as t order by student_id,subject_name;