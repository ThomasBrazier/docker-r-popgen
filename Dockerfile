FROM debian:10
# RUN POPULATION GENOMICS ANALYSES WITH DOCKER
MAINTAINER Thomas Brazier <thomas.brazier@univ-rennes1.fr>

RUN apt-get update -yq \
&& apt-get install apt-utils r-base r-base-dev -yq \
&& apt-get install libhts-dev vcftools samtools -yq \
&& apt-get install libssl-dev libxml2-dev pandoc pandoc-citeproc libblas-dev liblapack-dev git qpdf libxt6 libgdal-dev -yq \
&& apt-get install r-bioc-* -yq \
&& apt-get install r-cran-dplyr r-cran-purrr r-cran-ggplot2 -yq \
&& apt-get install r-cran-ade4 r-cran-adegenet r-cran-adegraphics r-cran-adephylo r-cran-units r-cran-igraph r-cran-rmarkdown -yq \
&& apt-get install r-cran-ape r-cran-seqinr r-cran-pbmcapply r-cran-devtools -yq \
&& apt-get clean -y

RUN R -e "install.packages('BiocManager')"
RUN R -e "devtools::install_github('mhahsler/rBLAST')"
RUN R -e "BiocManager::install('Biostrings')"
RUN R -e "install.packages('vcfR')"
RUN R -e "install.packages('poppr')"
RUN R -e "install.packages('MASS')"
RUN R -e "install.packages('gdata')"
RUN R -e "install.packages('taxize')"
RUN R -e "install.packages('taxizedb')"
RUN R -e "install.packages('rentrez')"
