FROM dxr:latest

RUN apt-get update

# Get dependencies.
RUN apt-get install -y \
  automake autotools-dev \
  bison cmake flex git libedit-dev \
  libedit2 libpcre3 libpcre3-dev \
  pcregrep wget

RUN wget https://github.com/swig/swig/archive/rel-3.0.12.tar.gz \
  && tar -xzf rel-3.0.12.tar.gz \
  && cd swig-rel-3.0.12 \
  && ./autogen.sh \
  && ./configure \
  && make\
  && make install

COPY ./get_source.sh /home/

# Index.
CMD cp /config/dxr.config /home/ \
  && bash /home/get_source.sh \
  && sleep 15s \
  && /venv/bin/dxr index -c /home/dxr.config --verbose