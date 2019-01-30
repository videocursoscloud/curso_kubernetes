docker run --name $APP_NAME -d -p $PORT:$PORT $APP_NAME:$IMAGE_VERSION 

sleep ${TEST_GRACE_PERIOD}

curl localhost:$PORT
test_status=$?

docker rm -f ${APP_NAME}


return $test_status
