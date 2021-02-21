# python_rabbitmq_producer_consumer
This is repo contains code to test rabbitmq by sending and receiving dummy data. It uses *`pika`* library to generate data.
The code is used from the default example from the official pika library github page and has been updated accordingly.

## Dependencies
 - Python 3
 - pika

## How to run producer
Export the following environment variables and run the *`producer.py`*. 
#### Environment variables.
 - RABBITMQ_HOST
 - RABBITMQ_PORT

The code will create the following if doesn't exist.

 1. exchange
 2. routing key
 3. queue

### Producer
```shell
$ python producer.py
2021-02-21 09:06:56,654 INFO __main__  277 : Published message # 1373
2021-02-21 09:06:56,654 INFO __main__  246 : Scheduling next message for 1.0 seconds
2021-02-21 09:06:56,654 INFO __main__  279 : Sent '{'name': 'CBISufsywuWCb89cK7C0khyw8f6FI0itsY7'}' host: `rabbitmq.devops.svc.cluster.local`
2021-02-21 09:06:56,655 INFO __main__  230 : Received ack for delivery tag: 1373
2021-02-21 09:06:56,655 INFO __main__  237 : Published 1373 messages, 0 have yet to be confirmed, 1373 were acked and 0 were nacked
2021-02-21 09:06:57,656 INFO __main__  277 : Published message # 1374
2021-02-21 09:06:57,656 INFO __main__  246 : Scheduling next message for 1.0 seconds
2021-02-21 09:06:57,656 INFO __main__  279 : Sent '{'name': 'cu9qh5JfD3irBkZxiTyLTRBpWtaTQWj0TPh'}' host: `rabbitmq.devops.svc.cluster.local`
2021-02-21 09:06:57,658 INFO __main__  230 : Received ack for delivery tag: 1374
2021-02-21 09:06:57,658 INFO __main__  237 : Published 1374 messages, 0 have yet to be confirmed, 1374 were acked and 0 were nacked
```

## How to run consumer
Export the following environment variables and run the *`consumer.py`*. 
#### Environment variables.
 - RABBITMQ_HOST
 - RABBITMQ_PORT

### Consumer
```shell
$ python consumer.py
2021-02-21 09:09:29,984 INFO __main__  284 : Acknowledging message 1697
2021-02-21 09:09:30,986 INFO __main__  275 : Received message # 1698 from python-mq-publisher: b'{"name": "mxxNLHIqptM7VVaM7FbF4DDvq584Bmn8OnH"}'
2021-02-21 09:09:30,986 INFO __main__  284 : Acknowledging message 1698
2021-02-21 09:09:31,988 INFO __main__  275 : Received message # 1699 from python-mq-publisher: b'{"name": "x59PIazZCGBjPX7cV7genBTbnVEs80wsL6x"}'
```

## Run it in docker
### Producer
```shell
docker run -d --name producer \
                -e "RABBITMQ_HOST=rabbitmq" \
                -e "RABBITMQ_PORT=5672" \
                amjad489/python_mq_send:1.0

```

### Consumer
```shell
docker run -d --name producer \
                -e "RABBITMQ_HOST=rabbitmq" \
                -e "RABBITMQ_PORT=5672" \
                amjad489/python_mq_reciever:1.0

```

## Deploy on Kubernetes
```shell
kubectl apply -f ./k8s/
```
