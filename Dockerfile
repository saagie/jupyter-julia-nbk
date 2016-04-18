FROM jupyter/notebook

MAINTAINER Saagie

# Julia Installation
RUN apt-get update && apt-get install --no-install-recommends software-properties-common python-software-properties libx11-dev libpng3 gettext tcl8.5 libpango1.0-0 tk8.5 hdf5-tools -y && \
    add-apt-repository ppa:staticfloat/julianightlies && \
    add-apt-repository ppa:staticfloat/julia-deps && \
    apt-get update && \
    apt-get install -y julia libnettle4 && \
    rm -rf /tmp/downloaded_packages/ /tmp/*.rds /var/tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Have root install julia packages globally. I found this directory by
# looking at `LOAD_PATH` from within a julia session
ENV JULIA_PKGDIR /usr/local/share/julia/site

# Julia package Installation (should be global)
RUN julia -e 'Pkg.init(); Pkg.add("IJulia")' && \
    julia -e 'Pkg.add("Gadfly"); Pkg.add("RDatasets"); Pkg.add("ForwardDiff")' && \
    julia -e 'Pkg.add("Distributions"); Pkg.add("NLsolve"); Pkg.add("Interact")' && \
    julia -e 'Pkg.add("PyCall"); Pkg.add("PyPlot"); Pkg.add("Pandas"); Pkg.add("Winston")' && \
	julia -e 'Pkg.add("QuantEcon"); Pkg.add("Mongo"); Pkg.add("Hive");'

# check out ZMQ and IJulia to get them working
RUN julia -e 'Pkg.checkout("ZMQ"); Pkg.checkout("IJulia");'

CMD jupyter notebook \
    --ip=* \
    --MappingKernelManager.time_to_dead=10 \
    --MappingKernelManager.first_beat=3 \
    --notebook-dir=/notebooks-dir/
