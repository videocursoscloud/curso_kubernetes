docker run --name $APP_NAME -d -p $HOST_PORT:$CONTAINER_PORT $APP_NAME:$IMAGE_VERSION 

sleep ${TEST_GRACE_PERIOD}

curl localhost:$HOST_PORT
test_status=$?

docker rm -f ${APP_NAME}


return $test_status
