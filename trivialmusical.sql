-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2023 a las 20:32:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trivialmusical`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `descripcionCategoria` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `descripcionCategoria`) VALUES
(1, 'LANZAMIENTOS'),
(2, 'GENERO'),
(3, 'MUSICA NACIONAL'),
(4, 'MUSICA INTERNACIONAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `idJugador` int(11) NOT NULL,
  `nombreJugador` varchar(50) NOT NULL,
  `apellidoJugador` varchar(50) NOT NULL,
  `cantidadRespuestasCorrectas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`idJugador`, `nombreJugador`, `apellidoJugador`, `cantidadRespuestasCorrectas`) VALUES
(1, 'Fabian', 'Avila Poletti', 0),
(2, 'Ale', 'Cano', 5),
(3, 'Manu', 'Leo', 4),
(4, 'Fabricio', 'Gomez', 0),
(5, 'juanito', 'alcachofa', 0),
(6, 'juanito', 'alcachofa', 0),
(7, 'juanito', 'alcachofa', 3),
(8, 'Fabricio', 'Gomez', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `idPregunta` int(11) NOT NULL,
  `descripcionPregunta` varchar(250) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idPregunta`, `descripcionPregunta`, `idCategoria`) VALUES
(1, '“Got a long list of ex-lovers / They\'ll tell you I\'m insane / But I\'ve got a blank space, baby /  And I\'ll write your name” ¿Cuál es el título de la canción de Taylor Swift que contiene esta parte del coro? ', 4),
(2, '¿En qué mes de este año Taylor Swift lanzó “Speak Now (Taylor´s Version)”?', 1),
(3, ' ¿A qué álbum de Rosalía pertenece la canción “Pienso en tu Mirá”? ', 4),
(4, '“A ella le gusta la gasolina / Dame más gasolina / Cómo le encanta la gasolina / Dame más gasolina” ¿Quién interpreta la canción que contiene este icónico coro?', 4),
(5, '“Nobody said it was easy / It\'s such a shame for us to part / Nobody said it was easy / No one ever said it would be this hard / Oh, take me back to the start” ¿Cuál es el nombre de esta representativa canción de Coldplay?', 4),
(6, '“My mama don\'t like you and she likes everyone” ¿Quién es el o los intérpretes de la canción que contiene esa frase en el pre-coro?', 4),
(7, '“Te conocí un día de enero / Con la luna en mi nariz / Y como vi que eras sincero / En tus ojos me perdí” ¿Que reconocida artista colombiana interpreta esta canción?', 4),
(8, '¿En qué año se lanzó el álbum Nevermind de Nirvana?', 4),
(9, '“Because maybe / You\'re gonna be the one that saves me / And after all / You\'re my wonderwall ¿Cómo se titula la canción de Oasis que contiene ese coro?', 4),
(10, '¿Quién es el famoso cantante puertorriqueño conocido como \"El Sol de México\"?', 4),
(11, 'Seguí la letra de la canción: \"Mientras siga viendo tu cara en la cara de la Luna / Mientras siga escuchando tu voz / Entre las olas, entre la espuma / Mientras tenga que cambiar la radio de estación...\"\n', 4),
(12, 'Seguí la letra de la canción: \"Yo te quiero con limón y sal...\"\n', 4),
(13, '¿Quién escribió la canción \"Muchacha (Ojos de Papel)\"?', 3),
(14, 'Demoliendo Hoteles de Charly García es una canción que se sitúa en un escenario político importante de la historia argentina ¿A qué momento hace referencia?', 3),
(15, 'Seminare es una canción icónica y representativa del rock argentino, perteneciente a la banda Serú Girán, ¿quién es el autor de la misma?', 3),
(16, '¿Cómo se titula la canción de Rodrigo que tiene la intro “Él pasa a verla a las seis, como acordaron ayer / Se desespera porque el miedo ronda otra vez”? ', 3),
(17, 'El rapero, cantante y compositor argentino, Duki, ha tenido 5 grandes lanzamientos entre álbumes de estudio y EPs, ¿cómo se llama su último álbum, lanzado en junio de este año?', 3),
(18, '¿Cuál de los siguientes nombres titula un álbum del cantante y compositor WOS?', 3),
(19, '¿Cuál de las siguientes cantantes argentinas es autora e intérprete de la canción “Disciplina”?', 3),
(20, '¿Qué dúo de cantantes argentinas interpreta la canción “Miénteme”, lanzada en el año 2021?', 3),
(21, '¿De qué color es la pollera de la que habla Gladys \"La Bomba Tucumana\" en su exitosa canción, representativa de la escena de la música tropical argentina?', 3),
(22, 'Seguí la letra de la canción Solo Aquí de Airbag: \"Y en la mañana espero\r\nUn corazón sincero...\"\r\n', 3),
(23, '\"No sé para qué volviste / Si yo empezaba a olvidar / No sé si ya lo sabrás / Lloré cuando vos te fuiste / No sé para qué volviste / Qué mal me hace recordar\" es un fragmento de una simbólica canción folklórica, ¿cómo se titula esta canción?', 3),
(24, '¿Quién es la legendaria cantante argentina conocida como \"La Negra\" y famosa por su voz inigualable?', 3),
(25, 'Seguí la letra de está recordada canción de Soda Stereo: \"No quiero soñar mil veces las mismas cosas\nNi contemplarlas sabiamente...\"\n', 3),
(26, '¿Qué cantante argentina de cumbia es apodada \"La Princesita?', 3),
(27, 'Popularmente, se conoce como \"el pogo más grande del mundo\" a uno ocurrido en una presentación del Indio Solari, ¿durante la interpretación de qué canción tuvo lugar este suceso?', 3),
(28, 'YSY A es un rapero, productor, freestyler y cantautor argentino que es reconocido por su influencia en el género… ', 2),
(29, 'Lali Espósito es una cantante y compositora argentina que ha experimentado por algunos géneros musicales, pero se destaca por hacer...', 2),
(30, '¿A qué género musical pertenece la canción “Tramposa y Mentirosa” de Leo Mattioli?', 2),
(31, 'AC/DC es una banda británica-australiana que ha experimentado por algunas corrientes del género…', 2),
(32, '“1989” es un álbum de Taylor Swift reconocido por su influencia en el género…', 2),
(33, 'Rodrigo es un cantante argentino reconocido por ser representante de…', 2),
(34, '“El mal querer” es un álbum de Rosalía lanzado en el 2018, se caracteriza por estar influenciado por dos géneros musicales, ¿cuáles son?', 2),
(35, 'Airbag es un grupo musical argentino que compone e interpreta canciones de…', 2),
(36, '¿Qué género musical ha ejercido gran influencia en la música de Bob Marley?', 2),
(37, '¿Cuál de los siguientes artistas es conocido por ser un ícono del género pop?', 2),
(38, '¿Qué género musical se desarrolló a fines de la década de 1970 y se caracteriza por su estilo de moda distintivo y su actitud rebelde?', 2),
(39, '¿Cuál de los siguientes géneros musicales se originó en Brasil y se caracteriza por sus ritmos tropicales y su influencia africana?', 2),
(40, '¿A qué género musical se asocia principalmente el legendario guitarrista Jimi Hendrix?', 2),
(41, 'Taylor Swift es una cantante reconocida por su influencia en el pop, sin embargo en su álbum debut predomina otro género musical, ¿cuál es? ', 2),
(42, '¿En qué género musical se destacó la legendaria cantante cubana Celia Cruz?', 2),
(43, '¿En qué año fue lanzada la canción “She Don’t Give a Fo’” interpretada por Duki y Khea?', 1),
(44, '¿Durante qué estación del año pasado fue lanzada la \"Quevedo: Bzrp Music Sessions, Vol. 52\"?', 1),
(45, '¿En qué año fue lanzado el hit mundial \"Despacito\" de Luis Fonsi y Daddy Yankee?', 1),
(46, '“New Rules” es una de las canciones más reconocidas de la artista Dua Lipa, ¿en qué año fue lanzado este sencillo?', 1),
(47, '“Dónde están los ladrones” es uno de los álbumes más reconocidos y recordados de la cantante colombiana Shakira, ¿en cuál de estas épocas fue lanzado?', 1),
(48, '¿Para qué Copa Mundial de la FIFA fue escrita la canción \"Waka Waka\" de Shakira?', 1),
(49, '¿En cuál de estas épocas fue lanzada la icónica canción \"Bohemian Rhapsody\" de Queen?', 1),
(50, 'La canción \"Livin\' on a Prayer\" es uno de los mayores éxitos de la banda Bon Jovi. ¿En qué década fue lanzada?', 1),
(51, '\"Thriller\" es uno de los álbumes más vendidos de todos los tiempos y es de Michael Jackson. ¿En qué año fue lanzado?', 1),
(52, '¿En qué década se lanzó el icónico álbum \"Dark Side of the Moon\" de Pink Floyd? ', 1),
(53, '¿En qué año sacó su último álbum la cantante argentina Lali?', 1),
(54, 'La canción \"De Música Ligera\" es uno de los éxitos más emblemáticos de la banda argentina Soda Stereo. ¿En qué década fue lanzada?', 1),
(55, '\"Un verano sin ti\" es el último álbum de estudio lanzado por el cantante Bad Bunny, ¿en qué año fue publicado?', 1),
(56, '¿En qué año fue publicado el álbum de estudio “Oktubre” de Patricio Rey y sus Redonditos de Ricota?', 1),
(57, 'La canción \"Shape of You\" es un éxito de un cantante británico. ¿Cuál es el nombre de este artista?', 4),
(58, '\"Billie Jean\" es una canción famosa de un ícono del pop. ¿Quién es el artista que la interpreta?', 4),
(59, '\"Sweet Child o\' Mine\" es una canción emblemática de una banda de rock. ¿Cuál es el nombre de la banda?', 4),
(60, '\"Livin\' la vida loca\" es un sencillo lanzado por un reconocido cantante  puertorriqueño-estadounidense, ¿de quién se trata?', 4),
(74, '¿Cuál es el título de la canción del artista WOS que fue utilizada durante el Mundial Qatar 2022?', 3),
(75, '¿Qué grupo de Rock Clásico era conocido por estar drogados durante sus primeros conciertos?', 4),
(76, '¿A qué famoso videojuego hace referencia el título de la última canción de la cantante Emilia Mernes?', 3),
(77, '¿Qué intérprete del género RKT fue arrestado y luego liberado?', 3),
(78, '¿Qué integrante de The Beatles fue asesinado por un fan en la ciudad de Nueva York en 1980?', 4),
(79, '¿Cuál de las siguientes razas caninas comparte su nombre artístico con el famoso cantante de reggaeton?', 4),
(80, '¿Quién era el vocalista principal de Linkin Park?', 4),
(81, '¿De qué artista fue el concierto donde ocurrió el atentado terrorista de Manchester en 2017?', 4),
(82, '¿Qué género musical se asocia principalmente con la música de Tan Biónica?', 2),
(83, '¿Quién es considerado el padre del tango argentino y escribió canciones como \"Mi Buenos Aires Querido\"?', 3),
(84, '¿Qué artista lanzó el álbum \"Thriller\" en 1982, que se convirtió en el álbum más vendido de todos los tiempos?', 1),
(85, '¿Qué icónica banda de rock lanzó el álbum \"Abbey Road\" en 1969?', 1),
(86, '¿Quién es conocido como el grupo femenino más grande en la industria del K-pop?', 4),
(87, '¿Qué cantante hace referencia al político argentino Horacio Rodriguez Larreta en su canción \"SIDE\"', 3),
(88, '¿Cuál es el nombre del álbum de Nirvana que incluye la canción \"Smells Like Teen Spirit\", lanzado en 1991?', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasrespondidas`
--

CREATE TABLE `preguntasrespondidas` (
  `idRespuestaJugador` int(11) NOT NULL,
  `idJugador` int(11) DEFAULT NULL,
  `idPregunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntasrespondidas`
--

INSERT INTO `preguntasrespondidas` (`idRespuestaJugador`, `idJugador`, `idPregunta`) VALUES
(89, 1, 1),
(91, 2, 10),
(92, 2, 14),
(94, 2, 26),
(93, 2, 38),
(95, 2, 49),
(90, 2, 59),
(96, 3, 4),
(100, 3, 27),
(99, 3, 33),
(98, 3, 48),
(97, 3, 77),
(101, 4, 39),
(102, 5, 75),
(103, 6, 47),
(104, 7, 12),
(106, 7, 20),
(105, 7, 41),
(107, 7, 59),
(108, 8, 6),
(112, 8, 28),
(111, 8, 31),
(109, 8, 41),
(110, 8, 52),
(113, 8, 74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `idRespuesta` int(11) NOT NULL,
  `descripcionRespuesta` varchar(250) NOT NULL,
  `correcta` tinyint(1) NOT NULL,
  `idPregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`idRespuesta`, `descripcionRespuesta`, `correcta`, `idPregunta`) VALUES
(1, 'I’ll write your name', 0, 1),
(2, 'Style ', 0, 1),
(3, 'Blank Space', 1, 1),
(4, 'New Romantics', 0, 1),
(5, 'Enero', 0, 2),
(6, 'Julio', 1, 2),
(7, 'Marzo', 0, 2),
(8, 'Deciembre', 0, 2),
(9, 'Motomami', 0, 3),
(10, 'TKN', 0, 3),
(11, 'El Mal Querer', 1, 3),
(12, 'Bagdad', 0, 3),
(13, 'Daddy Yankee', 1, 4),
(14, 'J Balvin', 0, 4),
(15, 'Don Omar', 0, 4),
(16, 'Wisin y Yandel', 0, 4),
(17, 'Fix You', 0, 5),
(18, 'Anti-Hero', 0, 5),
(19, 'Yellow', 0, 5),
(20, 'The Scientist', 1, 5),
(21, 'Shawn Mendes', 0, 6),
(22, 'Bad Bunny', 0, 6),
(23, 'Justin Bieber', 1, 6),
(24, 'Maroon 5', 0, 6),
(25, 'Karol G', 0, 7),
(26, 'Fanny Lu', 0, 7),
(27, 'Shakira', 1, 7),
(28, 'Greeicy', 0, 7),
(29, '2002', 0, 8),
(30, '1885', 0, 8),
(31, '1999', 0, 8),
(32, '1991', 1, 8),
(33, 'The One that Saves Me', 0, 9),
(34, 'Don\'t Look Back In Anger', 0, 9),
(35, 'Wonderwall', 1, 9),
(36, 'Live Forever', 0, 9),
(37, 'Juan Gabriel', 0, 10),
(38, 'Cosculluela', 0, 10),
(39, 'Luis Miguel', 1, 10),
(40, 'Rauw Alejandro', 0, 10),
(41, 'Porque cada canción me hable de ti', 1, 11),
(42, 'Para encontrar mi corazón', 0, 11),
(43, 'Para seguir en la inmersión', 0, 11),
(44, 'Para perderme en la visión', 0, 11),
(45, 'Yo te quiero en la playa y en el mar', 0, 12),
(46, 'En el cielo, sin final', 0, 12),
(47, 'Yo te quiero tal y como estás', 1, 12),
(48, 'En la brisa tropical', 0, 12),
(49, 'Gustavo Cerati', 0, 13),
(50, 'Luis Alberto Spinetta', 1, 13),
(51, 'David Lebón ', 0, 13),
(52, 'Fito Paez', 0, 13),
(53, 'El primer gobierno de Menem', 0, 14),
(54, 'El juicio a las Juntas Militares', 0, 14),
(55, 'La dictadura militar de 1976', 1, 14),
(56, 'El \"Corralito\"', 0, 14),
(57, 'Fabiana Cantilo', 0, 15),
(58, 'Pedro Aznar', 0, 15),
(59, 'Charly García', 1, 15),
(60, 'Oscar Moro', 0, 15),
(61, 'Ocho Cuarenta', 0, 16),
(62, 'Lo mejor del amor', 1, 16),
(63, 'Fuego y Pasión', 0, 16),
(64, 'Amor Clasificado', 0, 16),
(65, 'Antes de Ameri', 1, 17),
(66, 'Desde el Fin del Mundo', 0, 17),
(67, '24', 0, 17),
(68, 'Súper Sangre Joven', 0, 17),
(69, 'TRES PUNTOS SUSPENSIVOS', 0, 18),
(70, 'LUZ DELITO', 0, 18),
(71, 'PÚRPURA', 0, 18),
(72, 'OSCURO ÉXTASIS', 1, 18),
(73, 'Lali', 1, 19),
(74, 'Tini', 0, 19),
(75, 'Emilia Mernes', 0, 19),
(76, 'Cazzu', 0, 19),
(77, 'Tini y La Joaqui', 0, 20),
(78, 'Tini y Emilia Mernes', 0, 20),
(79, 'Tini y Nicki Nicole', 0, 20),
(80, 'Tini y Maria Becerra', 1, 20),
(81, 'Roja', 0, 21),
(82, 'Amarilla', 1, 21),
(83, 'Verde Oscuro', 0, 21),
(84, 'Magenta', 0, 21),
(85, 'Que solo grita libertad', 0, 22),
(86, 'Que solo espera la paz', 0, 22),
(87, 'Que solo busca libertad', 1, 22),
(88, 'Que solo quiere amar', 0, 22),
(89, 'Zamba de Mi Esperanza', 0, 23),
(90, 'Procuro Olvidarte', 0, 23),
(91, 'Zamba para Olvidar', 1, 23),
(92, 'Que Nadie Sepa Mi Sufrir', 0, 23),
(93, 'Soledad Pastorutti', 0, 24),
(94, 'Florencia Dávalos', 0, 24),
(95, 'Mercedes Sosa', 1, 24),
(96, 'Fabiana Cantilo', 0, 24),
(97, 'Deja que el tiempo pase lentamente', 0, 25),
(98, 'Quiero que me trates suavemente', 1, 25),
(99, 'Quiero vivir en un mundo diferente', 0, 25),
(100, 'Y encontrar la paz eternamente', 0, 25),
(101, 'Angela Leiva', 0, 26),
(102, 'Karina', 1, 26),
(103, 'Gladys', 0, 26),
(104, 'Gilda', 0, 26),
(105, 'A la Luz de la Luna', 0, 27),
(106, 'Había una Vez...', 0, 27),
(107, 'Ji Ji Ji', 1, 27),
(108, 'Motos psico', 0, 27),
(109, 'Pop', 0, 28),
(110, 'Trap', 1, 28),
(111, 'Rock', 0, 28),
(112, 'Salsa', 0, 28),
(113, 'R&B', 0, 29),
(114, 'Hip Hop', 0, 29),
(115, 'Pop', 1, 29),
(116, 'Reggaeton', 0, 29),
(117, 'Pop', 0, 30),
(118, 'Cuarteto', 0, 30),
(119, 'Reggaeton', 0, 30),
(120, 'Cumbia', 1, 30),
(121, 'R&B', 0, 31),
(122, 'Dance Pop', 0, 31),
(123, 'Tango', 0, 31),
(124, 'Rock', 1, 31),
(125, 'Pop', 1, 32),
(126, 'Rock', 0, 32),
(127, 'Techno', 0, 32),
(128, 'Country', 0, 32),
(129, 'La cumbia', 0, 33),
(130, 'El pop', 0, 33),
(131, 'El cuarteto', 1, 33),
(132, 'El reggaeton', 0, 33),
(133, 'Pop y Rock', 0, 34),
(134, 'Pop y Flamenco', 1, 34),
(135, 'Pop y Salsa', 0, 34),
(136, 'Country y Flamenco', 0, 34),
(137, 'Punk', 0, 35),
(138, 'Blues', 0, 35),
(139, 'Rock', 1, 35),
(140, 'Tango', 0, 35),
(141, 'Jazz', 0, 36),
(142, 'Rap', 0, 36),
(143, 'Reggae', 1, 36),
(144, 'Blues', 0, 36),
(145, 'Michael Jackson', 1, 37),
(146, 'Bob Dylan', 0, 37),
(147, 'Johnny Cash', 0, 37),
(148, 'Elvis Presley', 0, 37),
(149, 'Hip Hop', 0, 38),
(150, 'Punk', 1, 38),
(151, 'Disco', 0, 38),
(152, 'Country', 0, 38),
(153, 'Jazz', 0, 39),
(154, 'Flamenco', 0, 39),
(155, 'Samba', 1, 39),
(156, 'Tango', 0, 39),
(157, 'Salsa', 0, 40),
(158, 'Country', 0, 40),
(159, 'Blues', 1, 40),
(160, 'Rap', 0, 40),
(161, 'Salsa', 0, 41),
(162, 'Rock', 0, 41),
(163, 'Trap', 0, 41),
(164, 'Country', 1, 41),
(165, 'Reggae', 0, 42),
(166, 'Merengue', 0, 42),
(167, 'Jazz', 0, 42),
(168, 'Salsa', 1, 42),
(169, '2017', 1, 43),
(170, '2019', 0, 43),
(171, '2021', 0, 43),
(172, '2018', 0, 43),
(173, 'Verano', 0, 44),
(174, 'Invierno', 1, 44),
(175, 'Primavera', 0, 44),
(176, 'Otoño', 0, 44),
(177, '2015', 0, 45),
(178, '2016', 0, 45),
(179, '2017', 1, 45),
(180, '2019', 0, 45),
(181, '2015', 0, 46),
(182, '2017', 1, 46),
(183, '2018', 0, 46),
(184, '2019', 0, 46),
(185, 'Finales de los 70s', 0, 47),
(186, 'Finales de los 90s', 1, 47),
(187, 'A mediados de los 2000s', 0, 47),
(188, 'A mediados de los 80s', 0, 47),
(189, '2010', 1, 48),
(190, '2014', 0, 48),
(191, '2018', 0, 48),
(192, '2006', 0, 48),
(193, 'A mediados de la década de los 70s', 1, 49),
(194, 'Principio de los 90s', 0, 49),
(195, 'Finales de los 90s', 0, 49),
(196, 'Principios de los 2000s', 0, 49),
(197, '1970', 0, 50),
(198, '1980', 1, 50),
(199, '1990', 0, 50),
(200, '2000', 0, 50),
(201, '1970', 0, 51),
(202, '1982', 1, 51),
(203, '1997', 0, 51),
(204, '2001', 0, 51),
(205, '1960', 0, 52),
(206, '1970', 1, 52),
(207, '1980', 0, 52),
(208, '1990', 0, 52),
(209, '2020', 0, 53),
(210, '2021', 0, 53),
(211, '2022', 0, 53),
(212, '2023', 1, 53),
(213, '1980', 0, 54),
(214, '1990', 1, 54),
(215, '2000', 0, 54),
(216, '2010', 0, 54),
(217, '2022', 1, 55),
(218, '2021', 0, 55),
(219, '2020', 0, 55),
(220, '2018', 0, 55),
(221, '1973', 0, 56),
(222, '1986', 1, 56),
(223, '1999', 0, 56),
(224, '2005', 0, 56),
(225, 'Sam Smith', 0, 57),
(226, 'Ed Sheeran', 1, 57),
(227, 'Harry Styles', 0, 57),
(228, 'Frank Ocean ', 0, 57),
(229, 'Prince', 0, 58),
(230, 'Madonna', 0, 58),
(231, 'Britney Spears', 0, 58),
(232, 'Michael Jackson', 1, 58),
(233, 'Led Zeppelin', 0, 59),
(234, 'The Rolling Stones', 0, 59),
(235, 'Guns N\' Roses', 1, 59),
(236, 'Queen', 0, 59),
(237, 'Ricky Martin', 1, 60),
(238, 'Marc Anthony', 0, 60),
(239, 'Carlos Vives', 0, 60),
(240, 'Ozuna', 0, 60),
(241, 'CANGURO', 0, 74),
(242, 'LUZ DELITO', 0, 74),
(243, 'ARRANCARMELO', 1, 74),
(244, 'PÚRPURA', 0, 74),
(245, 'The Beatles', 0, 75),
(246, 'Rolling Stones', 1, 75),
(247, 'Guns N\' Roses', 0, 75),
(248, 'Pearl Jam', 0, 75),
(249, 'Counter Strike 1.6', 0, 76),
(250, 'Call of Duty', 0, 76),
(251, 'Los Sims', 0, 76),
(252, 'GTA', 1, 76),
(253, 'Callejero Fino', 0, 77),
(254, 'Lauty Gram', 0, 77),
(255, 'L-Gante', 1, 77),
(256, 'El Noba ', 0, 77),
(257, 'Paul McCartney', 0, 78),
(258, 'George Harrison', 0, 78),
(259, 'Ringo Starr', 0, 78),
(260, 'John Lennon', 1, 78),
(261, 'Caniche', 0, 79),
(262, 'Rottweiler', 0, 79),
(263, 'Bull Terrier', 0, 79),
(264, 'Pitbull', 1, 79),
(265, 'Chester Bennington', 1, 80),
(266, 'Mike Shinoda', 0, 80),
(267, 'Brad Delson', 0, 80),
(268, 'Joe Hahn', 0, 80),
(269, 'Dua Lipa', 0, 81),
(270, 'Ariana Grande', 1, 81),
(271, 'Taylor Swift', 0, 81),
(272, 'Doja Cat', 0, 81),
(273, 'Trap', 0, 82),
(274, 'Metal', 0, 82),
(275, 'Punk', 0, 82),
(276, 'Pop-Rock', 1, 82),
(277, 'Carlos Gardel', 1, 83),
(278, 'Astor Piazzolla', 0, 83),
(279, 'Aníbal Troilo', 0, 83),
(280, 'Domingo Federico', 0, 83),
(281, 'Elvis Presley', 0, 84),
(282, 'Madonna', 0, 84),
(283, 'Michael Jackson', 1, 84),
(284, 'Queen', 0, 84),
(285, 'The Beatles', 1, 85),
(286, 'Queen', 0, 85),
(287, 'Radiohead', 0, 85),
(288, 'Fleetwood Mac', 0, 85),
(289, 'BLACKPINK', 1, 86),
(290, 'TWICE', 0, 86),
(291, 'Girls\' Generation (SNSD)', 0, 86),
(292, 'Red Velvet', 0, 86),
(293, 'WOS', 0, 87),
(294, 'Trueno', 0, 87),
(295, 'Dillom', 1, 87),
(296, 'Muerejoven', 0, 87),
(297, 'In Utero', 0, 88),
(298, 'Bleach', 0, 88),
(299, 'MTV Unplugged in New York', 0, 88),
(300, 'Nevermind', 1, 88);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`idJugador`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`idPregunta`),
  ADD KEY `idCategoria` (`idCategoria`) USING BTREE;

--
-- Indices de la tabla `preguntasrespondidas`
--
ALTER TABLE `preguntasrespondidas`
  ADD PRIMARY KEY (`idRespuestaJugador`),
  ADD UNIQUE KEY `uniqueRespuestaJugador` (`idJugador`,`idPregunta`),
  ADD KEY `idPregunta` (`idPregunta`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`idRespuesta`),
  ADD KEY `idPregunta` (`idPregunta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `idJugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `preguntasrespondidas`
--
ALTER TABLE `preguntasrespondidas`
  MODIFY `idRespuestaJugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `idRespuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntasrespondidas`
--
ALTER TABLE `preguntasrespondidas`
  ADD CONSTRAINT `preguntasrespondidas_ibfk_1` FOREIGN KEY (`idJugador`) REFERENCES `jugadores` (`idJugador`),
  ADD CONSTRAINT `preguntasrespondidas_ibfk_2` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`);

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
