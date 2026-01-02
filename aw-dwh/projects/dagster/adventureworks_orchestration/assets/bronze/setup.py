import dagster as dg
from adventureworks_orchestration.constants import *
from dagster_aws.s3 import S3Resource
from adventureworks_orchestration.utils.s3 import clean_prefix
from adventureworks_orchestration.utils.iceberg import clean_schema
from dagster_pyspark import PySparkResource


@dg.asset(
    key=[ASSET_GROUP_BRONZE, SETUP_PREFIX, "schema"], 
    group_name=ASSET_GROUP_BRONZE
)
def create_bronze_schema(spark_s3_rsc: PySparkResource):

    spark = spark_s3_rsc.spark_session

    clean_schema(spark, "bronze")

    return dg.MaterializeResult(asset_key=[ASSET_GROUP_BRONZE, SETUP_PREFIX, "schema"])


@dg.asset(
    key=[ASSET_GROUP_BRONZE, SETUP_PREFIX, "clean"], 
    group_name=ASSET_GROUP_BRONZE,
    deps=[create_bronze_schema]
)
def clean_bronze_layer(s3_rsc: S3Resource):

    s3 = s3_rsc.get_client()

    result = clean_prefix(s3, "warehouse", ASSET_GROUP_BRONZE)

    return dg.MaterializeResult(asset_key=[ASSET_GROUP_BRONZE, SETUP_PREFIX, "clean"], metadata={"deleted": result})
   


