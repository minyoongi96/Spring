-- 아이디, 비밀번호, 닉네임, 전화번호, 주소
create table smember(
	id varchar(100) not null,
	pw varchar(100) not null,
	nick varchar(1000) not null,
	phone varchar(100) not null,
	addr varchar(100) not null,
	primary key(id)
);

insert into smember values('admin', '1234', '관리자', '010-1234-5678', '광주 인공지능사관학교');

insert into smember values('user1', '1234', '사용자1', '010-9876-5432', '광주 북구');
insert into smember values('user2', '1234', '사용자2', '010-4321-1234', '광주 서구');
insert into smember values('user3', '1234', '사용자3', '010-1212-9999', '광주 남구');

select * from smember;

