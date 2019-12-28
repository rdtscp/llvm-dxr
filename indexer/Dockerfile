FROM dxr:latest

RUN apt-get update

# Copy the source.
COPY ./llvm-project /home/llvm-project/
RUN mkdir /home/llvm-project/build/

# Get dependencies.
RUN apt-get install -y \
  automake autotools-dev \
  bison cmake flex libedit-dev \
  libedit2 libpcre3 libpcre3-dev \
  pcregrep wget

RUN wget https://github.com/swig/swig/archive/rel-3.0.12.tar.gz \
  && tar -xzf rel-3.0.12.tar.gz \
  && cd swig-rel-3.0.12 \
  && ./autogen.sh \
  && ./configure \
  && make\
  && make install

# Copy the config.
COPY dxr.config /home/

# Index.
CMD /venv/bin/dxr index -c /home/dxr.config --verbose