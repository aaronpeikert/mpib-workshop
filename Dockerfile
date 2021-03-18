# Generated by repro: do not edit by hand
# Please edit Dockerfiles in .repro/
FROM rocker/verse:4.0.4
ARG BUILD_DATE=2021-03-18
WORKDIR /home/rstudio
RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site
RUN apt-get update -y &&\
  apt-get install -y --no-install-recommends p7zip
RUN install2.r --error --skipinstalled \ 
  ggplot2
RUN installGithub.r \ 
  aaronpeikert/repro@adb5fa569