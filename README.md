# llvm-dxr
Use with Heroku to deploy a DXR Source Indexer for LLVM code base.

## Dependencies
 - https://github.com/rdtscp/dxr
 - https://github.com/llvm/llvm-project

## Local Usage
```
# Build DXR
git clone https://github.com/rdtscp/dxr.git
docker build ./dxr/ -t dxr:latest

# Obtain LLVM and Docker Files for Deploying DXR
git clone https://github.com/rdtscp/llvm-dxr.git
cd ./llvm-dxr/
git submodule update --init --recursive

# Build Elastic Search
docker build elasticsearch/ -t elasticsearch:1.7
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker run --rm -d -p 9200:9200/tcp -p 9300:9300/tcp elasticsearch:1.7)
# The above will output the IP address of the ES container, make sure that IP address is the IP address in frontend/dxr.config and indexer/dxr.config

# Build Front End
docker build frontend/ -t llvm_dxr_web:latest
docker run --rm -d -p 8000:8000 llvm_dxr_web:latest

# Build Indexer
docker build indexer/ -t llvm_dxr_indexer:latest

# Start Indexing
docker run --rm llvm_dxr_indexer:latest

```

## TODO
 - Have the indexer pull llvm source itself instead of using git submodules.
 - Have the web server use WSGI with Apache, which [the docs](https://dxr.readthedocs.io/en/latest/deployment.html#serving-your-index) state is better for production use-cases.
 - Use a single `dxr.config` file to avoid duplicating information. (May need to use docker-compose)
 - Have the indexer/web containers know how to contact the ES container(s). (May need to use docker-compose)
