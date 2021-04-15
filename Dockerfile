FROM nvidia/cuda:11.2.2-devel-ubuntu20.04

RUN apt-get update && apt-get -y install git cmake g++ libdbus-1-dev && \
    git clone https://github.com/ethereum-mining/ethminer.git && \
    cd ethminer && git submodule update --init --recursive && \
    mkdir build && cd build && \
    cmake .. -DETHASHCL=OFF -DETHASHCUDA=ON -DAPICORE=ON && \
    make -j$(nproc) && make install && \
    cd / && rm -rf ethminer && \
    apt-mark manual libdbus-1-3 && \
    apt-get -y remove --purge git cmake g++ libdbus-1-dev && \
    apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/local/bin/ethminer" ]
