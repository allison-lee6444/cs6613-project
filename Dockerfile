FROM tverous/pytorch-notebook:latest
USER root

RUN rm -rf /app
RUN cd /app
WORKDIR /app
VOLUME /app

COPY requirements.txt /app
COPY Milestones1_2.ipynb /app
COPY Milestone3_Finetuning_sidewalks.ipynb /app

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/NewYork
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 pip gdal-bin python3-tk -y
RUN pip install -r requirements.txt
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


EXPOSE 8888


