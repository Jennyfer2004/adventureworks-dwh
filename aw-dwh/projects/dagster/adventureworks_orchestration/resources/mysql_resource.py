from abc import ABC, abstractmethod
from typing import Any
from dagster_pyspark import PySparkResource
from dagster import ConfigurableResource, ResourceDependency
from pyspark.sql import DataFrame
from pydantic import Field


class MySQLResource(ConfigurableResource, ABC):
    
    host: str = Field(description="The hostname or IP address of the MySQL server.")
    port: str = Field(description="The port on which the MySQL server is listening, defaults to 3306.")
    database: str = Field(description="The name of the MySQL database to connect to.")
    user: str = Field(description="The username for authenticating with the MySQL server.")
    password: str = Field(description="The password associated with the given username.")
    
    @abstractmethod
    def fetch_table(self, table_name: str) -> Any:
        pass

    def _get_connection_string(self) -> str:
        return f"jdbc:mysql://{self.host}:{self.port}/{self.database}"


class PySparkMySQLResource(MySQLResource):

    pyspark: ResourceDependency[PySparkResource]

    def fetch_table(self, table_name: str) -> DataFrame:
        df = self.pyspark.spark_session.read.jdbc(
            url=self._get_connection_string(),
            table=table_name,
            properties={
                "user": self.user,
                "password": self.password,
                "driver": "com.mysql.cj.jdbc.Driver",
                "fetchSize": "10000"
            }
        )

        return df


