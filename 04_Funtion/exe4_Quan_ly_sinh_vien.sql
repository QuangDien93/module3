SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET GLOBAL sql_mode=(SELECT CONCAT(@@sql_mode, ',ONLY_FULL_GROUP_BY'));
use quan_ly_sinh_vien;
--- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subject
order by credit desc
limit 1;

--- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select subject.subID, SubName, Credit, Status, mark.mark
from subject join mark on subject.subID = mark.subID
order by mark.mark desc
limit 1;

--- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.studentName, student.address, student.status, avg(mark) as DiemTrungBinh
from student join mark on student.studentID = mark.studentID
				join subject on mark.subID = subject.subID
group by student.studentName, student.StudentId;



                