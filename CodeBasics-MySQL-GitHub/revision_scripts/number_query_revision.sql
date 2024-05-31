select * from movies where imdb_rating>=9;

select * from movies where imdb_rating<7;

select * from movies where imdb_rating<=5;

select * from movies where imdb_rating>=6 and imdb_rating<=8;
select * from movies where imdb_rating between 6 and 8;

select * from movies where release_year=2022 or release_year=2019 or release_year=2018;
select * from movies where release_year in (2022,2019,2018);

select * from movies where studio in ("marvel studios","zee studios");

select * from movies where imdb_rating is null;

select * from movies where industry="bollywood" order by imdb_rating;
select * from movies where industry="bollywood" order by imdb_rating desc;
select * from movies where industry="bollywood" order by imdb_rating desc limit 5;
select * from movies where industry="hollywood" order by imdb_rating desc limit 5 offset 1;

select * from movies order by release_year desc;

select * from movies where release_year=2022;

select * from movies where release_year>=2022;

select * from movies where release_year>=2020 and imdb_rating>8;

select * from movies where studio in ("Marvel studios","Hombale Films");

select * from movies where title like "%thor%" order by release_year;

select * from movies where studio!="marvel studios";

