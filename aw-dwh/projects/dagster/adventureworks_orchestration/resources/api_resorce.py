from abc import ABC, abstractmethod
from typing import Any, Dict, Optional
from dagster import ConfigurableResource
from pydantic import Field
import requests
from pyspark.sql import DataFrame
from dagster_pyspark import PySparkResource
from dagster import ResourceDependency

class APIResource(ConfigurableResource, ABC):
    """
    Recurso base abstracto para interactuar con APIs REST.
    """
    host: str = Field(description="El host de la API (ej. 'api.example.com').")
    port: str = Field(description="El puerto de la API (ej. 8080).")

    @abstractmethod
    def fetch_endpoint(self, endpoint: str, params: Optional[Dict[str, Any]] = None) -> Any:
        pass


class PySparkAPIResource(APIResource):
    """
    Implementación concreta para obtener datos de una API y convertirlos en un DataFrame de PySpark.
    """
    pyspark: ResourceDependency[PySparkResource]

    def fetch_endpoint(self, endpoint: str) -> DataFrame:
        """
        Realiza una petición GET a un endpoint, parsea la respuesta JSON a un DataFrame de Spark.
        """
        port_str = f":{self.port}" if self.port else ""
        full_url = f"http://{self.host}{port_str}/{endpoint.lstrip('/')}"
        
        
        try:
            response = requests.get(full_url)
            response.raise_for_status()
        except requests.exceptions.RequestException as e:
            raise Exception(f"Error al llamar a la API {full_url}: {e}")

        data = response.json()
        
        spark_session = self.pyspark.spark_session
        df = spark_session.createDataFrame(data)
        
        return df