import dagster as dg
from dagster_dbt import DbtCliResource, dbt_assets
from ...project import dbt_silver_project
from adventureworks_orchestration.resources.dagster_dbt_translator import CustomDagsterDbtTranslator


@dbt_assets(
    manifest=dbt_silver_project.manifest_path,
    dagster_dbt_translator=CustomDagsterDbtTranslator(),
)
def silver_assets(context: dg.AssetExecutionContext, dbt_silver_rsc: DbtCliResource):
    yield from dbt_silver_rsc.cli(["build"], context=context).stream()
