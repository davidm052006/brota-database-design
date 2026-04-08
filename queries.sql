-- ========================================================
-- 🔍 DQL/DML: Actualizaciones, Borrados y 10 Selects Estrella
-- ========================================================

-- --------------------------------------------------------
-- 🔄 1. EJEMPLOS DE ACTUALIZACIÓN (UPDATE)
-- --------------------------------------------------------
-- Operación lógica diaria: Deshabilitar temporalmente a una plataforma en vivo 
-- sin afectar métricas pasadas ni las llaves referenciales.
UPDATE CONVOCATORIAS 
SET activa = FALSE, informacion_adicional = 'Cancelada por coyuntura interna de la Institución'
WHERE id = '44000000-0000-0000-0000-000000004000';


-- --------------------------------------------------------
-- 🗑️ 2. EJEMPLOS DE ELIMINACIÓN (DELETE)
-- --------------------------------------------------------
-- Ejercicio quirúrgico: Los deletes evitan que se sobrecargue el disco duro, pero
-- se deben ejecutar en escenarios de falla documentada o por el Privacy Act de los usuarios.

-- Ejemplo 1: El usuario "Andrés M Castro" mandó petición de purgado GDPR
DELETE FROM PERFILES_USUARIO 
WHERE nombre = 'Andrés' AND apellido = 'Castro';

-- Ejemplo 2: Auto-limpieza tras pruebas, borrando cuestionarios vacíos.
DELETE FROM RESULTADOS 
WHERE respuestas IS NULL;


-- ========================================================
-- 🔎 3. CONSULTAS AVANZADAS DEL SISTEMA (SELECT)
-- Operadores requeridos listados: IN, LIKE, BETWEEN, IS NULL
-- ========================================================

-- 📍 Consulta 1 [Uso de IN]: Consulta Estricta Geográficamente
SELECT nombre, tipo, ciudad 
FROM INSTITUCIONES 
WHERE ciudad IN ('Bogotá', 'Medellín', 'Cali');

-- 📍 Consulta 2 [Uso de LIKE]: Motor Búsqueda Interna Parcial (FrontEnd)
SELECT nombre, modalidad 
FROM PROGRAMAS 
WHERE nombre LIKE '%Ingeniería%';

-- 📍 Consulta 3 [Uso de BETWEEN]: Rango Económico Tolerable 
SELECT nombre, costo_matricula 
FROM PROGRAMAS 
WHERE costo_matricula BETWEEN 1500000 AND 4000000;

-- 📍 Consulta 4 [Uso de IS NULL]: Auditoría a Data Vacía Omitidas por Usuarios
SELECT nombre, telefono, sitio_web 
FROM INSTITUCIONES 
WHERE telefono IS NULL;

-- 📍 Consulta 5 [Uso de IN y BETWEEN]: Targeting Demográfico
SELECT nombre, edad, ciudad 
FROM PERFILES_USUARIO 
WHERE edad BETWEEN 15 AND 17 
  AND ciudad IN ('Bucaramanga', 'Cartagena');

-- 📍 Consulta 6 [Uso de LIKE e IS NOT NULL]: Validando Ramificaciones en Cuestionarios
SELECT nombre, version 
FROM CUESTIONARIOS 
WHERE version LIKE '1.%' AND descripcion IS NOT NULL;

-- 📍 Consulta 7 [Uso de IN e IS NULL]: Mapeo de Legalidad y Prerrequisitos Faltantes
SELECT nombre, tipo, area_academica
FROM PROGRAMAS 
WHERE requisitos IS NULL 
  AND area_academica IN ('Salud', 'Ciencias Exactas');

-- 📍 Consulta 8 [Uso de BETWEEN y JOIN]: Match Generacional Altísimo (90%+)
SELECT p.nombre, p.apellido, r.compatibilidad, r.razones 
FROM RECOMENDACIONES r
INNER JOIN RESULTADOS rs ON r.resultado_id = rs.id
INNER JOIN PERFILES_USUARIO p ON rs.perfil_usuario_id = p.id
WHERE r.compatibilidad BETWEEN 90.00 AND 100.00;

-- 📍 Consulta 9 [Uso de LIKE e IS NULL]: Comprobando Identidad Real por Email (.edu.co)
SELECT nombre, email 
FROM INSTITUCIONES 
WHERE email LIKE '%@%.edu.co' 
  AND sitio_web IS NULL;

-- 📍 Consulta 10 [Uso de BETWEEN]: Visibilidad Calendario Fechas Limite
SELECT nombre, fecha_apertura, cupos
FROM CONVOCATORIAS
WHERE fecha_apertura BETWEEN '2026-01-01' AND '2026-06-30';
