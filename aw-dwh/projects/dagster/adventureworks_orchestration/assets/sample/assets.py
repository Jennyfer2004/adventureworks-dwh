import dagster as dg
from adventureworks_orchestration.constants import ASSET_GROUP_LABS
from .constants import ASSET_PREFIX_SOURCE, ASSET_PREFIX_TRANSFORMED, ASSET_PREFIX_REPORTS
from dagster_pyspark import PySparkResource
from .transformations import transformed_members, transformed_bookings, report_facilities_monthly, report_facilities_yearly
from pyspark.sql import DataFrame


files_path = "/home/iceberg/notebooks/data/bookings"
files = ["bookings", "facilities", "members"]

@dg.multi_asset(
    outs={
        file: dg.AssetOut(
            io_manager_key="s3_test_io_manager",
            key=[ASSET_GROUP_LABS, ASSET_PREFIX_SOURCE,file],
            group_name=ASSET_GROUP_LABS,
            is_required=False
        ) for file in files
    },
    can_subset=True
)
def bookings_source_files(context: dg.AssetExecutionContext, spark_s3_rsc: PySparkResource):
    spark = spark_s3_rsc.spark_session

    has_errors = False
    
    for file in context.selected_output_names:
        try:

            # read the file from the local storage using pyspark

            raise NotImplementedError()

            context.log.info(f"Finshed reading file {file}.csv")

            yield dg.Output(
                output_name=file,
                value=None
            )

        except Exception:
            context.log.exception(f"Couldn't materialize the asset {file}")
            has_errors = True

    if has_errors:
        raise Exception("Errors while materializing the assets")
    


@dg.asset(
    key=[ASSET_GROUP_LABS, ASSET_PREFIX_TRANSFORMED, "members"],
    group_name=ASSET_GROUP_LABS,
    ins={
        "members": dg.AssetIn(key=[ASSET_GROUP_LABS, ASSET_PREFIX_SOURCE,"members"])
    },
    io_manager_key="s3_test_io_manager"
)
def bookings_transformed_members(context: dg.AssetExecutionContext, members: DataFrame):

    raise NotImplementedError()

    return dg.Output(value=None)


# Complete the pipeline here ...