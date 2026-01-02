until /usr/bin/mc alias set minio http://minio:9000 minio minio123; do
    echo '...waiting for minio...'
    sleep 1
done

/usr/bin/mc mb minio/warehouse || echo 'Bucket already exists'
/usr/bin/mc anonymous set public minio/warehouse --recursive --insecure

/usr/bin/mc mb minio/lake || echo 'Bucket already exists'
/usr/bin/mc anonymous set public minio/lake --recursive --insecure

/usr/bin/mc mb minio/test || echo 'Bucket already exists'
/usr/bin/mc anonymous set public minio/test --recursive --insecure

tail -f /dev/null