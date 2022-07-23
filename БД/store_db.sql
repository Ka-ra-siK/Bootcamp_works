/*
 БД онлайн магазина
 */

create database online_store;
use online_store;

/********************Создание таблиц******************/

/*Таблица категорий*/
create table categories(
    id int primary key not null,
    name varchar(64)
);

/*Таблица изображений*/
create table img(
    id int primary key not null,
    alt varchar(64),
    product_img varchar(64)
);

/*Таблица товаров*/
create table products(
    id int primary key not null,
    name varchar(64),
    current_price DECIMAL(15,2),
    sale_price DECIMAL(15,2),
    default_price DECIMAL(15,2),
    description text,
    category_id int,
    img_id int,
    is_active BOOL DEFAULT FALSE NOT NULL,
    FOREIGN KEY (category_id) references categories(id),
    FOREIGN KEY (img_id) references img(id)
);

/*Вспомогательная таблица категорий*/
create table products_category(
    product_id int not null,
    category_id int,
    FOREIGN KEY (product_id) references  products(id),
    FOREIGN KEY (category_id) references categories(id)
);

/*Вспомогательная таблица изображений*/
create table products_img(
    product_id int not null,
    img_id int,
    FOREIGN KEY (product_id) references  products(id),
    FOREIGN KEY (img_id) references img(id)
);


/********************Заполнение таблиц******************/

/*Заполнение таблицы категорий*/
INSERT INTO categories VALUES
(1, 'Майки'),
(2, 'Футболки'),
(3, 'Рубашки'),
(4, 'Верхняя одежда'),
(5, 'Шорты');

/*Заполнение таблицы изображений*/
INSERT INTO img VALUES
(1, 'Картинка_1', 'img/img1.png'),
(2, 'Картинка_2', 'img/img2.png'),
(3, 'Картинка_3', 'img/img3.png'),
(4, 'Картинка_4', 'img/img4.png'),
(5, 'Картинка_5', 'img/img5.png'),
(6, 'Картинка_6', 'img/img6.png');

/*Заполнение таблицы товаров*/
INSERT INTO products VALUES
(1, 'Рубашка medicine', 2499, 2227, 2699,
 'Рубашка Medicine выполнена из вискозной ткани с клетчатым узором. Детали: прямой крой; отложенный воротник; планка и манжеты на пуговицах; карман на груди.',
 3, 1, 1),
(2, 'Футболка UZcotton', 249, 222, 269,
 'Базовая женская футболка Uzcotton выполнена из премиального трикотажа, который удобен в носке и приятен к телу.',
 2, 4, 1);

/*Заполнение вспомогательной таблицы категорий*/
INSERT INTO products_category VALUES
(1, 3),
(1, 4),
(2, 2),
(2, 4);

/*Заполнение вспомогательной таблицы изображений*/
INSERT INTO products_img VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6);
