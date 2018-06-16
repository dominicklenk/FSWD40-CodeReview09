-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 16. Jun 2018 um 14:43
-- Server-Version: 5.6.38
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `cr09_dominic_klenk_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_charges`
--

CREATE TABLE `additional_charges` (
  `additional_charges_id` int(11) NOT NULL,
  `fk_contact_id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_driver`
--

CREATE TABLE `additional_driver` (
  `additional_driver_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `license_nr` varchar(60) NOT NULL,
  `price_extradriver` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_service`
--

CREATE TABLE `additional_service` (
  `additional_service_id` int(11) NOT NULL,
  `additional_service_name` varchar(60) NOT NULL,
  `additional_service_price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `fk_rentamount_id` int(11) NOT NULL,
  `car_type` varchar(50) NOT NULL,
  `build_year` int(11) DEFAULT NULL,
  `passengeramount` int(11) DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  `company_address` text,
  `company_UID` varchar(20) DEFAULT NULL,
  `fk_contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contact_person`
--

CREATE TABLE `contact_person` (
  `contact_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `e_mail` varchar(60) DEFAULT NULL,
  `tel_nr` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `driver_telephone` varchar(50) NOT NULL,
  `driver_email` varchar(60) DEFAULT NULL,
  `license_nr` varchar(60) NOT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `end_location`
--

CREATE TABLE `end_location` (
  `end_loc_id` int(11) NOT NULL,
  `end_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL,
  `insurance_kind` varchar(60) NOT NULL,
  `insurance_priceperday` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_company_id` int(11) NOT NULL,
  `fk_driver_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) NOT NULL,
  `fk_additional_charges_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_sum` decimal(6,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rentamount`
--

CREATE TABLE `rentamount` (
  `rentamount_id` int(11) NOT NULL,
  `price_perday` decimal(6,2) NOT NULL,
  `price_perweek` decimal(6,2) DEFAULT NULL,
  `price_permonth` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fk_car_id` int(11) NOT NULL,
  `fk_driver_id` int(11) NOT NULL,
  `fk_start_loc_id` int(11) NOT NULL,
  `fk_end_loc_id` int(11) NOT NULL,
  `fk_insurance_id` int(11) NOT NULL,
  `fk_additional_service_id` int(11) DEFAULT NULL,
  `fk_additional_driver_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_location`
--

CREATE TABLE `start_location` (
  `start_loc_id` int(11) NOT NULL,
  `start_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`additional_charges_id`);

--
-- Indizes für die Tabelle `additional_driver`
--
ALTER TABLE `additional_driver`
  ADD PRIMARY KEY (`additional_driver_id`);

--
-- Indizes für die Tabelle `additional_service`
--
ALTER TABLE `additional_service`
  ADD PRIMARY KEY (`additional_service_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indizes für die Tabelle `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `end_location`
--
ALTER TABLE `end_location`
  ADD PRIMARY KEY (`end_loc_id`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indizes für die Tabelle `rentamount`
--
ALTER TABLE `rentamount`
  ADD PRIMARY KEY (`rentamount_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indizes für die Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_loc_id`);
