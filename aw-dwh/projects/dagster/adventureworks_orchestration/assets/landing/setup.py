import dagster as dg
from adventureworks_orchestration.constants import *
from dagster_aws.s3 import S3Resource
from adventureworks_orchestration.utils.s3 import clean_prefix


@dg.asset(
    key=[ASSET_GROUP_LANDING, SETUP_PREFIX, "clean"], 
    group_name=ASSET_GROUP_LANDING
)
def clean_landing_zone(s3_rsc: S3Resource):

    s3 = s3_rsc.get_client()

    result = clean_prefix(s3, "lake", ASSET_GROUP_LANDING)

    return dg.MaterializeResult(asset_key=[ASSET_GROUP_LANDING, SETUP_PREFIX, "clean"], metadata={"deleted": result})
   