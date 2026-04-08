# 🪴 Proyecto Brota - Diseño de Base de Datos

![GitHub last commit](https://img.shields.io/badge/Estado-Producci%C3%B3n-success?style=for-the-badge)

Bienvenidos al repositorio oficial de la presentación técnica del modelo de datos de **Brota** (anteriormente Synapse). Este repositorio documenta de manera transparente nuestra estructura y arquitectura de datos.

---

## 1. 📊 Introducción al proyecto

### 🌱 ¿Qué es Brota?
**Brota** es una plataforma tecnológica inteligente enfocada en la orientación vocacional. Evalúa de manera interactiva a los jóvenes para apoyarlos en su decisión sobre su futuro educativo, personal y profesional.

### 🎯 Objetivo del Sistema
Conectar el talento potencial de los jóvenes con los programas académicos e instituciones formadoras que mejor conectan con ellos, garantizando un índice mayor de éxito, graduación y satisfacción, fundamentando todas las decisiones en análisis de datos puros.

### 💡 Contexto (¿Cómo Funciona?)
El sistema se alimenta principalmente a través de **cuestionarios interactivos** (pruebas psicológicas y aptitudinales). Tras procesar las respuestas, se genera un sólido **perfil vocacional** del entorno y talentos del usuario.
Detrás de escena, nuestro motor relacional cruza estos perfiles con una base enorme de **programas e instituciones**. Así, las **recomendaciones** no son suposiciones, sino ciencia de datos.

---

## 2. 🧱 Estructura de la Base de Datos

Hemos extraído **8 tablas clave** que forman el eje fundamental de la lógica del negocio. *NOTA: La autenticación general se delega en una capa externa (Supabase Auth).*

### ✅ 1. PERFILES_USUARIO
* **Importancia:** Contiene la identidad extendida del estudiante en nuestro sistema, vital para la demografía y caracterización basal que consumen los algoritmos.
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `user_id` **(UUID)** - Llave Foránea **[FK]** hacia el módulo general para la Autenticación.
  * `nombre`, `apellido`, `ciudad`, `nivel_educativo` **(VARCHAR)**
  * `edad` **(INTEGER)**
  * `condiciones_socioeconomicas` **(JSONB)** - Estructura ágil para albergar métricas mixtas.

### ✅ 2. CUESTIONARIOS
* **Importancia:** Permite versionar masivamente los tests a futuro, dejando históricos intactos y facilitando la rotación de exámenes para evitar copias.
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `nombre`, `version`, `descripcion` **(VARCHAR)**
  * `activo` **(BOOLEAN)**

### ✅ 3. PREGUNTAS
* **Importancia:** Fragmenta la evaluación en unidades mínimas de valor para crear el banco madre de interrogantes, clasificadas en rangos/áreas mediante campos categóricos.
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `cuestionario_id` **(UUID)** - Llave Foránea **[FK]** a tabla `CUESTIONARIOS`.
  * `texto`, `tipo`, `categoria` **(VARCHAR)**
  * `orden` **(INTEGER)** y `peso` **(DECIMAL)**
  * `opciones` **(JSONB)** - Permite alojar *Arrays* de múltiples opciones por pregunta, haciendo el frontend ultradinámico.

### ✅ 4. RESULTADOS
* **Importancia:** Evidencia inmutable de qué, cómo y cuándo respondió el estudiante. Actúa como acta oficial de que el servicio se completó correctamente.
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `perfil_usuario_id` **(UUID)** - Llave Foránea **[FK]** a `PERFILES_USUARIO`.
  * `cuestionario_id` **(UUID)** - Llave Foránea **[FK]** a `CUESTIONARIOS`.
  * `respuestas` y `perfil_vocacional` **(JSONB)** - Captura todo el output del test.

### ✅ 5. INSTITUCIONES
* **Importancia:** Catalogo madre de Universidades e Institutos tecnológicos. Garantiza que Brota ofrezca entes avalados y fiables.
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `nombre`, `tipo`, `ciudad`, `departamento`, `sitio_web` **(VARCHAR)**
  * `costo_promedio` **(INTEGER)**

### ✅ 6. PROGRAMAS
* **Importancia:** Constituye la estantería del sistema; las verdaderas opciones (ej. "Ingeniería Civil") a las que aspira el estudiante.
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `institucion_id` **(UUID)** - Llave Foránea **[FK]** a `INSTITUCIONES`.
  * `nombre`, `modalidad`, `area_academica` **(VARCHAR)**
  * `costo_matricula` **(INTEGER)**
  * `perfil_compatible` **(JSONB)** - Contiene los tags internos que hará match con el resultado del usuario.

### ✅ 7. RECOMENDACIONES
* **Importancia:** El "Producto Estrella". Entidad en la que se unen el Usuario evaluado y el ecosistema Académico, puntuando su destino.
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `programa_id` **(UUID)** - Llave Foránea **[FK]** a `PROGRAMAS`.
  * `resultado_id` **(UUID)** - Llave Foránea **[FK]** a `RESULTADOS`.
  * `compatibilidad` **(DECIMAL)** - Precisión altísima métrica sobre la efectividad del match.
  * `vista` **(BOOLEAN)**

### ✅ 8. CONVOCATORIAS
* **Importancia:** Esta tabla evita duplicidad de datos porque un Programa es eterno (estático), pero "Cuándo Matricularse" cambia cada semestre (dinámico).
* **Datos y Tipos:**
  * `id` **(UUID)** - Llave Primaria **[PK]**.
  * `programa_id` **(UUID)** - Llave Foránea **[FK]** a `PROGRAMAS`.
  * `fecha_apertura`, `fecha_cierre` **(DATE)**
  * `cupos` **(INTEGER)**

---

## 3. 🧾 Inserción de Datos (INSERT)

Los comandos `INSERT` son vitales para simular **escenarios tempranos (Seeds)** y verificar las correctas asignaciones de claves. Al inyectar datos de Instituciones, Usuarios y Match, el equipo puede ejecutar pruebas QA para simular la realidad antes de liberar a producción.

> 📂 *"Ver la recolección completa en `inserts.sql`"*

**Ejemplo de código:**
```sql
-- Inserción de una institución, creando una ID simulada
INSERT INTO INSTITUCIONES (id, nombre, tipo, ciudad, activa)
VALUES 
('10000000-0000-0000-0000-100000000000', 'Universidad Nacional', 'Pública', 'Bogotá', TRUE);
```
**Importancia Práctica:** Este insert nos valida que se insertó bien la ciudad, y si nosotros no intentamos registrar datos irreales, las restricciones (Constrains) de nuestra BD funcionarán perfecto.

---

## 4. 🔄 Actualización y Eliminación (UPDATE y DELETE)

### 📝 Actualización (UPDATE)
Utilizada abrumadoramente en lugar del borrado masivo.
* **¿En qué casos se usa?:** Cuando un programa académico se queda sin cupos, suspenderemos la disponibilidad en plataforma cambiando el estado booleano de la Convocatoria en lugar de borrar la fila entera, conservando toda su historia.
* **Ejemplo (Ver `queries.sql`):** 
```sql
UPDATE CONVOCATORIAS 
SET activa = FALSE 
WHERE id = '20000000-0000-0000-0000-200000000000';
```

### 🗑️ Eliminación (DELETE)
Utilizado estratégicamente por cumplimiento de políticas éticas.
* **¿En qué casos se usa?:** Se utiliza en operaciones quirúrgicas, como cuando un usuario exige en su "derecho al olvido" ser removido.
* **Importancia Operativa:** Borrar el nodo de `PERFILES_USUARIO` permite al sistema erradicar una ramificación en cascada.
* **Ejemplo (Ver `queries.sql`):**
```sql
DELETE FROM PERFILES_USUARIO 
WHERE nombre = 'Laura' AND apellido = 'Gómez';
```

---

## 5. 🔍 Consultas SELECT Avanzadas del Sistema

A continuación, exponemos **10 Consultas SELECT Operacionales** imprescindibles de nuestros servicios. Integran los operadores `LIKE`, `BETWEEN`, `IN`, `IS NULL`.

### 1️⃣ Consulta Inclusiva (`IN`)
* **Código SQL:**
  ```sql
  SELECT nombre, tipo, ciudad 
  FROM INSTITUCIONES 
  WHERE ciudad IN ('Bogotá', 'Medellín', 'Cali');
  ```
* **Explicación:** Filtra instituciones originarias que pertenezcan a capitales estrictas.
* **Contexto en el Sistema:** Cuando el estudiante especifica en su perfil su interés exclusivo por zonas metropolitanas.

### 2️⃣ Barra de Búsqueda Flexible (`LIKE`)
* **Código SQL:**
  ```sql
  SELECT nombre, modalidad 
  FROM PROGRAMAS 
  WHERE nombre LIKE '%Ingeniería%';
  ```
* **Explicación:** Extrae programas con la nomenclatura buscada independientemente del texto que rodee.
* **Contexto en el Sistema:** Core del autocomplete del frontend cuando un alumno duda sin saber el nombre exacto de su carrera.

### 3️⃣ Filtro de Presupuesto Real (`BETWEEN`)
* **Código SQL:**
  ```sql
  SELECT nombre, costo_matricula 
  FROM PROGRAMAS 
  WHERE costo_matricula BETWEEN 1500000 AND 4000000;
  ```
* **Explicación:** Retorna las carreras con precios limitados al rango establecido por límites de inversión.
* **Contexto en el Sistema:** Para generar el Top 5 de opciones verdaderamente funcionales al bolsillo del estudiante y su entorno económico dictado.

### 4️⃣ Auditoría de Información Omisa (`IS NULL`)
* **Código SQL:**
  ```sql
  SELECT nombre, telefono, sitio_web 
  FROM INSTITUCIONES 
  WHERE telefono IS NULL;
  ```
* **Explicación:** Enumera universidades cuyos números no se guardaron, y figura como valor neutro.
* **Contexto en el Sistema:** Exclusivo de Admins para detectar "Data Quality" defectuosa previo a mandar el programa a los clientes, forzando a rellenarla.

### 5️⃣ Segmentación para Campañas (`BETWEEN` y `IN`)
* **Código SQL:**
  ```sql
  SELECT nombre, edad, ciudad 
  FROM PERFILES_USUARIO 
  WHERE edad BETWEEN 15 AND 17 
    AND ciudad IN ('Bucaramanga', 'Cartagena');
  ```
* **Explicación:** Localiza usuarios en un espectro de edad en etapa colegial que además residan en ciudades dadas.
* **Contexto en el Sistema:** Operatividad de Mailchimp o envíos de SMS recordando las ferias universitarias de dicha edad, aumentando la precisión del público.

### 6️⃣ Clasificación de Tests por Fase (`LIKE` e `IS NOT NULL`)
* **Código SQL:**
  ```sql
  SELECT nombre, version 
  FROM CUESTIONARIOS 
  WHERE version LIKE '1.%' AND descripcion IS NOT NULL;
  ```
* **Explicación:** Determina en masa un catálogo de test que esté en una variante original (1.*) con descripciones ya redactadas por terapeutas.
* **Contexto en el Sistema:** Se corre por auditores antes del inicio del año escolar para confirmar paquetes de cuestionarios seguros de publicar.

### 7️⃣ Escaneo Crítico de Requisitos (`IS NULL` y `IN`)
* **Código SQL:**
  ```sql
  SELECT nombre, tipo, area_academica
  FROM PROGRAMAS 
  WHERE requisitos IS NULL AND area_academica IN ('Salud', 'Ciencias Exactas');
  ```
* **Explicación:** Listado de programas del sector Ciencias Médicas/Biológicas que carecen de texto formal de requisitos.
* **Contexto en el Sistema:** Evita deudas éticas. En Medicina nunca es nulo un requisito de perfil, esta métrica eleva alertas y bloquea su promoción para no causar problemas al inscribirse.

### 8️⃣ Matches de Excepcionalidad (`BETWEEN`)
* **Código SQL:**
  ```sql
  SELECT p.nombre, p.apellido, r.compatibilidad, r.razones 
  FROM RECOMENDACIONES r
  INNER JOIN RESULTADOS rs ON r.resultado_id = rs.id
  INNER JOIN PERFILES_USUARIO p ON rs.perfil_usuario_id = p.id
  WHERE r.compatibilidad BETWEEN 90.00 AND 100.00;
  ```
* **Explicación:** Cruza 3 tablas para localizar estudiantes que tienen una sinergia perfecta y muy alta con una carrera en específico.
* **Contexto en el Sistema:** Sirve de gancho comercial, mandando a aquellos usuarios un Email masivo indicando: "Naciste para esto. Tienes compatibilidad excelente."

### 9️⃣ Confirmación de Entidades Institucionales (`LIKE` y `IS NULL`)
* **Código SQL:**
  ```sql
  SELECT nombre, email 
  FROM INSTITUCIONES 
  WHERE email LIKE '%@%.edu.co' AND sitio_web IS NULL;
  ```
* **Explicación:** Destaca a los entes que demuestran dominios .edu.co colombianos fidedignos para contacto, pero a los que nos falta encontrar su Link.
* **Contexto en el Sistema:** Mantenimiento. Como el correo "edu.co" acredita la validez, da a los data entry seguridad para investigar internamente manual.

### 🔟 Calendario de Inminencia (`BETWEEN`)
* **Código SQL:**
  ```sql
  SELECT nombre, fecha_apertura, cupos
  FROM CONVOCATORIAS
  WHERE fecha_apertura BETWEEN '2026-01-01' AND '2026-06-30';
  ```
* **Explicación:** Despliega aperturas que van a ocurrir en todo el lapso exacto de la primera mitad del próximo semestre.
* **Contexto en el Sistema:** Alimenta el Widget de "Calendario de Admisiones" que el estudiante ve en la primera de inicio.

---

## 6. 🎤 Dinámica de Exposición (Sugerencia)

Para mantener una sincronía perfecta, nuestra exposición debe dividirse en los siguientes 4 bloques:

* **👩‍🏫 Presentador 1 - Visión y Negocio (Intro y Modelado 1/2):**
  Abre la exposición contando quién somos (Brota). Enseña en el diagrama MER las 4 tablas relacionadas con nuestro cliente: Estudiantes, Cuestionarios, Preguntas y Resultados. Muestra el enfoque de la plataforma.
* **👦 Presentador 2 - Operatividad Externa (Modelado 2/2 y Arquitectura):**
  Desarrolla el resto del ecosistema: Carreras, Universidades, Fechas de Convocatorias, y Remata con las 'Recomendaciones'. Transmite entusiasmo en las llaves foráneas y los ID's indicando que Brota cruza dos mundos (personas vs. formación).
* **🤵 Presentador 3 - Inyectando la Vida (Script de Inserción e Integridad - CRUD):**
  Enseña directo de pantalla el uso de variables INSERTS para poblar nuestro sistema. Justifica a toda costa la idea de por qué hacemos **UPDATE** el 99% de los casos antes que **DELETE** en la vida real. Resalta el mantenimiento histórico de registros.
* **👧 Presentador 4 - Inteligencia del Dato (Lógica Avanzada DQL y Cierre):**
  Presenta 5 de las 10 Consultas Avanzadas. Al verlas, enfatiza la sintaxis particular (ej: `LIKE`, `IN`, `BETWEEN`, y los nulos). Demuestra cómo unas pocas sentencias guían al programa y da una conclusión categórica del impacto académico y tecnológico final del software.

---

## 7. 🎯 Conclusión

El diseño del Modelo de Base de Datos relacional es verdaderamente el **motor de inferencia** que potencia a **Brota**.
No se trata de un armario para almacenar cuentas; mediante una rígida **integridad referencial**, reglas normalizadas de `PKs` y `FKs`, y empleos quirúrgicos de operadores avanzados en SQL, el sistema tiene la habilidad de procesar millones de celdas procedentes de tests complejos, filtrando y enlazando de manera inteligente programas vitales para **apoyar drásticamente la toma de decisiones** más importante durante la vida de la persona y de paso asegurar escalabilidad del producto final.
