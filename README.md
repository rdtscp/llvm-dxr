# llvm-dxr

Docker Solution for using the DXR Source Indexer for the LLVM code base.

## Dependencies

-   <https://github.com/rdtscp/dxr>
-   <https://github.com/llvm/llvm-project>

## Local Usage

```
git clone https://github.com/rdtscp/llvm-dxr.git --recursive
cd ./llvm-dxr/
docker build -f "dxr/Dockerfile" -t dxr:latest dxr
docker-compose -f "docker-compose.yml" up --build 
open http://localhost:8000

```

## Notes

-   Look into possibility of having some "persistent" storage (but still containerised) for the `llvm` source/build to reduce re-indexing/re-building times.
