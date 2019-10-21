# Use an official Python runtime as a parent image
FROM raspbian/stretch:041518
MAINTAINER Sergio GQ <sergioalbertogq@gmail.com>

RUN apt-get update \
    && apt-get -y install python3 \
    python3-pip \
    python3-dev \
    python3-rpi.gpio

# Essentials: developer tools, build tools, OpenBLAS
RUN apt-get update && apt-get install -y --no-install-recommends \
   apt-utils libatlas-base-dev unzip

RUN apt-get install -y --no-install-recommends python3.5 python3.5-dev python3-tk && \
   pip3 install --no-cache-dir --upgrade pip setuptools && \
   echo "alias python='python3'" >> /root/.bash_aliases && \
   echo "alias pip='pip3'" >> /root/.bash_aliases

# Science libraries and other common packages 
RUN pip3 --no-cache-dir install numpy scipy sklearn scikit-image==0.13.1 pandas
RUN pip3 install --no-cache-dir --upgrade tensorflow

# Expose port for TensorBoard
EXPOSE 6006

RUN apt-get install -y zlib1g-dev libjpeg-dev \
   libopenjp2-7-dev libtiff5-dev libjasper-dev libpng12-dev

# Set the working directory to /app
WORKDIR /app

# Run the container launches
CMD ["/bin/bash"]

