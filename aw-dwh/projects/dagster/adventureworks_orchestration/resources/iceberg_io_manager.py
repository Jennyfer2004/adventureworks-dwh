import os
from typing import Union

import dagster as dg
from dagster_pyspark.resources import PySparkResource
from dagster_shared.seven.temp_dir import get_system_temp_directory
from pyspark.sql import DataFrame


class IcebergIOManager(dg.ConfigurableIOManager):
    """This IOManager will take a pyspark dataframe and store it in a CSV file at the
    specified path.

    It stores outputs for different partitions in different filepaths.

    Downstream ops can either load this dataframe into a spark session or simply retrieve a path
    to where the data is stored.
    """

    pyspark: dg.ResourceDependency[PySparkResource]
    catalog: str
    

    def handle_output(self, context: dg.OutputContext, obj: DataFrame):
        if isinstance(obj, DataFrame):
            row_count = obj.count()
            obj.writeTo(f"{context.asset_key.parts[0]}.{context.asset_key.parts[-1].lower()}").create()
        else:
            raise Exception(f"Outputs of type {type(obj)} not supported.")

        context.add_output_metadata({"row_count": row_count})


    def load_input(self, context) -> DataFrame:
        if context.dagster_type.typing_type == DataFrame:
            # return pyspark dataframe
            self.pyspark.spark_session.read.format("iceberg").load(f"iceberg.{context.asset_key.parts[0]}.{context.asset_key.parts[-1]}")

        raise Exception(
            f"Inputs of type {context.dagster_type} not supported. Please specify a valid type "
            "for this input either on the argument of the @asset-decorated function."
        )
