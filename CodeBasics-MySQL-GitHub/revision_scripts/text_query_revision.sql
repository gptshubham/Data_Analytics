select * from movies;

select title, industry from movies;

select * from movies where industry="bollywood";

select count(*) from movies where industry="bollywood";
select count(*) from movies where industry="hollywood";

select distinct industry from movies;
select distinct release_year from movies;
select distinct studio from movies;
select distinct studio from movies where studio!='';
select * from movies where studio='';

select * from movies where title like "%THOR%";
select * from movies where title like "%america%";

