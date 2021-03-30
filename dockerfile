FROM rstudio/plumber
LABEL Christoph Mussenbrock <christoph@etherisc.com>, Matthias Zimmermann

RUN R -e "install.packages('rnoaa')"
RUN R -e "install.packages('plumber')"

CMD ["/app/main.R"]
