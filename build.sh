if [ "$1" == "" ];
then
  echo "ERROR: version number required to build."
  exit
fi
TAG=$1
docker build -t python_mq_reciever:$TAG -f consumer_dockerfile .;
docker tag python_mq_reciever:$TAG amjad489/python_mq_reciever:$TAG;
docker tag python_mq_reciever:$TAG amjad489/python_mq_reciever:latest;
docker push amjad489/python_mq_reciever:$TAG;
docker push amjad489/python_mq_reciever:latest;
docker build -t python_mq_send:$TAG -f producer_dockerfile .;
docker tag python_mq_send:$TAG amjad489/python_mq_send:$TAG;
docker tag python_mq_send:$TAG amjad489/python_mq_send:latest;
docker push amjad489/python_mq_send:$TAG
docker push amjad489/python_mq_send:latest