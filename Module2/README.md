# Домашняя работа - Модуль 2

## Задание 1 - Установить БД на компьютере
Установлен PostgreSQL на Mac OS

## Задание 2 - Подключение к Базам Данных и SQL
#### Установить клиент SQL для подключения базы данных
- Установлен клиент PG Admin 4 на Mac OS
####  Создайть 3 таблицы и загрузить данные из Superstore Excel файл в базу данных. Сохранить в GitHub скрипт загрузки данных и создания таблиц.
- Сделано. Скрипты можно загрузить по ссылке:
    [orders.sql](https://github.com/almazuulu/DE-101/blob/master/Module2/Task1/orders.sql); 
    [people.sql](https://github.com/almazuulu/DE-101/blob/master/Module2/Task1/people.sql); 
    [returns.sql](https://github.com/almazuulu/DE-101/blob/master/Module2/Task1/returns.sql);

#### Написать запросы, чтобы ответить на вопросы из Модуля 1. Сохранить в GitHub скрипт загрузки данных и создания таблиц.
- Написаны основые скрипты для получения ответов как на Модуле 1. Пример скрипта можно найти тут: [task1_scripts.sql](https://github.com/almazuulu/DE-101/blob/master/Module2/Task1/task1_scripts.sql); 


## Задание 3 - Модели Данных
#### Нарисовать концептуальную, логическую, физическую модель данных
Все модели данных были реализованы используя бесплатную версию [SqlDBM](https://sqldbm.com/Home/)

- Концептуальная модель данных: 
![ConceptualDataModel](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/conceptual_model_superstore.png)
Стоит отметить, что это чисто мое видение. Постарался разбить на мелкие таблицы с отношениями, и тут есть разница между 
логическими и физическими моделями данных ввиду того, что после были небольшие изменения в логических и физических но
обратно изменять под них времени не хватило.

- Логическая модель данных:
![LogicalDataModel](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/logical_model_superstore.png)
Логическая модель повторяет физическую модель.

- Физическая модель данных:
![PhysicalDataModel](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/physical_model_superstore.png)
В этой модели данных как и говорил выше я постарался разбить на детальные таблицы, чтобы соответствовать 3 форме нормализации
Моя схема чуть расходится с той, что предложил преподаватель. Также я оставил оригинальные id-varchar не добавляя числовые 
представления id в виде int

#### Скопировать DDL и выполнить его в SQL клиенте.
Скопирован и выполнен скрипт на моем PG Admin 4 по тем моделям, что я выполнил по своему видению.
Скрипт можно будет глянуть тут: [superstore_ddl.sql](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/superstore_ddl.sql); 

#### Cделать INSERT INTO SQL, чтобы заполнить Dimensions таблицы
Был выполнен INSERT INTO SQL исходя моих ddl, которые я создавал по своему видению, так что с видением преподавателя может расходится.
Скрипт вставки в Dimensions таблицу можно будет скачать тут: [insert_into_tables.sql](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/insert_into_tables.sql); 

## Задание 4 - Модели Данных
#### Cоздать учетную запись в AWS 
- Сделано

#### Используя сервис AWS Lightsail или AWS RDS создать БД Postgres и активировать Public access
- Сделано
#### Подключится к новой БД через SQL клиент
- Сделано.
#### Загрузить данные из модуля 2.3 (Superstore dataset) в staging (схема БД stg) и загрузить dimensional model (схема dw):
- Скриншоты:
![AWS_Connect1](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/lightsail_db1.png)
![AWS_Connect2](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/lightsail_db2.png)
![AWS_Connect2](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/lightsail_db3.png)
![AWS_Connect2](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/lightsail_db4.png)
![AWS_Connect2](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/lightsail_db5.png)

#### Выполнить свои запросы из предыдущих упражнений. По примеру из Модуля 1:
- Запросы были выполнены используя скрипты преподавателя "Staging stg.orders.sql" и "Business Layer from_stg_to_dw.sql"
Выполненные скрипты по примеру из Модуля 1 по основным показателям:  
[По показателям для Staging] (https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/task2_srcipts_stg.sql);  
[По показателям для Business Layer] (https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/task2_srcipts_dw.sql);

## Задание 5 - Данные до бизнес-пользователя. Пример решений на KlipFolio
- В качестве идеи взяты примеры из Модуля 1. Выполнен DashBoard на KlipFolio используя таблицы из Amazon Lightsail
- Подключение к таблице Orders схемы Staging:
![Data Feed - Orders table](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/klipfolio_orders_stg_feed.png)
- Создана метрика по Sales из таблицы Orders:
![Sales metrics](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/klipfolio_sales_metrics.png)
- Создан Dashboard используя созданную метрику:
![Sales Dashboard](https://github.com/almazuulu/DE-101/blob/master/Module2/Task2/Screenshots/klipfolio_sales_dashboard.png)


















