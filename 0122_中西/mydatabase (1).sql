-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-01-22 02:49:46
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `mydatabase`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `board`
--

CREATE TABLE `board` (
  `id` int(50) NOT NULL COMMENT 'お店のID',
  `username` varchar(50) NOT NULL COMMENT '投稿者',
  `comment` varchar(100) NOT NULL COMMENT 'コメント',
  `rating` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `board`
--

INSERT INTO `board` (`id`, `username`, `comment`, `rating`) VALUES
(1, 'yurika', 'a', '1'),
(1, 'yurika', 'いち', '1'),
(1, 'yurika', 'に', '2'),
(1, 'yurika', 'に', '2'),
(2, 'user1', 'おいしいいいいいい', '4'),
(2, 'user1', 'あ', '1'),
(2, 'user1', 'あ', '1'),
(3, 'yurika', 'aaaa', '3'),
(1, 'user6', 'wa', '5');

-- --------------------------------------------------------

--
-- テーブルの構造 `bookmark`
--

CREATE TABLE `bookmark` (
  `username` varchar(20) NOT NULL,
  `storename` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `bookmark`
--

INSERT INTO `bookmark` (`username`, `storename`, `address`) VALUES
('yurika', 'nicocafe', '福岡県北九州市小倉北区足原2丁目5-29'),
('yurika', '文学', '福岡県北九州市小倉北区田町12‐16'),
('user0', 'ナナカフェ', '福岡県北九州市小倉北区京町3丁目11‐1　小倉駅前セントシティ1階'),
('user6', '宇治茶舗', '福岡県北九州市小倉北区室町1丁目1-1　1階'),
('user6', 'nicocafe', '福岡県北九州市小倉北区足原2丁目5-29');

-- --------------------------------------------------------

--
-- テーブルの構造 `store`
--

CREATE TABLE `store` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `iframe` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `store`
--

INSERT INTO `store` (`id`, `name`, `address`, `tags`, `image`, `iframe`) VALUES
(1, 'nicocafe', '福岡県北九州市小倉北区足原2丁目5-29', '小倉、足原、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.920891496393!2d130.8943582755521!3d33.865929573227696!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543c0a0157466eb%3A0xd936ff31744b9513!2z44CSODAyLTAwNDMg56aP5bKh55yM5YyX5Lmd5bee5biC5bCP5YCJ5YyX5Yy66Laz5Y6f77yS5LiB55uu77yV4oiS77yS77yZ!5e0!3m2!1sja!2sjp!4v1734405260730!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(2, '文学', '福岡県北九州市小倉北区田町12‐16', '小倉、田町、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.3214711179503!2d130.86637127555284!3d33.88137367322183!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543b8a89344f2e3%3A0x110390522b54c8c8!2z44CSODAzLTA4MTcg56aP5bKh55yM5YyX5Lmd5bee5biC5bCP5YCJ5YyX5Yy655Sw55S677yR77yS4oiS77yR77yW!5e0!3m2!1sja!2sjp!4v1734405603279!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(3, 'ナナカフェ', '福岡県北九州市小倉北区京町3丁目11‐1　小倉駅前セントシティ1階', '小倉、京町、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.173664232748!2d130.87993287555284!3d33.885180973220294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543bf4c25fc47b1%3A0xf3883b83a5dbd4f4!2z44Kt44OP44OBIOOCq-ODleOCpyDjgrvjg7Pjg4jjgrfjg4bjgqM!5e0!3m2!1sja!2sjp!4v1734405834879!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(4, '宇治茶舗', '福岡県北九州市小倉北区室町1丁目1-1　1階', '小倉、室町、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.1441189600023!2d130.872346075553!3d33.88594197322005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543b8b262448749%3A0x27dacd8f9a5a209!2z44CSODAzLTA4MTIg56aP5bKh55yM5YyX5Lmd5bee5biC5bCP5YCJ5YyX5Yy65a6k55S677yR5LiB55uu77yR4oiS77yRIDHpmo4!5e0!3m2!1sja!2sjp!4v1734405981948!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(5, 'Unight', '福岡県北九州市小倉北区浅野2丁目8-38', '小倉、浅野、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.0147690122258!2d130.87842347555318!3d33.889273473218836!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543bf4bae2dc2d1%3A0x91d26b9b8bfdc356!2z44CSODAyLTAwMDEg56aP5bKh55yM5YyX5Lmd5bee5biC5bCP5YCJ5YyX5Yy65rWF6YeO77yS5LiB55uu77yY4oiS77yT77yYIOajruacrOODk-ODqw!5e0!3m2!1sja!2sjp!4v1734406059539!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(6, 'キャッスルカフェ', '福岡県北九州市小倉北区城内2丁目1', '小倉、小倉城、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1392.6150994966301!2d130.87452965536838!3d33.88410158839347!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543b900520224af%3A0xfcdffab7b729b618!2z5bCP5YCJ5Z-OIOOCreODo-ODg-OCueODq-OCq-ODleOCpw!5e0!3m2!1sja!2sjp!4v1734406155899!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(7, 'green tea', '福岡県北九州市小倉北区浅野1丁目１－１　アミュプラザ小倉西館６F', '小倉、浅野、カフェ、抹茶、和', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.11719187565!2d130.87947627555306!3d33.886635523219795!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543bf4c0d17c2d9%3A0x9158a9b811d1d8b!2zbmFuYSdzIGdyZWVuIHRlYSDjgqLjg5_jg6Xjg5fjg6njgrblsI_lgInlupc!5e0!3m2!1sja!2sjp!4v1734406234588!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(8, 'baracafe', '福岡県北九州市小倉北区魚町2丁目4-16', '小倉、魚町、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.2287232594617!2d130.87760457555297!3d33.88376277322093!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543bf4d7724697d%3A0xcf502bbefa019695!2zQiZHLCDvvJLkuIHnm64t77yULe-8ke-8liDprZrnlLog5bCP5YCJ5YyX5Yy6IOWMl-S5neW3nuW4giDnpo_lsqHnnIwgODAyLTAwMDY!5e0!3m2!1sja!2sjp!4v1734486187793!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(9, 'oremoko', '福岡県北九州市小倉北区浅野2丁目12-3　2F', '小倉、浅野、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.045326351064!2d130.87876897555307!3d33.88848647321908!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543bf4bbddd0465%3A0x8e4d0d58fdd46698!2z44CSODAyLTAwMDEg56aP5bKh55yM5YyX5Lmd5bee5biC5bCP5YCJ5YyX5Yy65rWF6YeO77yS5LiB55uu77yR77yS4oiS77yTIOWkp-S9kOODk-ODqyAyZg!5e0!3m2!1sja!2sjp!4v1734486270642!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(10, 'プリコット', '福岡県北九州市小倉北区京町2丁目6-7', '小倉、京町、カフェ', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.1448605107867!2d130.87800347555304!3d33.88592287322013!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543bf4c5914292f%3A0x22b431640b7b95c2!2z44CSODAyLTAwMDIg56aP5bKh55yM5YyX5Lmd5bee5biC5bCP5YCJ5YyX5Yy65Lqs55S677yS5LiB55uu77yW4oiS77yX!5e0!3m2!1sja!2sjp!4v1734486354382!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(11, 'cafeホトリ', '山口県下関市今浦町１０−８\r\n', '下関、パンケーキ、昼から、夜まで', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6619.034991600496!2d130.9216141!3d33.9535361!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3543bdb4429b7c67%3A0xed14f63ff4c56af5!2z77yj77yh77ym77yl44Ob44OI44Oq!5e0!3m2!1sja!2sjp!4v1737438196599!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade'),
(12, 'そらまめ舎', '山口県下関市細江町２丁目２−１０ 和田ビル 1階', '下関、プリン、昼から', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6619.161553976873!2d130.9274169586914!3d33.951909000000015!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35448d3bb0f13cff%3A0xc4b39046343f067!2z44KA44GO44G-44KB6IiO!5e0!3m2!1sja!2sjp!4v1737439267994!5m2!1sja!2sjp\" width=\"300\" height=\"300\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade');

-- --------------------------------------------------------

--
-- テーブルの構造 `storeimg`
--

CREATE TABLE `storeimg` (
  `storeimage` varchar(50) NOT NULL,
  `storeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `storeimg`
--

INSERT INTO `storeimg` (`storeimage`, `storeid`) VALUES
('H:\\★卒業研究\\グループ\\だいたいB型\\共有\\カフェ写真\\nikocafe', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`username`, `password`, `comment`, `name`) VALUES
('user3', 'password123', '', ''),
('user4', 'password123', '', ''),
('user5', 'password123', '', ''),
('user6', 'password123', '', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `view_history`
--

CREATE TABLE `view_history` (
  `username` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `view_history`
--

INSERT INTO `view_history` (`username`, `id`) VALUES
('user3', 1),
('user3', 1),
('user6', 2),
('user3', 10),
('user3', 10),
('user3', 9),
('user3', 1),
('user3', 4),
('user3', 2),
('user6', 1),
('user6', 1);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `store`
--
ALTER TABLE `store`
  ADD KEY `storeid` (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- テーブルのインデックス `view_history`
--
ALTER TABLE `view_history`
  ADD KEY `FOREIGN KEY` (`id`);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `view_history`
--
ALTER TABLE `view_history`
  ADD CONSTRAINT `FOREIGN KEY` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
