-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 04, 2026 alle 09:15
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dipartimentiricercatori`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `dipartimenti`
--

CREATE TABLE `dipartimenti` (
  `Codice` char(5) NOT NULL,
  `Descrizione` varchar(40) NOT NULL,
  `Sede` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `dipartimenti`
--

INSERT INTO `dipartimenti` (`Codice`, `Descrizione`, `Sede`) VALUES
('02', 'Biologia', 'Via Piave 9, 38123 Povo (TN)'),
('03', 'Ingegneria', 'Via Colombo 10, 38123 Povo (TN)'),
('04', 'Chimica e Tecniche Farmaceutiche', 'Via Piave 3, 38123 Povo (TN)'),
('05', 'Matematica', 'Via Piave 12, 38123 Povo (TN)'),
('06', 'Lettere', 'Via Giolitti 43, 38123 Povo (TN)'),
('07', 'Lingue Straniere', 'Via Giolitti 45, 38123 Povo (TN)');

-- --------------------------------------------------------

--
-- Struttura della tabella `ricercatori`
--

CREATE TABLE `ricercatori` (
  `ID` smallint(6) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Residenza` varchar(40) DEFAULT '*** Manca Residenza',
  `Stipendio` decimal(9,2) DEFAULT NULL,
  `Dipartimento` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ricercatori`
--

INSERT INTO `ricercatori` (`ID`, `Nome`, `Cognome`, `Residenza`, `Stipendio`, `Dipartimento`) VALUES
(1, 'Raffaele', 'D Amico', 'Via Roma 3, 00100 Roma (RM)', 3000.00, NULL),
(2, 'Giuseppe', 'Verdi', 'Via Verdi 3, 00100 Roma (RM)', 2500.00, '02'),
(3, 'Mario', 'Rossi', 'Via Rossi 3, 00100 Roma (RM)', 2000.00, '03'),
(4, 'Luigi', 'Bianchi', 'Via Bianchi 3, 00100 Roma (RM)', 1500.00, '04'),
(5, 'Giovanni', 'Neri', 'Via Neri 3, 00100 Roma (RM)', 1000.00, '05'),
(6, 'Paolo', 'Verdi', 'Via Verdi 3, 00100 Roma (RM)', 500.00, '06'),
(7, 'Giuseppe', 'Rossi', 'Via Rossi 3, 00100 Roma (RM)', 400.00, '07'),
(8, 'Lorenzo', 'De Niro', 'Via Roma, 003450  (XX)', 2400.00, '04'),
(9, 'Giuseppe', 'Rossi', 'Via Neri 7, 00140 Roma (RM)', 1200.00, NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `dipartimenti`
--
ALTER TABLE `dipartimenti`
  ADD PRIMARY KEY (`Codice`),
  ADD UNIQUE KEY `Descrizione` (`Descrizione`);

--
-- Indici per le tabelle `ricercatori`
--
ALTER TABLE `ricercatori`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Cognome` (`Cognome`,`Nome`,`Dipartimento`),
  ADD KEY `gaia` (`Dipartimento`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ricercatori`
--
ALTER TABLE `ricercatori`
  ADD CONSTRAINT `gaia` FOREIGN KEY (`Dipartimento`) REFERENCES `dipartimenti` (`Codice`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
