# Use an official Python runtime as a parent image
FROM continuumio/anaconda3

RUN apt-get update && apt-get -y install unzip wget default-jre && apt-get clean
RUN wget https://github.com/boecker-lab/sirius/releases/download/v4.9.12/sirius-4.9.12-linux64-headless.zip && cd /usr/local/ && unzip /sirius-4.9.12-linux64-headless.zip && rm /sirius-4.9.12-linux64-headless.zip
RUN echo "export PATH=$PATH:/usr/local/sirius/bin" >> /etc/bash.bashrc
COPY maw.yml .
RUN conda env create --file maw.yml && rm maw.yml
SHELL ["conda", "run", "-n", "mawRpy", "/bin/bash", "-c"]
RUN pip install pybatchclassyfire
RUN R -e "BiocManager::install(\"MsBackendMsp\")"
COPY install_packages.R .
RUN Rscript install_packages.R
#COPY MetFrag2.4.5-CL.jar /opt/maw
# Set the working directory to /home
WORKDIR /opt/workdir
