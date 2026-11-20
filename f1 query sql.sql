select * from constructors;
select * from drivers;
select * from pit_stops;
select * from races;
 select * from results;

##
###

select d.driverId, concat(d.forename, "", d.surname) as `Full Name`, 
d.nationality, count(res.positionOrder) as `Total Wins` from drivers as d
inner join results as res on d.driverId =res.driverId
where res.positionOrder =1
group by d.driverId, d.forename, d.surname, d.nationality
order by `Total Wins` desc
limit 10;

select c.constructorId, c.name,sum(res.points) as `Total Points`
from constructors as c inner join results as res
on c.constructorId = res.constructorId
inner join races as rac on rac.raceId = res.raceId
where year = 2023
group by c.constructorId,c.name
order by `Total Points` desc;

select d.driverId, concat(d.forename, "", d.surname) as `Full Name`,
rac.year, rac.name as `Grand Prix`, res.grid, res.positionOrder as `Final Position`
from drivers as d
inner join results as res on
d.driverId =res.driverId
inner join races as rac on
rac.raceId =res.raceId
where res.grid >=10
and res.positionOrder =1
order by rac.year desc,
res.grid desc;

##max Verstappen is the driver who as achieved this feat for 3 times in a row recently


##Q.4 modern pit crew efficiency audit

select c.constructorId, c.name, avg(p.milliseconds/1000) as `Average pitstop time`,
sum(p.stop) as `Total Stops`
from constructors as c inner join results as res
on c.constructorId =res.constructorId
inner join races as rac on res.raceId =rac.raceId
inner join pit_stops as p on p.raceId =rac.raceId
where rac.year >=2021
group  by c.constructorid, c.name
having `Total Stops` >=20;

#the company audi and cadillac have least amount of stops from 2021


#Q.5 best of the rest(subquery)
select d.driverId, concat(d.forename," ",d.surname) as `Full Name`, c.name,
count(positionOrder) as `Podium Finish`
from drivers as d inner join results as res on res.driverId = d.driverId
inner join constructors as c on res.constructorId = c.constructorId
where res.positionOrder <=3 and d.driverId not in (
select d.driverId = res.driverId where res.positionOrder=1)
group by d.driverId,d.forename,d.surname,c.name
having `Podium Finish` >= 5
order by `Podium Finish` desc;