import dagster as dg
from adventureworks_orchestration.resources.mysql_resource import MySQLResource
from adventureworks_orchestration.constants import *
from pyspark.sql import DataFrame


# You can also dinamically define your assets, unlike a multi asset dinamically defined assets
# support native parallelism 

aw_core_tables = [] # ???

def get_landing_aw_core_table_asset(table: str):
    raise NotImplementedError()

def get_bronze_aw_core_assets():
    return [get_landing_aw_core_table_asset(table) for table in aw_core_tables]


ASSETS = get_bronze_aw_core_assets()

