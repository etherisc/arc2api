FROM rstudio/plumber
MAINTAINER Christoph Mussenbrock <christoph@etherisc.com>

RUN R -e "install.packages('rnoaa')"
RUN R -e "install.packages('plumber')"


CMD ["/app/arc2api.R"]
