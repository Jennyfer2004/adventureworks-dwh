import dagster as dg
from adventureworks_orchestration.resources.mysql_resource import MySQLResource
from adventureworks_orchestration.constants import *
from pyspark.sql import DataFrame
from .setup import clean_landing_zone

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

def get_landing_aw_core_table_asset(table: str):
    @dg.asset(
        io_manager_key="s3_csv_lake_io_manager",
        key=[ASSET_GROUP_LANDING, AW_CORE_PREFIX, table.lower()],
        group_name=ASSET_GROUP_LANDING,
        deps=[clean_landing_zone]
    )
    def _asset(context: dg.AssetExecutionContext, aw_core_mysql_rsc : MySQLResource) -> dg.Output[DataFrame]:
        df = aw_core_mysql_rsc.fetch_table(table)

        return dg.Output(value=df)

    return _asset

def get_bronze_aw_core_assets():
    return [get_landing_aw_core_table_asset(table) for table in aw_core_tables]


ASSETS = get_bronze_aw_core_assets()

