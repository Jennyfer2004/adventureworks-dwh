from dagster_dbt import DagsterDbtTranslator
from collections.abc import Mapping
from typing import Any

import dagster as dg
from dagster_dbt.asset_utils import get_node


class CustomDagsterDbtTranslator(DagsterDbtTranslator):
    def get_asset_key(self, dbt_resource_props: Mapping[str, Any]) -> dg.AssetKey:
        return super().get_asset_key(dbt_resource_props).with_prefix(self.get_group_name(dbt_resource_props))

    def get_group_name(self, dbt_resource_props) -> Any:
        return dbt_resource_props["schema"]
    
    def get_asset_spec(self, manifest, unique_id, project) -> dg.AssetSpec:
        spec = super().get_asset_spec(manifest, unique_id, project)

        resource_props = get_node(manifest, unique_id)

        deps = [dg.AssetDep(s) for s in resource_props.get("sources", [])]

        return spec.merge_attributes(deps=deps)