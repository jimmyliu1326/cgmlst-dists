FROM mambaorg/micromamba:1-focal-cuda-11.7.1

RUN git clone https://github.com/jimmyliu1326/cgmlst-dists & \
    cd cgmlst-dists & \
    make & \
    make check & \
    make PREFIX=/usr/local install