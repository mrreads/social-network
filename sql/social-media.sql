-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 13 2020 г., 17:43
-- Версия сервера: 8.0.19
-- Версия PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `social-media`
--

-- --------------------------------------------------------

--
-- Структура таблицы `audio`
--

CREATE TABLE `audio` (
  `id_audio` int NOT NULL,
  `audio_author` varchar(55) NOT NULL,
  `audio_name` varchar(55) NOT NULL,
  `audio_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `audio`
--

INSERT INTO `audio` (`id_audio`, `audio_author`, `audio_name`, `audio_path`) VALUES
(10, 'Marcin Przybylowicz', 'The Wolven Storm', '067ec5609eca57b543be95eb54a4f65d.mp3');

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id_message` int NOT NULL,
  `message_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message_date` datetime NOT NULL,
  `message_from` int NOT NULL,
  `message_to` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `message`
--

INSERT INTO `message` (`id_message`, `message_text`, `message_date`, `message_from`, `message_to`) VALUES
(14, 'Слыш ты\n', '2019-08-30 12:41:23', 15, 1),
(15, 'Чё надо', '2019-08-30 12:41:32', 1, 15),
(16, 'Ничего\n', '2019-08-30 12:42:38', 15, 1),
(17, 'Привет, я тестирую сообщения!\n\n', '2020-07-11 15:52:17', 16, 1),
(18, 'Да, вижу\n', '2020-07-11 15:52:53', 1, 16),
(19, 'Они и в правду работают', '2020-07-11 15:53:02', 16, 1),
(20, 'asd', '2020-07-13 17:21:27', 16, 15),
(21, 'asda', '2020-07-13 17:23:24', 16, 15),
(22, '', '2020-07-13 17:23:24', 16, 15),
(23, '', '2020-07-13 17:23:27', 16, 15),
(24, 'asdasdas das dasd ', '2020-07-13 17:24:01', 16, 15),
(25, '', '2020-07-13 17:24:01', 16, 15),
(26, 'a sdasd', '2020-07-13 17:24:02', 16, 15),
(27, 'dfasdfasdfasdf', '2020-07-13 17:25:13', 1, 16),
(28, 'asdfasd', '2020-07-13 17:25:14', 1, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id_post` int NOT NULL,
  `id_author` int NOT NULL,
  `id_user` int NOT NULL,
  `post_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id_post`, `id_author`, `id_user`, `post_text`) VALUES
(1, 15, 16, 'Я пишу у этого человека на стене'),
(2, 16, 16, 'я пишу ащвоавыжда ыжвдао ывдывжэа оывжэдаоывжэда');

-- --------------------------------------------------------

--
-- Структура таблицы `user-audio`
--

CREATE TABLE `user-audio` (
  `id_user` int NOT NULL,
  `id_audio` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `user_nickname` varchar(15) NOT NULL,
  `user_email` varchar(35) NOT NULL,
  `user_birthday` date NOT NULL,
  `user_password` varchar(40) NOT NULL,
  `user_firstname` varchar(55) NOT NULL,
  `user_lastname` varchar(55) NOT NULL,
  `user_country` varchar(25) NOT NULL,
  `user_city` varchar(35) NOT NULL,
  `user_info` text NOT NULL,
  `user_profileimage_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `user_nickname`, `user_email`, `user_birthday`, `user_password`, `user_firstname`, `user_lastname`, `user_country`, `user_city`, `user_info`, `user_profileimage_path`) VALUES
(1, 'ReaD', 'mrreads@yandex.com', '2001-04-13', '123', 'Александр', 'Попов', 'Россия', 'Москва', 'Информация обо мне бла бла бла &lt;b&gt; бла бла &lt;/b&gt; бла бла 11', 'defaultUser.jpg'),
(15, 'IvanIvanov', 'ivan@mail.ru', '2019-08-01', '123', 'Иван', 'Иванов', 'Россия', 'Москова', 'фывафыапыпывпфывапфывппфывппфывпфыв', 'defaultUser.jpg'),
(16, 'qwer', 'example1@mail.ru', '1998-02-11', '123', 'Петр', 'Петренко', 'Россия', 'Москва', 'Здесь пару слов обо мне\r\nБла-бла-бла', 'defaultUser.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id_audio`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `message_from` (`message_from`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `fk_post_users` (`id_author`),
  ADD KEY `fk_post_users_0` (`id_user`);

--
-- Индексы таблицы `user-audio`
--
ALTER TABLE `user-audio`
  ADD KEY `id_audio` (`id_audio`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `audio`
--
ALTER TABLE `audio`
  MODIFY `id_audio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`message_from`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_users` FOREIGN KEY (`id_author`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `fk_post_users_0` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `user-audio`
--
ALTER TABLE `user-audio`
  ADD CONSTRAINT `fk_user-audio_audio` FOREIGN KEY (`id_audio`) REFERENCES `audio` (`id_audio`),
  ADD CONSTRAINT `fk_user-audio_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
