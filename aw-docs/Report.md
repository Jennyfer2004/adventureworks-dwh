1. Introducción 

El presente informe detalla la metodología y las visualizaciones clave desarrolladas en nuestra herramienta de Inteligencia de Negocio, Metabase, para responder a dos preguntas estratégicas fundamentales para la optimización de nuestro catálogo: 

    ¿Qué productos deberíamos considerar para descontinuar? 
    ¿En qué productos tenemos una oportunidad real para incrementar los precios de forma rentable? 

Aprovechando nuestro modelo de datos, hemos diseñado una serie de gráficos que nos permiten pasar de decisiones basadas en la intuición a un enfoque analítico y respaldado por evidencia. 
2. Análisis para la Descontinuación de Productos 

Identificar productos de bajo rendimiento es crucial para liberar capital, reducir costos operativos y enfocar nuestros esfuerzos en los artículos más rentables. Proponemos un análisis en varias capas, entre las que se encuentran: 

2.1. Gráfico de Volumen de Ventas 

     Visualización: Gráfico de Barras.
     Objetivo: Identificar rápidamente los productos con el menor número de unidades vendidas.
     Interpretación Clave: Las barras más cortas del gráfico representan productos con una demanda muy baja. Estos son los primeros candidatos a ser analizados, ya que su bajo volumen de ventas puede no justificar los costos asociados a su almacenamiento y logística.
     ![](./images/Metabase-Sales%20Volume%20Analysis-1_1_2026,%2020_00_46.png)

2.2. Gráfico de Rentabilidad 

     Visualización: Gráfico de Dispersión (Ingresos vs. Beneficio).
     Objetivo: Evaluar la rentabilidad real de cada producto, no solo sus ingresos.
     Interpretación Clave: Los productos ubicados en el cuadrante inferior izquierdo (bajos ingresos y bajo/nulo beneficio) y, especialmente, aquellos por debajo del eje X (beneficio negativo), son productos que directamente nos están generando pérdidas. Estos deben ser priorizados para su descontinuación.
     
     ![](./images/Metabase-Sales%20per%20Month-1_1_2026,%2020_01_21.png)
2.3. Gráfico de Tendencia de Ventas 

     Visualización: Gráfico de Líneas.
     Objetivo: Confirmar si la falta de interés en un producto es una tendencia a largo plazo.
     Interpretación Clave: Para cualquier producto identificado en los análisis anteriores, este gráfico muestra su comportamiento a lo largo del tiempo. Una línea con una pendiente descendente clara confirma que la demanda está decayendo, reforzando la decisión de descontinuar.
          ![](./images/Metabase-Profitability%20Index-1_1_2026,%2020_01_51.png)

2.4 Tabla de Rentabilidad
    Objetivo Principal: Generar una vista completa y ordenada que muestre no solo los ingresos, sino el beneficio real y el margen de ganancia de cada producto. Esto permite identificar rápidamente los productos más valiosos, los que necesitan optimización y los que son una carga para el negocio, facilitando la comparación objetiva entre todo el catálogo.

Conclusión de Descontinuación: Un producto debe ser fuertemente considerado para la descontinuación si presenta bajo volumen de ventas, baja o nula rentabilidad y una tendencia de ventas decreciente. 

3. Análisis para el Incremento de Precios 

Ajustar los precios de manera incorrecta puede dañar la relación con los clientes y reducir las ventas. Nuestro análisis busca identificar oportunidades de aumento de precio con el menor riesgo posible, utilizando una métrica de Índice de Rentabilidad que normaliza el rendimiento de todos los productos en una escala de 0 a 100. 

3.1. Gráfico de Ranking de Rentabilidad Indexada 

     Visualización: Gráfico de Dispersión.
     Objetivo: Crear un ranking de todos los productos según su rentabilidad relativa.
     Interpretación Clave:
         Índice Alto (>80): Productos "estrella". Son candidatos a un aumento de precio, pero requiere un análisis de sensibilidad.
         Índice Bajo (<20): Productos "problemáticos". Si su demanda no es sensible al precio, son candidatos perfectos para un aumento que los empuje hacia la rentabilidad.
         
          ![grafico](./images/Metabase-Profitability%20and%20Price-1_1_2026,%2020_03_47.png)


3.2. Gráfico de Rentabilidad vs. Precio de Venta 

     Visualización: Gráfico de Dispersión (Rentabilidad vs. Precio Promedio).
     Objetivo: Encontrar "oportunidades fáciles": productos que son muy rentables pero tienen un precio de venta relativamente bajo.
     Interpretación Clave: El cuadrante superior izquierdo (alta rentabilidad, bajo precio) es nuestra zona de mayor interés. Estos productos tienen un margen de precio que el mercado parece tolerar, lo que indica una alta probabilidad de éxito en un aumento de precio.
     

3.3. Gráfico de Análisis de Elasticidad de Precios 

     Visualización: Gráfico de Líneas Doble (Precio y Cantidad Vendida a lo largo del tiempo).
     Objetivo: Medir la sensibilidad de la demanda de un producto ante cambios en su precio.
     Interpretación Clave:
         Demanda Inelástica: Si el precio sube y la cantidad vendida se mantiene estable, el producto es un candidato seguro para un aumento.
         Demanda Elástica: Si el precio sube y la cantidad vendida se desploma, un aumento de precio es muy arriesgado.
         
            ![](./images/Metabase-Profit%20vs.%20Selling%20Price%20Ratio-1_1_2026,%2020_01_00.png)


Conclusión de Incremento de Precios: El producto ideal para un aumento de precio se encuentra en el cuadrante de alta rentabilidad/bajo precio y demuestra una demanda históricamente inelástica. 

4. Conclusión y Recomendaciones Estratégicas para la Descontinuación 

El análisis multidimensional realizado ha revelado claras oportunidades para optimizar el catálogo de productos. La decisión de descontinuar un producto no debe basarse en una sola métrica, sino en un perfil de bajo rendimiento consistente. Además, hemos identificado una categoría crítica de productos que requiere atención inmediata. 


Hemos descubierto que existen numerosos productos en nuestro catálogo que registran ventas nulas. Estos productos representan una "carga silenciosa" para el negocio, ya que pueden incurrir en costos de almacenamiento, gestión de inventario y de capital sin generar ningún ingreso a cambio. Este grupo constituye el conjunto de candidatos más obvio y de menor riesgo para una descontinuación inmediata. 

