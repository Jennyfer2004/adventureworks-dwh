
def clean_schema(spark, schema):
    if spark.catalog.databaseExists(schema):

        for t in spark.catalog.listTables(schema):
            print(f"Drop table with name {t}")
            spark.sql(f"DROP TABLE IF EXISTS {schema}.{t.name}")

        print(f"Drop database with name {schema}")
        spark.sql(f"DROP DATABASE {schema}")

    print(f"Create database with name {schema}")
    spark.sql(f"CREATE DATABASE {schema}")