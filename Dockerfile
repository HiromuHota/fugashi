FROM quay.io/pypa/manylinux1_x86_64
ENV PATH /root/.local/bin:/opt/python/cp36-cp36m/bin:/opt/python/cp37-cp37m/bin:/opt/python/cp38-cp38/bin:/opt/rh/devtoolset-2/root/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/python/cp35-cp35m/bin:/opt/python/cp36-cp36m/bin:/opt/python/cp37-cp37m/bin:/opt/python/cp38-cp38/bin

RUN git clone https://github.com/taku910/mecab.git && \
    cd mecab/mecab && \
    ./configure --enable-utf8-only && \
    make && \
    make install && \
    curl https://unidic.ninjal.ac.jp/unidic_archive/cwj/2.1.2/unidic-mecab-2.1.2_src.zip --output /tmp/unidic.zip && \
    cd /tmp && unzip unidic.zip && cd unidic-mecab-2.1.2_src/ && ./configure && make && make install && \
    sed -i -e "s/ipadic/unidic/g" /usr/local/etc/mecabrc
