# Streaming Online Machine Learning Processing

This project applies a machine learning model against a rolling window of streaming time series data.

ingest accesses the data (currently via websocket) and publishes it to the event topic in RedPanda.

predict subscribes to the event topic and applies the machine learning model to the recent window.

label subscribes to the event topic, determines the appropriate label for each event in the series based on the events after it, and pushes this to the label topic.

train subscribes to the label topic and trains the machine learning model with the new data along with some previous data. It then stores the new data and updates previous loss and output data into a database.

The other projects provide shared code for the above four services.

This repository is a cargo workspace which uses git submodules for all the services for the project so it can all be developed easily together. The bin directory has some scripts to make it easier to push and pull changes for all submodules together.

# Running and working with the system

## Run infrastructure

### Locally

Running this script will start up dependent software such as redpanda and scylla:

```
./bin/run-deps.sh
```

### Deploy

TODO

## Run Services

