import dagster as dg
from dagster_dbt import DbtCliResource, dbt_assets
from ...project import dbt_gold_project
from adventureworks_orchestration.resources.dagster_dbt_translator import CustomDagsterDbtTranslator


@dbt_assets(
    manifest=dbt_gold_project.manifest_path,
    dagster_dbt_translator=CustomDagsterDbtTranslator(),
)
def gold_assets(context: dg.AssetExecutionContext, dbt_gold_rsc: DbtCliResource):
    yield from dbt_gold_rsc.cli(["build"], context=context).stream()
