FROM tverous/pytorch-notebook:latest
USER root

RUN rm -rf /app
RUN cd /app
WORKDIR /app
VOLUME /app

COPY requirements.txt /app
COPY SAM_Fintuning_for_Remote_Sensing.ipynb /app

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 pip -y
RUN pip install -r requirements.txt
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


EXPOSE 8888


