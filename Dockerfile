FROM	continuumio/miniconda3

LABEL	maintainer="Stefano Ghignone, IPSP-CNR, Turin, Italy, stefano.ghignone[at]ipsp.cnr.it"
LABEL	name="samtools"
LABEL	description="Tools for manipulating next-generation sequencing data"
LABEL	version="1.10" 

RUN	apt update && apt install -y procps && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN	conda update -n base -c defaults conda
RUN	conda config --add channels conda-forge && \
	conda config --add channels bioconda && \
	conda config --add channels default
	
	#INSTALL SOFTWARE
RUN	conda install -c bioconda bcftools samtools && conda clean -a

WORKDIR	/scratch
