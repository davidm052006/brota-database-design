-- ============================================
-- SCRIPT DE INSERCIÓN DATOS REALES - BROTA MVP
-- ============================================

INSERT INTO perfiles_usuario (
    primer_nombre, 
    segundo_nombre, 
    primer_apellido, 
    segundo_apellido, 
    edad, 
    genero, 
    nivel_educativo
) VALUES 
(
    'Santiago', 
    'Andrés', 
    'Castillo', 
    'Mendoza', 
    16, 
    'Masculino', 
    'Grado 10'
),
(
    'Valentina', 
    NULL, 
    'Osorio', 
    'Navarro', 
    17, 
    'Femenino', 
    'Grado 11'
),
(
    'Mateo', 
    'Alejandro', 
    'Giraldo', 
    'Ríos', 
    15, 
    'Masculino', 
    'Grado 10'
),
(
    'Isabella', 
    'Sofía', 
    'Pineda', 
    'Salazar', 
    17, 
    'Femenino', 
    'Grado 11'
),
(
    'Nicolás', 
    NULL, 
    'Bermúdez', 
    'Castro', 
    18, 
    'Masculino', 
    'Grado 11'
),
(
    'Mariana', 
    'Lucía', 
    'Cárdenas', 
    'Vargas', 
    16, 
    'Femenino', 
    'Grado 10'
),
(
    'Sebastián', 
    'Camilo', 
    'Ruiz', 
    NULL, 
    17, 
    'Masculino', 
    'Grado 11'
);


INSERT INTO instituciones_educativas (
    nombre, 
    tipo, 
    ciudad, 
    direccion, 
    telefono, 
    email,
    sitio_web,
    costo_promedio,
    activa
) VALUES 
(
    'Colegio San Patricio', 
    'Privado', 
    'Bogotá', 
    'Calle 123 # 45-67', 
    '6011234567', 
    'contacto@sanpatricio.edu.co',
    'https://www.sanpatricio.edu.co',
    1500000,
    true
),
(
    'Institución Educativa Distrital Simón Bolívar', 
    'Público', 
    'Bogotá', 
    'Carrera 10 # 20-30 Sur', 
    '6015559988', 
    'rectoria@simonbolivardistrital.edu.co',
    'https://www.simonbolivardistrital.edu.co',
    0,
    true
),
(
    'Liceo Campestre', 
    'Privado', 
    'Chía', 
    'Vía Guaymaral Km 2', 
    '3105551234', 
    'admisiones@liceocampestre.edu.co',
    'https://www.liceocampestre.edu.co',
    2200000,
    true
),
(
    'Institución Educativa Nacional', 
    'Público', 
    'Medellín', 
    'Carrera 50 # 40-20', 
    '6049876543', 
    'info@ienacional.edu.co',
    NULL,
    50000,
    false
),
(
    'Gimnasio Los Andes', 
    'Privado', 
    'Cali', 
    'Avenida 6N # 45-12', 
    '6023334455', 
    'secretaria@gimnasiolosandes.edu.co',
    'https://www.gimnasiolosandes.edu.co',
    1850000,
    true
),
(
    'Instituto Técnico Industrial', 
    'Público', 
    'Bucaramanga', 
    'Calle 36 # 22-10', 
    '6076667788', 
    'contacto@iti-bucaramanga.edu.co',
    'https://www.iti-bucaramanga.edu.co',
    20000,
    true
);


INSERT INTO programas (
    nombre, 
    descripcion, 
    icono, 
    activa
) VALUES 
(
    'Matemáticas', 
    'Estudio de los números, cantidades, formas y espacios. Incluye álgebra, geometría y cálculo.', 
    'fas fa-calculator', 
    true
),
(
    'Ciencias Naturales', 
    'Comprensión del mundo físico y biológico. Abarca física, química y biología.', 
    'fas fa-flask', 
    true
),
(
    'Humanidades y Lengua Castellana', 
    'Desarrollo de competencias comunicativas, lectura crítica y literatura.', 
    'fas fa-book-open', 
    true
),
(
    'Tecnología e Informática', 
    'Desarrollo de habilidades en programación, lógica computacional y herramientas digitales.', 
    'fas fa-laptop-code', 
    true
),
(
    'Idiomas Extranjeros', 
    'Aprendizaje de una segunda lengua, con énfasis principal en gramática y conversación en inglés.', 
    'fas fa-language', 
    true
),
(
    'Ciencias Sociales', 
    'Estudio de la historia, geografía, constitución política y democracia.', 
    'fas fa-globe-americas', 
    true
),
(
    'Mecanografía', 
    'Técnicas de escritura rápida en máquinas de escribir tradicionales.', 
    'fas fa-keyboard', 
    false
);


INSERT INTO areas_de_estudio (
    nombre, 
    tipo, 
    duracion, 
    modalidad, 
    descripcion, 
    requisitos, 
    costo_matricula, 
    perfil_compatible, 
    activo
) VALUES 
(
    'Ingeniería de Sistemas y Computación', 
    'Pregrado', 
    '10 semestres', 
    'Presencial', 
    'Programa enfocado en el diseño, desarrollo y gestión de sistemas de información y software.', 
    'Título de bachiller y pruebas de estado (ICFES).', 
    6500000, 
    '{"intereses": ["tecnología", "programación"], "habilidades": ["lógica", "matemáticas"], "nivel_educativo_minimo": "Bachiller"}'::jsonb, 
    true
),
(
    'Tecnología en Desarrollo de Software', 
    'Tecnológico', 
    '6 semestres', 
    'Virtual', 
    'Formación práctica en lenguajes de programación modernos, bases de datos y desarrollo web.', 
    'Título de bachiller.', 
    1800000, 
    '{"intereses": ["desarrollo web", "apps"], "habilidades": ["resolución de problemas", "trabajo en equipo"], "disponibilidad_recomendada": "Medio tiempo"}'::jsonb, 
    true
),
(
    'Diplomado en Marketing Digital Estratégico', 
    'Diplomado', 
    '120 horas', 
    'Híbrida', 
    'Aprende a crear y ejecutar estrategias en redes sociales, SEO, SEM y analítica web.', 
    'Conocimientos básicos en manejo de internet y redes sociales.', 
    1200000, 
    '{"intereses": ["redes sociales", "ventas", "comunicación"], "perfil_ocupacional": ["emprendedores", "estudiantes", "profesionales"]}'::jsonb, 
    true
),
(
    'Especialización en Gerencia de Proyectos', 
    'Posgrado', 
    '2 semestres', 
    'Presencial', 
    'Formación avanzada en metodologías ágiles y tradicionales para la dirección exitosa de proyectos.', 
    'Título profesional universitario.', 
    8500000, 
    '{"intereses": ["liderazgo", "administración"], "experiencia_laboral": "1 año", "nivel_educativo_minimo": "Profesional"}'::jsonb, 
    true
),
(
    'Curso Intensivo de Inglés - Nivel B1', 
    'Curso corto', 
    '3 meses', 
    'Virtual', 
    'Mejora tus habilidades conversacionales y gramaticales para alcanzar un nivel intermedio (B1).', 
    'Examen de clasificación nivel A2 o haber aprobado el curso anterior.', 
    450000, 
    '{"intereses": ["idiomas", "viajes", "estudio en el exterior"], "objetivo": "mejorar fluidez conversacional"}'::jsonb, 
    true
),
(
    'Taller Práctico de Finanzas Personales', 
    'Taller', 
    '16 horas', 
    'Presencial', 
    'Aprende a manejar tu dinero, crear presupuestos efectivos y empezar a invertir de forma segura.', 
    'Ninguno.', 
    80000, 
    '{"intereses": ["ahorro", "inversión", "crecimiento personal"], "edad_minima": 15}'::jsonb, 
    false
);

INSERT INTO convocatorias (
    nombre, 
    fecha_apertura, 
    fecha_cierre, 
    cupos, 
    informacion_adicional, 
    activa
) VALUES 
(
    'Jóvenes a la U - Semestre 2026-2', 
    '2026-05-01', 
    '2026-06-15', 
    4000, 
    'Programa integral de acceso a la educación superior. Cubre el 100% de la matrícula en instituciones aliadas.', 
    true
),
(
    'Convocatoria SENA - Modalidad Virtual', 
    '2026-04-01', 
    '2026-04-15', 
    15000, 
    'Formación técnica y tecnológica 100% virtual. Requiere haber presentado las pruebas de estado.', 
    true
),
(
    'Fondo de Educación Superior (FEST)', 
    '2026-06-01', 
    '2026-07-20', 
    1200, 
    'Créditos condonables para estudiantes de estratos 1, 2 y 3 egresados de colegios públicos.', 
    true
),
(
    'Becas de Excelencia - ICETEX', 
    '2025-10-01', 
    '2025-11-30', 
    500, 
    'Dirigido a bachilleres con los mejores puntajes ICFES a nivel nacional. Cubre sostenimiento.', 
    false
),
(
    'Semillero de Programación y Tecnología', 
    '2026-02-15', 
    '2026-03-10', 
    150, 
    'Curso intensivo extracurricular gratuito dirigido exclusivamente a estudiantes de grados 10 y 11.', 
    false
),
(
    'Admisiones Especiales - Programas Técnicos', 
    '2026-04-20', 
    '2026-05-30', 
    800, 
    'Aplica para egresados de colegios articulados con programas técnicos. Entrevistas presenciales requeridas.', 
    true
);



INSERT INTO cuestionario (
    nombre, 
    version, 
    descripcion, 
    activo
) VALUES 
(
    'Test de Orientación Vocacional Holland', 
    'v2.1', 
    'Cuestionario clásico basado en los 6 tipos de personalidad ocupacional de Holland (Realista, Investigador, Artístico, Social, Emprendedor, Convencional) para descubrir afinidades profesionales.', 
    true
),
(
    'Inventario de Habilidades y Aptitudes', 
    'v1.5', 
    'Evaluación detallada de las destrezas lógicas, verbales, espaciales y numéricas del estudiante para recomendar programas donde tenga mayor facilidad de aprendizaje.', 
    true
),
(
    'Test Rápido: Descubre tu Vocación', 
    '2026.1', 
    'Versión corta de 15 preguntas diseñada para estudiantes de grados 10 y 11 que buscan una orientación general rápida sobre sus áreas de conocimiento más afines.', 
    true
),
(
    'Cuestionario de Intereses STEM', 
    'v1.0', 
    'Prueba especializada para medir el nivel de interés y la aptitud específica en carreras de Ciencia, Tecnología, Ingeniería y Matemáticas.', 
    false
),
(
    'Evaluación de Personalidad Ocupacional', 
    'v3.0', 
    'Analiza las preferencias de ambiente de trabajo, manejo del estrés, perfil de liderazgo y disposición al trabajo en equipo para filtrar y afinar las opciones de estudio.', 
    true
);



INSERT INTO pregunta (
    texto, 
    tipo, 
    orden, 
    categoria, 
    peso, 
    opciones
) VALUES 
(
    '¿Disfrutas armar, desarmar o reparar cosas (ej. computadoras, motores, electrodomésticos)?', 
    'Escala Likert', 
    1, 
    'Realista', 
    1.00, 
    '[{"valor": 1, "etiqueta": "Nada"}, {"valor": 2, "etiqueta": "Poco"}, {"valor": 3, "etiqueta": "Neutral"}, {"valor": 4, "etiqueta": "Mucho"}, {"valor": 5, "etiqueta": "Totalmente"}]'::jsonb
),
(
    'Si tuvieras que participar en la organización de un evento escolar, ¿qué rol asumirías?', 
    'Selección Única', 
    2, 
    'Preferencias de Trabajo', 
    1.50, 
    '[{"perfil": "Artístico", "etiqueta": "Diseñar la publicidad y decoración"}, {"perfil": "Convencional", "etiqueta": "Manejar el presupuesto y las finanzas"}, {"perfil": "Emprendedor", "etiqueta": "Dirigir el equipo y tomar decisiones"}, {"perfil": "Social", "etiqueta": "Atender a los invitados y ayudarlos"}]'::jsonb
),
(
    'Te resulta fácil comprender conceptos de física o aplicar fórmulas matemáticas para resolver problemas.', 
    'Escala Likert', 
    3, 
    'Investigador', 
    2.00, 
    '[{"valor": 1, "etiqueta": "Totalmente en desacuerdo"}, {"valor": 2, "etiqueta": "En desacuerdo"}, {"valor": 3, "etiqueta": "Ni de acuerdo ni en desacuerdo"}, {"valor": 4, "etiqueta": "De acuerdo"}, {"valor": 5, "etiqueta": "Totalmente de acuerdo"}]'::jsonb
),
(
    'Prefieres trabajar en proyectos donde hay reglas claras y procedimientos establecidos en lugar de escenarios ambiguos o muy libres.', 
    'Verdadero/Falso', 
    4, 
    'Ambiente de Trabajo', 
    0.50, 
    '[{"valor": 1, "perfil": "Convencional", "etiqueta": "Verdadero"}, {"valor": 0, "perfil": "Investigador/Artístico", "etiqueta": "Falso"}]'::jsonb
),
(
    '¿En cuál de estos temas te gustaría profundizar leyendo libros o viendo documentales en tu tiempo libre?', 
    'Selección Múltiple', 
    5, 
    'Intereses', 
    1.00, 
    '[{"area": "Tecnología", "etiqueta": "Avances en inteligencia artificial"}, {"area": "Ciencias Sociales", "etiqueta": "Historia de las civilizaciones antiguas"}, {"area": "Ciencias de la Salud", "etiqueta": "Cómo funciona el cerebro humano"}, {"area": "Negocios", "etiqueta": "Casos de éxito empresarial"}]'::jsonb
);
