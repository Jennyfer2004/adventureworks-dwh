import dagster as dg
from adventureworks_orchestration.resources.api_resorce import PySparkAPIResource
from adventureworks_orchestration.constants import *
from pyspark.sql import DataFrame
from .setup import clean_landing_zone

aw_review_tables = [ "reviews", "stores", "users"]

def get_landing_aw_review_table_asset(table: str):
    @dg.asset(
        io_manager_key="s3_csv_lake_io_manager",
        key=[ASSET_GROUP_LANDING, AW_REVIEWS_API_PREFIX, table.lower()],
        group_name=ASSET_GROUP_LANDING,
        deps=[clean_landing_zone]

    )
    def _asset(context: dg.AssetExecutionContext, aw_review_api_rsc : PySparkAPIResource) -> dg.Output[DataFrame]:
        df = aw_review_api_rsc.fetch_endpoint(table)

        return dg.Output(value=df)

    return _asset

def get_bronze_aw_review_assets():
    return [get_landing_aw_review_table_asset(table) for table in aw_review_tables]


ASSETS = get_bronze_aw_review_assets()

