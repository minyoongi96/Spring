-- 게시판 테이블
create table board(
	idx int not null auto_increment,
	memId varchar(50) not null,
	title varchar(1000) not null,
	contents varchar(1000) not null,
	count int not null default 0,
	writer varchar(100) not null,
	indate datetime not null default now(),
	primary key(idx)
);

commit;

create table member(
	memId varchar(50) not null,
	memPwd varchar(50) not null,
	memName varchar(50) not null,
	primary key(memId)
);

insert into member values('user01', 'user01', '관리자');
insert into member values('user02', 'user02', '민윤기');
insert into member values('user03', 'user03', '황해도');

select * from member;

select * from board;

insert into board (memName, title, contents, writer)
values('오늘 아침에 오다가 해도쌤 봄ㅋㅋ', '땅에 떨어진 과자 드시더라', '한수진');

insert into board (title, contents, writer)
values('[정보]인공지능사관학교 10월초에 가을방학 존재함', '그걸 믿니..?', '황해도');

insert into board (title, contents, writer)
values('나는 이미 팀편성을 알고 있다...', '궁금하신분 명당 5000원에 정보 드립니다', '박매일');

insert into board (title, contents, writer)
values('오점뭐..?', '오점추.....', '박병관');

insert into board (title, contents, writer)
values('최우수상 상금 10만원 더 올라갔어요 여러분', '또 속네...?', '황해도');

select * from board;
