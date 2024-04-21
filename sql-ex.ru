Задание: 1 
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

select model, speed ,hd 
from pc
where price < 500;

Задание: 2 
Найдите производителей принтеров. Вывести: maker

select  distinct maker
from product
where type='printer';

Задание: 3 
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

select model,ram,screen
from laptop
where price>1000;

Задание: 4 
Найдите все записи таблицы Printer для цветных принтеров

select *
from printer
where color='y';

Задание: 5 
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

select model,speed,hd
from pc
where  (cd='12x' or cd='24x') and price <600;

Задание: 6 
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

select  distinct product.maker,laptop.speed
from product 
join laptop on product.model=laptop.model
where type='laptop' and hd>=10

Задание: 7 
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

Select product.model,pc.price
from product
join  pc on product.model=pc.model
where product.maker='B'
UNION
Select product.model,laptop.price
from product
join  laptop on product.model=laptop.model
where product.maker='B'
Union
Select product.model,printer.price
from product
join  printer on product.model=printer.model
where product.maker='B';

Задание: 8 
Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT maker FROM product
where type='pc'
EXCEPT
SELECT maker FROM product WHERE type ='laptop';

Задание: 9 
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

Select distinct product.maker
from product
join pc on product.model=pc.model
where speed>=450;

Задание: 10 
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

Select model,price
from printer
where price =(select max(price) from printer);

Задание: 11 
Найдите среднюю скорость ПК.

Select AVG(speed)
from pc;

Задание 12 :
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

Select AVG(speed) as avg_speed
from laptop
where price>1000;

Задание: 13 
Найдите среднюю скорость ПК, выпущенных производителем A.

select AVG(speed) as avg_speed
from pc
join product on product.model = pc.model
where maker='A';

Задание: 14 
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

select hd
from pc
group by hd
having count(hd)>=2;

Задание: 15
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.


SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM pc p1, pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model













