# Experiments in Elasticsearch
This repo requires the docker 1.9 tools, and serves as the simple tech basis
for the talk

## Usage
run `script/init` from the command line. This will
* build the docker images and link them
* start the elasticsearch container for you
* pull down the lottery data from NY state
* bulk put the dataset to elasticsearch
* prints the url and index information for use in ...

## Sense
This is a plugin made by the elasticsearch team for google chrome. It allows you
to quickly iterate queries over your documents. Here is
[The chrome extension](https://chrome.google.com/webstore/detail/sense-beta/lhjgkmllcaadmopgmanpapmpjgmfcfig?hl=en-US&utm_source=chrome-ntp-launcher)

## Curl
An example curl command would be:

```bash
$ curl -XPOST <docker-machine ip [name]>:9200/lottery -d '{"query" : { "match_all" : {} } }'
```
