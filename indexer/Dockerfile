FROM dxr:latest

# Copy the config.
COPY dxr.config /home/

# Copy the source.
COPY ./llvm-project /home/llvm-project/
RUN mkdir /home/llvm-project/build/

# Get dependencies.
RUN apt-get install cmake3 -y

# Index.
CMD /home/dxr/venv/bin/dxr index -c /home/dxr.config 