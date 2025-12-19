import dagster as dg
from adventureworks_orchestration.resources.mysql_resource import MySQLResource
from adventureworks_orchestration.constants import *
from pyspark.sql import DataFrame
from typing import Iterator
from .setup import clean_bronze_layer


aw_review_tables = [ "reviews", "stores", "users"]


def get_bronze_aw_review_table_asset(table: str):
    @dg.asset(
        ins={
            "source" : dg.AssetIn(key=[ASSET_GROUP_LANDING, AW_REVIEWS_API_PREFIX, table.lower()]) 
        },
        io_manager_key="s3_iceberg_io_manager",
        deps=[clean_bronze_layer],
        key=[ASSET_GROUP_BRONZE, f"review_{table.lower()}"],
        group_name=ASSET_GROUP_BRONZE,
    )
    def _asset(context: dg.AssetExecutionContext, source: DataFrame):
        return dg.Output(value=source)

    return _asset

def get_bronze_aw_reviews_assets():
    return [get_bronze_aw_review_table_asset(table) for table in aw_review_tables]


ASSETS = get_bronze_aw_reviews_assets()