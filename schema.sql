-- ========================================================
-- 🧱 SCHEMA DDL: Proyecto Brota - Diseño Completo
-- ========================================================

-- Recomendación: Usar la extensión uuid-ossp o pgcrypto si se despliega
-- automatizado en PostgreSQL/Supabase:
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ========================================================
-- 1. PERFILES_USUARIO
-- ========================================================
CREATE TABLE PERFILES_USUARIO (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL, -- FK asimilada hacia auth.users 
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    edad INTEGER,
    ciudad VARCHAR(100),
    nivel_educativo VARCHAR(100),
    condiciones_socioeconomicas JSONB,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- 2. CUESTIONARIOS
-- ========================================================
CREATE TABLE CUESTIONARIOS (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(150) NOT NULL,
    version VARCHAR(20),
    descripcion VARCHAR(500),
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- 3. PREGUNTAS
-- ========================================================
CREATE TABLE PREGUNTAS (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cuestionario_id UUID REFERENCES CUESTIONARIOS(id) ON DELETE CASCADE,
    texto VARCHAR(500) NOT NULL,
    tipo VARCHAR(50),
    orden INTEGER,
    categoria VARCHAR(100),
    peso DECIMAL(5,2),
    opciones JSONB,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- 4. RESULTADOS
-- ========================================================
CREATE TABLE RESULTADOS (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    perfil_usuario_id UUID REFERENCES PERFILES_USUARIO(id) ON DELETE CASCADE,
    cuestionario_id UUID REFERENCES CUESTIONARIOS(id) ON DELETE CASCADE,
    respuestas JSONB,
    perfil_vocacional JSONB,
    fecha_realizacion TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- 5. INSTITUCIONES
-- ========================================================
CREATE TABLE INSTITUCIONES (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(200) NOT NULL,
    tipo VARCHAR(50),
    ciudad VARCHAR(100),
    departamento VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(50),
    email VARCHAR(150),
    sitio_web VARCHAR(255),
    costo_promedio INTEGER,
    activa BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- 6. PROGRAMAS
-- ========================================================
CREATE TABLE PROGRAMAS (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    institucion_id UUID REFERENCES INSTITUCIONES(id) ON DELETE CASCADE,
    nombre VARCHAR(200) NOT NULL,
    tipo VARCHAR(50),
    area_academica VARCHAR(100),
    duracion VARCHAR(50),
    modalidad VARCHAR(50),
    descripcion VARCHAR(500),
    requisitos VARCHAR(500),
    costo_matricula INTEGER,
    perfil_compatible JSONB,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- 7. CONVOCATORIAS
-- ========================================================
CREATE TABLE CONVOCATORIAS (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    programa_id UUID REFERENCES PROGRAMAS(id) ON DELETE CASCADE,
    nombre VARCHAR(150),
    fecha_apertura DATE,
    fecha_cierre DATE,
    cupos INTEGER,
    informacion_adicional VARCHAR(500),
    activa BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- 8. RECOMENDACIONES
-- ========================================================
CREATE TABLE RECOMENDACIONES (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    programa_id UUID REFERENCES PROGRAMAS(id) ON DELETE CASCADE,
    resultado_id UUID REFERENCES RESULTADOS(id) ON DELETE CASCADE,
    compatibilidad DECIMAL(5,2),
    razones VARCHAR(500),
    vista BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
