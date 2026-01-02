from pathlib import Path

from dagster_dbt import DbtProject

DBT_SILVER_PROJECT_DIR = Path(__file__).joinpath("..", "..", "..", "dbt", "silver").resolve()
DBT_GOLD_PROJECT_DIR = Path(__file__).joinpath("..", "..", "..", "dbt", "gold").resolve()

dbt_silver_project = DbtProject(
    project_dir=DBT_SILVER_PROJECT_DIR,
)

dbt_gold_project = DbtProject(
    project_dir=DBT_GOLD_PROJECT_DIR
)
