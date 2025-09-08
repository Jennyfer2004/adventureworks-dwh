# AdventureWorks Data Warehouse

> Este es el proyecto final del curso de **Inteligencia de Negocios (Business Intelligence)** en la **Facultad de Matemática y Computación de la Universidad de La Habana**.

## Información General

En este proyecto, los estudiantes construirán una solución de **Inteligencia de Negocios (IN)** para la empresa ficticia **AdventureWorks**. Este escenario es una extensión del escenario propuesto por Microsoft en la [base de datos original de AdventureWorks](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms). El proyecto consta de tres tareas principales

- [**Tarea #1 - Diseño y documentación**](#tarea-1---diseño-y-documentación)
- [**Tarea #2 - Almacén de datos**](#tarea-2---almacén-de-datos)
- [**Tarea #3 - Panel de control**](#tarea-3---panel-de-control)

El trabajo debe realizarse en grupos de dos (2) estudiantes.

- **Fecha de publicación:** 10 de septiembre de 2025
- **Fecha de entrega:** 15 de diciembre de 2025

La documentación del proyecto puede consultarse [aquí](./aw-docs/doc.md).

## Descripción del proyecto

**AdventureWorks Cycles** es una empresa multinacional ficticia que fabrica y vende bicicletas, componentes y accesorios. La compañía opera a nivel global, con sucursales ubicadas en Norteamérica, Europa y Australia, atendiendo tanto a personas naturales como a comercios minoristas. Sus operaciones están diseñadas para simular la complejidad de una empresa real, proporcionando un conjunto de datos completo y detallado para explorar diversos aspectos de la gestión empresarial, ventas, manufactura y recursos humanos.

AdventureWorks genera sus ingresos principalmente a través de la venta de bicicletas y accesorios relacionados. Sus clientes pueden ser personas que compran productos para uso personal o tiendas minoristas que adquieren productos al por mayor para revenderlos a sus propios clientes. Cada orden de venta se registra y rastrea cuidadosamente a nivel de artículo, lo que permite una gestión precisa del inventario y el rendimiento de las ventas. Algunas órdenes son gestionadas directamente por representantes de ventas, quienes desempeñan un papel fundamental en la generación de ingresos. Estos empleados reciben una comisión por las ventas que consiguen y pueden obtener bonificaciones adicionales cuando cumplen o superan sus cuotas de ventas asignadas. AdventureWorks también ofrece servicios de envío para entregar sus productos en todo el mundo. Estos costos de envío son asumidos por el cliente, y la empresa soporta múltiples métodos de envío para adaptarse a la logística internacional y a las diversas necesidades de los clientes.

El proceso de fabricación de la compañía está respaldado por una cadena de suministro integral. Para producir bicicletas y accesorios, AdventureWorks compra materias primas a diversos proveedores. Estos materiales se almacenan en almacenes y se procesan en diferentes instalaciones de la cadena de producción. Ciertos empleados se encargan de negociar con los proveedores, gestionar órdenes de compra y garantizar un flujo constante de materias primas hacia las operaciones de la empresa. Toda la información sobre proveedores y el historial de compras se registra para respaldar la planificación, el control de calidad y los procesos de auditoría. La gestión de inventario juega un papel esencial para asegurar que tanto las materias primas utilizadas como los productos terminados se rastreen con precisión a lo largo de la cadena de producción. Para cada producto fabricado, AdventureWorks mantiene una lista detallada de materiales, que especifica todos los componentes y subcomponentes necesarios para su ensamblaje. Cuando un producto se programa para su producción, se emite una orden de trabajo y el artículo avanza por las distintas etapas de la línea de ensamblaje hasta completarse y quedar listo para la venta. Este sistema garantiza eficiencia, trazabilidad y calidad en los productos.

Además de sus operaciones de ventas y manufactura, AdventureWorks cuenta con un departamento de Recursos Humanos (RRHH) que gestiona la fuerza laboral de la empresa. Este departamento es responsable de mantener registros detallados de los empleados, administrar la nómina, supervisar las asignaciones departamentales y gestionar la estructura organizacional. También se encarga de llevar el control de las comisiones y bonificaciones de los representantes de ventas, así como de apoyar los procesos de reclutamiento e incorporación de nuevos empleados.

En este proyecto, los estudiantes asumirán roles de especialistas dentro del recién creado departamento de Inteligencia de Negocios de AdventureWorks Cycles, una división creada para satisfacer la creciente necesidad de la empresa de contar con información basada en datos. Su principal responsabilidad será diseñar e implementar las herramientas, sistemas y procesos que permitirán a los ejecutivos y responsables de la toma de decisiones contar con datos precisos, oportunos y accionables. Esto incluye establecer una infraestructura sólida de datos, definir estándares de reportes y desarrollar tableros de control y soluciones analíticas que transformen los datos operativos en información significativa para la empresa.

### Objetivos del negocio

Después de varias discusiones con los ejecutivos de la empresa, los principales objetivos de negocio han sido definidos. Aunque AdventureWorks es una organización simulada, sus metas reflejan las de cualquier negocio real.

La empresa tiene como objetivo primario **aumentar los márgenes de ganancia**. Para lograr este objetivo, los ejecutivos han identificado dos objetivos estratégicos en los que se enmarcarán las posibles decisiones y las mejoras operativas:

1. **Incrementar los ingresos**
   Aumentar los ingresos mientras se mantienen los costos estables conducirá naturalmente a una mayor rentabilidad. Entre las estrategias siendo consideradas para lograrlo están:
   - **Incrementar la participación en el mercado:** Ampliar la presencia de la empresa en los mercados existentes o ingresar a nuevos mercados para atraer a más clientes.
   - **Ajuste de precios:** Elevar cuidadosamente los precios de los productos para impulsar el crecimiento de los ingresos, monitoreando la respuesta de los clientes para evitar impactos negativos en la demanda.
2. **Reducir los costos**
   Reducir gastos innecesarios y mejorar la eficiencia operativa ayudará a maximizar los márgenes. Entre los enfoques :
   - **Optimización de la cadena de suministro:** Mejorar la relación con los proveedores, reducir los costos de materiales y optimizar la gestión de inventarios.
   - **Optimización de la línea de ensamblaje:** Perfeccionar los procesos de producción para disminuir el desperdicio de materias primas, mejorar la calidad y aumentar la capacidad productiva.
   - **Reestructuración de la nómina:** Evaluar la estructura de personal y los planes de compensación para asegurar que los recursos se asignen de manera eficiente y estén alineados con las necesidades del negocio.

### Estrategia del negocio

Para alcanzar estos objetivos, se ha decidido crear un plan de negocios que guiará las decisiones estratégicas de la empresa durante los próximos años. Este plan dependerá en gran medida de datos precisos y confiables para asegurar que cada decisión esté respaldada por información significativa y no por suposiciones.

Como parte de este proceso, el equipo directivo ha identificado varias áreas clave en las que necesita una comprensión más profunda antes de tomar decisiones críticas sobre el futuro de la empresa. Algunas de las decisiones que desean explorar mediante el análisis de datos incluyen:

#### Incrementar los ingresos

- **[D1] Aumentar el presupuesto de marketing**: Actualmente, AdventureWorks cuenta con un departamento de marketing relativamente pequeño que se enfoca en canales de publicidad tradicionales, incluyendo comerciales de televisión, además de patrocinios y eventos de demostración ocasionales. Aunque estas actividades representan una inversión considerable, los ejecutivos no están seguros del impacto real que este gasto ha tenido en los ingresos totales y en el crecimiento de la marca.

- **[D2] Lanzar una oferta especial para un producto**: En ocasiones, la empresa considera ofrecer descuentos temporales en ciertos productos. Aunque esta estrategia implica reducir el precio y, potencialmente, disminuir los márgenes de ganancia a corto plazo, también puede generar un incremento significativo en el volumen de ventas. Además de aumentar los ingresos inmediatos, las promociones pueden atraer nuevos clientes que, una vez familiarizados con la marca y sus productos, podrían continuar comprando a precios regulares.

- **[D3] Ofrecer envíos gratuitos**: La empresa también podría considerar absorber los costos de envío para ciertas regiones, reduciendo así el precio total para el cliente. Al cubrir total o parcialmente las tarifas de entrega, AdventureWorks haría sus productos más atractivos y competitivos en mercados específicos, lo que podría incrementar las ventas y la satisfacción del cliente.

- **[D4] Asignar a un vendedor destacado a un territorio**: Otra estrategia que la empresa está considerando consiste en optimizar la asignación de sus mejores representantes de ventas. Al ubicar a los vendedores con mejor desempeño en territorios que actualmente tienen cuotas de mercado bajas, AdventureWorks busca impulsar las ventas en regiones con bajo rendimiento.

- **[D5] Incrementar producción de un producto**: La empresa también está evaluando la posibilidad de incrementar la producción de sus productos más vendidos. Al producir mayores cantidades de artículos que han demostrado ser populares entre los clientes, AdventureWorks podría satisfacer la creciente demanda de manera más efectiva y evitar la escasez de inventario que podría limitar las ventas.

- **[D6] Incrementar precios**: Otra decisión que se está considerando es aumentar los precios de los productos. Si bien subir los precios puede incrementar directamente los ingresos, esta estrategia debe manejarse con cautela. Un aumento de precios puede mejorar los márgenes de ganancia en el corto plazo, pero también existe el riesgo de perder clientes o disminuir la demanda, especialmente en mercados con alta competencia.

#### Reducir Costos

- **[D7] Incrementar la cantidad almacenada de una materia prima**: Los ejecutivos también están considerando los posibles beneficios de incrementar el inventario de materias primas clave en los almacenes de la empresa. Al comprar y almacenar mayores cantidades de materiales esenciales, AdventureWorks podría protegerse contra futuros incrementos de costos derivados de la inflación, interrupciones en la cadena de suministro o la imposición de nuevos aranceles.

- **[D8] Reemplazar a un proveedor de materia prima**: Otra decisión importante que la empresa podría evaluar es reemplazar a un proveedor actual de materia prima por uno alternativo. Cambiar a un nuevo proveedor podría significar mejores precios, mayor calidad y un servicio más confiable, beneficiando tanto la producción como la rentabilidad.

- **[D9] Incrementar el control de calidad en la línea de ensamblaje**: La empresa también está considerando incrementar la presencia de personal de control de calidad (QA) en sus ubicaciones de líneas de ensamblaje. Un mayor control de calidad durante la producción permitiría detectar defectos, ineficiencias y problemas potenciales en etapas más tempranas, mejorando la calidad de los productos finales y reduciendo costos asociados con reprocesos, devoluciones y reclamos de garantía.

- **[D10] Descontinuar la producción de un producto**: Otra decisión que la empresa podría enfrentar es si descontinuar un producto que ya no está teniendo un buen desempeño en el mercado. Con el tiempo, ciertos productos pueden experimentar una disminución en las ventas debido a cambios en las preferencias de los clientes, mayor competencia o variaciones en las tendencias del mercado. Continuar produciendo y vendiendo estos productos puede generar costos innecesarios en fabricación, almacenamiento y marketing, lo que en última instancia reduce la rentabilidad general de la empresa.

- **[D11] Despedir a un vendedor**: La empresa también puede enfrentar situaciones en las que deba terminar el contrato de un empleado debido a problemas de desempeño, violaciones de las políticas de la compañía o cambios en las necesidades operativas. Aunque despedir a un empleado siempre es una decisión difícil, a veces es necesario para mantener la productividad, asegurar un ambiente laboral saludable y proteger los intereses a largo plazo de la empresa.

### Monitoreo del negocio

Para evaluar si los objetivos comerciales de la empresa se están cumpliendo y medir el progreso a lo largo del tiempo, los ejecutivos han encargado al nuevo departamento de Inteligencia de negocios el diseño e implementación de un Panel de Control de Salud del Negocio.

Este panel centralizado ofrecerá visibilidad en tiempo real de los principales indicadores operativos y financieros de la compañía para determinar su rentabilidad.

## Evaluación

Para la evaluación, cada equipo deberá seleccionar dos (2) decisiones de la sección [Estrategia del negocio](#Estrategia del negocio) y proporcionar una solución de inteligencia de negocios que permitan a los usuarios respaldar el proceso de toma de dichas decisiones utilizando los datos disponibles en la organización. Además como parte de su solución se debe incluir el panel de control general descrito en la sección [Monitoreo del negocio](#Monitoreo del negocio).

Para completar la solución de inteligencia de negocios, se deben realizar cada una de las tres tareas del proyecto, y la calificación final será el promedio de las calificaciones obtenidas en cada tarea.

A continuación, se detallan los requerimientos para la entrega de cada tarea:

### Tarea #1 - Diseño y documentación

En esta tarea los estudiantes deben de dejar documentado el proceso de diseño de su solución de inteligencia de negocios. Dicha documentación deberá encontrarse en el directorio `aw-docs` será dividida en tres secciones principales: 

#### Análisis de fuentes de datos

Dentro del directorio `aw-docs\data-sources`, se debe preparar un documento para cada fuente de datos en el que se incluyan las siguientes secciones:

- **Resumen**: Una breve descripción de la fuente de datos, incluyendo su origen, propósito y el tipo de datos que contiene.
- **Modelo conceptual**: Una representación conceptual de la fuente de datos utilizando Modelo Entidad Relacionalidad Extendido (MERX) que muestre las entidades, interrelaciones y atributos.
- **Modelo lógico**: La representación lógico del modelo de datos
- **Catálogo de datos**: Una descripción completa de cada tabla dentro de la fuente de datos. Este catálogo debe incluir:
  - Nombre y propósito de la tabla.
  - Lista de campos, incluyendo nombre, tipo de dato, restricciones y descripción de negocio.

#### Requerimientos del negocio

Dentro del directorio `aw-docs\requirements`, se debe prepara un documento que especifique las metas de la empresa y modele los requerimientos informacionales para la solución de inteligencia de negocios a partir de las mismas. 

Este documento debe estar estructurado de la siguiente forma:

- **Resumen**: Una descripción general de los objetivos estratégicos y metas de negocio de la empresa.
- **Modelo conceptual de los requerimientos del negocio**: Un diagrama que muestre la relación entre los objetivos de negocio, las decisiones y la información requerida para tomar dichas decisiones. Este modelo debe hacerse utilizando la metodología vista en conferencias.

Además, para cada decisión identificada en el modelo, se debe elaborar un documento específico que contenga:

- **Resumen:** Descripción clara de la decisión y su importancia para la empresa.
- **Preguntas de negocio:** Lista de preguntas que el panel de control específico para la decisión debe responder para respaldar la toma de decisiones.
- **Indicadores de desempeño (KPIs):** Métricas necesarias para responder las preguntas de negocio, incluyendo sus definiciones y fórmulas de cálculo.
- **Parámetros:** Variables de entrada o filtros que el panel debe soportar, como rangos de fechas, categorías de productos o regiones geográficas.
- **Visualizaciones recomendadas:** Sugerencias sobre las visualizaciones de datos más efectivas para cada KPI.

#### Diseño de arquitectura

Dentro del directorio `aw-docs/architecture` , esta documento debe recoger las especificaciones conceptuales y técnicas para la implementación de la solución de inteligencia de negocios

- **Resumen:** Una visión general de la arquitectura y su papel en el soporte a los objetivos de IN de la empresa.
- **Arquitectura conceptual:** Un diagrama conceptual que muestre el flujo de datos desde las fuentes hasta el data warehouse y, finalmente, los usuarios finales.
- **Componentes de la arquitectura:** Descripción detallada de cada componente de la arquitectura, como procesos ETL, almacenamiento de datos, herramientas analíticas y capas de reportes.
- **Diseño del almacén de datos empresarial**: Diseño del esquema global del almacén de datos que integra las distintas fuentes de datos. Además de la especificación de convenciones y resolución de conflictos.
- **Diseño del almacén de datos informacional:**  Diseño del esquema multidimensional de la capa de datos derivados del almacén de datos. Además de la especificación de convenciones, jerarquías de atributos, granularidad, etc.

### Tarea #2 - Almacén de datos

En esta tarea se debe implementar un almacén de datos siguiendo las especificaciones definidas en la sección [Diseño de arquitectura](#Diseño de arquitectura) de la documentación.

Es importante asegurarse de seguir las convenciones y buenas prácticas aprendidas durante las clases prácticas.

El código debe estar en el directorio `aw-dwh`.

### Tarea #3 - Panel de control

En esta tarea se deben implementar los paneles de control que soportarán la toma de las deicisiones definidas en la sección [Requerimientos del negocio](#Requerimientos del negocio) de la documentación.

El código debe estar en el directorio `aw-dashboard`.