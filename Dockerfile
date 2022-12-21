FROM ubuntu:focal

RUN apt update
RUN apt install -y python3-pip

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
COPY app.py /app/app.py
COPY templates /app/templates

RUN mkdir -p /app/static/{js,css,data}
COPY static/css/main.css /app/static/css/main.css
COPY static/js/autocomplete.js /app/static/js/autocomplete.js
COPY static/js/clusters_graph.js /app/static/js/clusters_graph.js
COPY static/js/jquery-3.6.1.js /app/static/js/jquery-3.6.1.js
COPY static/js/read_text_file.js /app/static/js/read_text_file.js
COPY static/data/en/clusters_between.pickle /app/static/data/en/clusters_between.pickle
COPY static/data/en/clusters_report.pickle /app/static/data/en/clusters_report.pickle
COPY static/data/en/metrics_report.csv /app/static/data/en/metrics_report.csv
COPY static/data/en/raw_processed_ccoha1.txt /app/static/data/en/raw_processed_ccoha1.txt
COPY static/data/en/raw_processed_ccoha2.txt /app/static/data/en/raw_processed_ccoha2.txt






CMD ["python3", "app.py"]

EXPOSE 5000