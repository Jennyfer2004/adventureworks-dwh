import os
from typing import Union

import dagster as dg
from dagster_pyspark.resources import PySparkResource
from dagster_shared.seven.temp_dir import get_system_temp_directory
from pyspark.sql import DataFrame


class PartitionedCsvIOManager(dg.ConfigurableIOManager):
    """This IOManager will take a pyspark dataframe and store it in a CSV file at the
    specified path.

    It stores outputs for different partitions in different filepaths.

    Downstream ops can either load this dataframe into a spark session or simply retrieve a path
    to where the data is stored.
    """

    pyspark: dg.ResourceDependency[PySparkResource]

    @property
    def _base_path(self):
        raise NotImplementedError()

    def handle_output(self, context: dg.OutputContext, obj: DataFrame):
        path = self._get_path(context)

        if isinstance(obj, DataFrame):
            row_count = obj.count()
            obj.write \
                .option("escape", "^") \
                .option("quoteEscape", "^") \
                .csv(path=path, mode="overwrite", header=True)
        else:
            raise Exception(f"Outputs of type {type(obj)} not supported.")

        context.add_output_metadata({"row_count": row_count, "path": path})


    def load_input(self, context) -> DataFrame:
        path = self._get_path(context)
        if context.dagster_type.typing_type == DataFrame:
            # return pyspark dataframe
            return (self.pyspark.spark_session
                    .read.format("csv")
                    .option("header", "true")
                    .option("inferSchema", "true")
                    .option("multiLine", "true")
                    .option("escape", "^")
                    .option("quoteEscape", "^")
                    .load(path)
                )

        raise Exception(
            f"Inputs of type {context.dagster_type} not supported. Please specify a valid type "
            "for this input either on the argument of the @asset-decorated function."
        )

    def _get_path(self, context: Union[dg.InputContext, dg.OutputContext]):
        return os.path.join(self._base_path, *context.asset_key.parts)


class S3PartitionedCsvIOManager(PartitionedCsvIOManager):
    s3_bucket: str

    @property
    def _base_path(self):
        return "s3a://" + self.s3_bucket
