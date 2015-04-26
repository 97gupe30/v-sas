-- phpMyAdmin SQL Dump
-- version 4.3.9
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Tid vid skapande: 26 apr 2015 kl 22:19
-- Serverversion: 5.6.23
-- PHP-version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `v_sas`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_news`
--

CREATE TABLE IF NOT EXISTS `tbl_news` (
  `id` int(11) NOT NULL,
  `posted` date NOT NULL,
  `pilotid` varchar(7) NOT NULL,
  `subject` text NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `posted`, `pilotid`, `subject`, `content`, `image`) VALUES
(1, '0000-00-00', '', 'First post', 'Hello this is the first post.', 'http://virtualamerican.org/images/news/Winter_Schedules_are_now_live!.jpg'),
(2, '0000-00-00', '', 'We are starting up now and this is a news', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,\n', 'http://virtualamerican.org/images/news/We''re_hiring_Management_Positions!.jpg'),
(3, '2015-04-26', 'sas0001', 'Tjena I am here', 'Welcome to thjis long news page this is long very many words here yes I like it,', 'http://192.168.1.54/v-sas/images/standard_news.jpg');

-- --------------------------------------------------------

--
-- Tabellstruktur `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL,
  `pilotID` varchar(7) NOT NULL,
  `join-date` date NOT NULL,
  `rank` int(1) NOT NULL DEFAULT '1',
  `hub` varchar(4) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `lastflight` date DEFAULT NULL,
  `flights` int(5) NOT NULL DEFAULT '0',
  `flighttime` double NOT NULL DEFAULT '0',
  `email` text NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `pilotID`, `join-date`, `rank`, `hub`, `firstname`, `lastname`, `password`, `salt`, `lastflight`, `flights`, `flighttime`, `email`, `country`) VALUES
(1, 'SAS0001', '2015-04-23', 6, '', 'Gustav', 'P Svensson', 'pluto971005', 'asdlfjk', NULL, 0, 0, 'gustavps97@gmail.com', 'Sweden'),
(2, 'sas0002', '2015-04-26', 1, 'engm', 'Johan', 'Bergfalk', 'password123', 'ioasdasdffdsg', NULL, 0, 0, 'johanbergfalk@gmail.com', 'Sweden'),
(5, 'sas0003', '2015-04-26', 1, 'esgg', 'André', 'Wahlberg', 'lösenord123', 'safdgoijhsfadouigh', NULL, 0, 0, 'andréwahlberg@gmail.com', 'Sweden'),
(6, 'SAS0004', '2015-04-26', 1, 'ESSA', 'Erik', 'Andersson', 'testlösen123', 'asfgdfsg', NULL, 0, 0, 'erik@andersson.se', 'England'),
(8, 'SAS0005', '2015-04-26', 1, 'ESSA', 'Linus', 'Andersson', 'testlösen123', 'asfgdfsg', NULL, 0, 0, 'erik@andersson.se', 'England'),
(9, 'SAS0006', '2015-04-26', 1, 'ESSA', 'swagmaister', 'Andersson', 'testlösen123', 'asfgdfsg', NULL, 0, 0, 'erik@andersson.se', 'England'),
(10, 'SAS0007', '2015-04-26', 1, 'ESSA', 'Linus', 'Andersson', 'testlösen123', 'asfgdfsg', NULL, 0, 0, 'erik@andersson.se', 'England');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `pilotID` (`pilotID`), ADD KEY `hub` (`hub`), ADD KEY `hub_2` (`hub`), ADD KEY `hub_3` (`hub`), ADD FULLTEXT KEY `pilotID_2` (`pilotID`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT för tabell `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
