import json

def clean_prefix(s3, bucket_name: str, prefix: str):
    response = s3.list_objects(Bucket=bucket_name, Prefix=prefix)

    # delete each object (or you can batch-delete if you want more efficiency)
    objects = response.get("Contents")

    if not objects:
        return 0

    deleted_count = 0
    for obj in objects:
        s3.delete_object(Bucket=bucket_name, Key=obj["Key"])
        deleted_count += 1

    return deleted_count