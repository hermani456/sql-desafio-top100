-- Crear base de datos llamada películas.
CREATE DATABASE peliculas_db;

-- crear 2 tablas llamadas películas y reparto
CREATE TABLE peliculas (
   id INTEGER NOT NULL PRIMARY KEY,
   pelicula VARCHAR(255) NOT NULL,
   anio_estreno INTEGER NOT NULL,
   director VARCHAR(255) NOT NULL
);

CREATE TABLE reparto (
   id INTEGER NOT NULL,
   actor VARCHAR(255) NOT NULL,
   FOREIGN KEY (id) REFERENCES peliculas(id)
);

-- Cargar ambos archivos a su tabla correspondiente.
\copy peliculas FROM 'C:/Users/diego/Desktop/peliculas.csv' csv header;

\copy reparto FROM 'C:/Users/diego/Desktop/reparto.csv' csv;

-- Obtener el ID de la película “Titanic”.
SELECT
   id
FROM
   peliculas
WHERE
   pelicula = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic"
SELECT
   *
FROM
   reparto
WHERE
   id = '2';

-- Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT
   COUNT(actor)
FROM
   reparto
WHERE
   actor = 'Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.
SELECT
   *
FROM
   peliculas
WHERE
   anio_estreno BETWEEN '1990'
   AND '1999'
order by
   pelicula ASC;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”
SELECT
   pelicula,
   LENGTH(pelicula) AS longitud_titulo
FROM
   peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT
   MAX (LENGTH(pelicula)) AS longitud_titulo_max
FROM
   peliculas;


-- SELECT
--    pelicula,
--    MAX (LENGTH(pelicula)) AS longitud_titulo_max
-- FROM
--    peliculas
-- GROUP BY
--    pelicula
-- ORDER BY
--    longitud_titulo_max DESC;

