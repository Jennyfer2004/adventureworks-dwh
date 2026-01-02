import dagster as dg
from adventureworks_orchestration.resources.http_csv_resorce import PySparkHTTPCSVResource
from adventureworks_orchestration.constants import *
from pyspark.sql import DataFrame
from .setup import clean_landing_zone

aw_hr_tables = ["Shift","EmployeeDepartmentHistory","EmployeePayHistory"]

def get_landing_aw_hr_table_asset(table: str):
    
    @dg.asset(
    key=[ASSET_GROUP_LANDING, AW_HR_FILES_PREFIX,table.lower()],
    group_name=ASSET_GROUP_LANDING,
    deps=[clean_landing_zone],


    io_manager_key="s3_csv_lake_io_manager"
)
    # def _asset(context: dg.AssetExecutionContext, aw_file_rsc : S3Resource) -> dg.Output[DataFrame]:
    #     df = aw_file_rsc.fetch_table(table)

    #     return dg.Output(value=df)

    def _asset(context: dg.AssetExecutionContext, aw_file_rsc: PySparkHTTPCSVResource) -> dg.Output[DataFrame]:

        file_name = f"{table}.csv"
        print(file_name)
        df = aw_file_rsc.fetch_csv(file_name)

        return dg.Output(value=df)

    return _asset

def get_bronze_aw_hr_assets():
    return [get_landing_aw_hr_table_asset(table) for table in aw_hr_tables]


ASSETS = get_bronze_aw_hr_assets()
