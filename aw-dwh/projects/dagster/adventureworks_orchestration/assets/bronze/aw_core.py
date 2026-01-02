import dagster as dg
from adventureworks_orchestration.resources.mysql_resource import MySQLResource
from adventureworks_orchestration.constants import *
from pyspark.sql import DataFrame
from typing import Iterator
from .setup import clean_bronze_layer


aw_core_tables = [
    "Address", "AddressType", "BillOfMaterials", "BusinessEntity", "BusinessEntityAddress",
    "BusinessEntityContact", "ContactType", "CountryRegion", "CountryRegionCurrency", "CreditCard",
    "Culture", "Currency", "CurrencyRate", "Customer", "EmailAddress", "Employee", "Illustration",
    "JobCandidate", "Location", "Password", "Person", "PersonCreditCard", "PersonPhone",
    "PhoneNumberType", "Product", "ProductCategory", "ProductCostHistory", "ProductDescription",
    "ProductInventory", "ProductListPriceHistory", "ProductModel", "ProductModelIllustration",
    "ProductModelProductDescriptionCulture", "ProductPhoto", "ProductProductPhoto",
    "ProductSubcategory", "ProductVendor", "PurchaseOrderDetail", "PurchaseOrderHeader",
    "SalesOrderDetail", "SalesOrderHeader", "SalesOrderHeaderSalesReason", "SalesPerson",
    "SalesPersonQuotaHistory", "SalesReason", "SalesTaxRate", "SalesTerritory",
    "SalesTerritoryHistory", "ScrapReason", "ShipMethod", "ShoppingCartItem", "SpecialOffer",
    "SpecialOfferProduct", "StateProvince", "Store", "TransactionHistory",
    "TransactionHistoryArchive", "UnitMeasure", "Vendor", "WorkOrder", "WorkOrderRouting"
]

def get_bronze_aw_core_table_asset(table: str):
    @dg.asset(
        ins={
            "source" : dg.AssetIn(key=[ASSET_GROUP_LANDING, AW_CORE_PREFIX, table.lower()]) 
        },
        io_manager_key="s3_iceberg_io_manager",
        deps=[clean_bronze_layer],
        key=[ASSET_GROUP_BRONZE, f"core_{table.lower()}"],
        group_name=ASSET_GROUP_BRONZE,
    )
    def _asset(context: dg.AssetExecutionContext, source: DataFrame):
        return dg.Output(value=source)

    return _asset

def get_bronze_aw_core_assets():
    return [get_bronze_aw_core_table_asset(table) for table in aw_core_tables]


ASSETS = get_bronze_aw_core_assets()