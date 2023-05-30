FROM rocker/verse:latest

RUN Rscript -e "install.packages(c('devtools', 'githubinstall', 'dbplyr', 'RSQLite'));"
RUN R -e "devtools::install_github('acorg/Racmacs')"
