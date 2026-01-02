import pyspark.sql.functions as F
from pyspark.sql import DataFrame
from datetime import datetime
from dateutil.relativedelta import relativedelta

def transformed_members(input_df: DataFrame) -> DataFrame:
    raise NotImplementedError()

def transformed_bookings(members_df: DataFrame, bookings_df: DataFrame, facilities_df: DataFrame):
    raise NotImplementedError()

def report_facilities_monthly(spark, facilities_df: DataFrame, bookings_df: DataFrame):
    raise NotImplementedError()


def report_facilities_yearly(facilities_yearly_df: DataFrame):
    raise NotImplementedError()