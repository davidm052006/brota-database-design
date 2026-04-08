-- ========================================================
-- 🧾 DML INSERTS: Datos Reales para Pruebas (Seeds)
-- ========================================================
-- En este script se alojan datos de prueba controlados para
-- evidenciar el flujo correcto relacional desde que entra el
-- estudiante, hasta que un programa le realiza un "match".

-- Para evitar incompatibilidades de UUID en este formato de prueba, y
-- que puedan testearse con más facilidad, usaremos strings conformes 
-- al protocolo UUID (8-4-4-4-12 hex). En un sistema maduro se usaría gen_random_uuid()

-- =============================================
-- INSERCIÓN EN PERFILES_USUARIO
-- =============================================
INSERT INTO PERFILES_USUARIO (id, user_id, nombre, apellido, edad, ciudad, nivel_educativo, condiciones_socioeconomicas) 
VALUES 
('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', 'Laura', 'Gámez', 16, 'Bogotá', 'Bachillerato', '{"estrato": 3}'),
('22222222-2222-2222-2222-222222222222', '00000000-0000-0000-0000-000000000002', 'Andrés', 'Castro', 18, 'Medellín', 'Técnico', '{"estrato": 2}'),
('77777777-7777-7777-7777-777777777777', '00000000-0000-0000-0000-000000000003', 'Valeria', 'Ruiz', 17, 'Bucaramanga', 'Secundaria Incompleta', '{"estrato": 4}');

-- =============================================
-- INSERCIÓN EN INSTITUCIONES
-- =============================================
INSERT INTO INSTITUCIONES (id, nombre, tipo, ciudad, departamento, activa, sitio_web, email, telefono)
VALUES 
('33333333-3333-3333-3333-333333333333', 'Universidad Nacional Mayor', 'Pública', 'Bogotá', 'Cundinamarca', TRUE, NULL, 'contacto@unal.edu.co', NULL),
('44444444-4444-4444-4444-444444444444', 'Escuela de Artes Integradas', 'Privada', 'Medellín', 'Antioquia', TRUE, 'https://escuelart.edu.co', 'admisiones@escuelart.edu.co', '3210001111');

-- =============================================
-- INSERCIÓN EN PROGRAMAS
-- =============================================
INSERT INTO PROGRAMAS (id, institucion_id, nombre, area_academica, costo_matricula, modalidad, requisitos, activo)
VALUES 
('55555555-5555-5555-5555-555555555555', '33333333-3333-3333-3333-333333333333', 'Ingeniería de Software Moderno', 'Tecnología', 2500000, 'Presencial', NULL, TRUE),
('66666666-6666-6666-6666-666666666666', '44444444-4444-4444-4444-444444444444', 'Diseño Gráfico Digital', 'Artes', 3500000, 'Semi-presencial', 'Portafolio inicial requerido', TRUE);

-- =============================================
-- INSERCIÓN EN CUESTIONARIOS
-- =============================================
INSERT INTO CUESTIONARIOS (id, nombre, version, descripcion, activo)
VALUES 
('88888888-8888-8888-8888-888888888888', 'Prueba Alfa Genérica', '1.0', 'Cuestionario base inicial y generalizado', TRUE),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Prueba Beta Tecnológica', '1.beta', 'Enfoque directo a tecnología', TRUE);

-- =============================================
-- INSERCIÓN EN PREGUNTAS
-- =============================================
INSERT INTO PREGUNTAS (id, cuestionario_id, texto, tipo, orden, categoria)
VALUES 
('99999999-9999-9999-9999-999999999999', '88888888-8888-8888-8888-888888888888', '¿Te gusta programar?', 'Opcion_Multiple', 1, 'Informatica');

-- =============================================
-- INSERCIÓN EN RESULTADOS
-- =============================================
-- Laura completa una prueba y genera un diagnóstico base
INSERT INTO RESULTADOS (id, perfil_usuario_id, cuestionario_id, respuestas, perfil_vocacional)
VALUES 
('11000000-0000-0000-0000-000000001000', '11111111-1111-1111-1111-111111111111', '88888888-8888-8888-8888-888888888888', '{"q1": "Totalmente de acuerdo"}', '{"tendencia_principal": "Tecnología"}'),
('22000000-0000-0000-0000-000000002000', '22222222-2222-2222-2222-222222222222', '88888888-8888-8888-8888-888888888888', NULL, NULL);

-- =============================================
-- INSERCIÓN EN RECOMENDACIONES
-- =============================================
-- Por las respuestas de Laura, la ID 5 (Ingeniería) se le recomienda de inmediato.
INSERT INTO RECOMENDACIONES (id, programa_id, resultado_id, compatibilidad, razones, vista)
VALUES 
('33000000-0000-0000-0000-000000003000', '55555555-5555-5555-5555-555555555555', '11000000-0000-0000-0000-000000001000', 98.50, 'Perfil fuertemente lógico-matemático detectado', FALSE);

-- =============================================
-- INSERCIÓN EN CONVOCATORIAS
-- =============================================
INSERT INTO CONVOCATORIAS (id, programa_id, nombre, fecha_apertura, fecha_cierre, cupos, activa)
VALUES 
('44000000-0000-0000-0000-000000004000', '55555555-5555-5555-5555-555555555555', 'Semestre 2026-I', '2026-01-15', '2026-02-15', 30, TRUE);
