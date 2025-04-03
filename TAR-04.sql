-- 1- Muestra las visitas con el nombre del jesuita que has realizado.
SELECT  visita.ip, jesuita.nombre
FROM 
    visita
INNER JOIN lugar 
ON visita.ip = lugar.ip
INNER JOIN jesuita 
ON visita.idJesuita = jesuita.idJesuita;

-- 2- Muestra todas las visitas con el nombre del jesuita que las ha realizado y el nombre (lugar) de lugar visitado.
SELECT  visita.ip, lugar.lugar, jesuita.nombre
FROM 
    visita
INNER JOIN lugar 
ON visita.ip = lugar.ip
INNER JOIN jesuita 
ON visita.idJesuita = jesuita.idJesuita;

-- 3- Añade un jesuita nuevo. Este jesuita no va a realizar ninguna visita.
INSERT INTO jesuita (codigo, nombre, nombreAlumno, firma, firmaIngles) 
VALUES ('JES001', 'San Ignacio de Loyola', 'Alumno1', 'Fundador de la Compañía de Jesús', 'Founder of the Society of Jesus');

-- 4- Añade 2 lugares nuevos. Estos lugares no se van a visitar.
INSERT INTO lugar (ip, nombre_maquina, lugar) 
VALUES ('192.168.1.1', 'MAQ001', 'Roma');

-- 5- Muestra todos los jesuitas con el nombre del lugar que han visitado. Si algún jesuita no ha realizado visita, también habrá que visualizar sus datos, mira qué ocurre con el valor del campo lugar en estos casos.
-- Versión con RIGHT y LEFT JOIN
SELECT 
    lugar.lugar,
    jesuita.nombre 
FROM 
    visita
RIGHT JOIN jesuita 
    ON visita.idJesuita = jesuita.idJesuita
LEFT JOIN lugar 
    ON visita.ip = lugar.ip;

-- 6- Muestra todos los lugares con el nombre del jesuita que realiza la visitada. Si algún lugar no se ha visitado, también habrá que visualizar sus datos.
SELECT 
    lugar.lugar,
    jesuita.nombre
FROM 
    lugar
LEFT JOIN visita 
    ON lugar.ip = visita.ip
LEFT JOIN jesuita 
    ON jesuita.idJesuita = visita.idJesuita;

-- 7- Mirando los resultados de la consulta anterior, intenta mostrar solo los lugares que NO se han visitado.
SELECT 
    lugar.lugar,
    jesuita.nombre
FROM 
    lugar
LEFT JOIN visita 
    ON lugar.ip = visita.ip
LEFT JOIN jesuita 
    ON jesuita.idJesuita = visita.idJesuita
WHERE visita.ip IS NULL;

-- 8- Muestra todos los jesuitas con el nombre del lugar que han visitado. Si algún jesuita no ha realizado visita, también habrá que visualizar sus datos y si algún lugar no se ha visitado también se muestra su nombre (lugar).
-- Realiza esta consulta en 2 pasos y ve comprobando qué ocurre al hacer el JOIN.
SELECT 
    lugar.lugar,
    jesuita.nombre 
FROM 
    visita
RIGHT JOIN jesuita 
    ON visita.idJesuita = jesuita.idJesuita
LEFT JOIN lugar 
    ON visita.ip = lugar.ip

UNION

SELECT 
    lugar.lugar,
    jesuita.nombre
FROM 
    lugar
LEFT JOIN visita 
    ON lugar.ip = visita.ip
LEFT JOIN jesuita 
    ON jesuita.idJesuita = visita.idJesuita;

-- 9- Muestra el nombre de los jesuitas que han realizado alguna visita (no hay que mostrar ningún dato más de la visita).
SELECT DISTINCT jesuita.nombre 
FROM jesuita
INNER JOIN visita
ON jesuita.idJesuita = visita.idJesuita;

-- 10- Piensa otra consulta diferente con DISTINCT (con la misma base de datos).
-- Muestra todas las parejas únicas de jesuita y lugar que han visitado.
SELECT DISTINCT jesuita.nombre, lugar.lugar
FROM jesuita 
INNER JOIN visita  
ON jesuita.idJesuita = visita.idJesuita
INNER JOIN lugar  
ON visita.ip = lugar.ip;
