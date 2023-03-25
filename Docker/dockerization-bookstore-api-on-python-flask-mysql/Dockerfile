FROM python:alpine
RUN pip install flask
RUN pip install -r requirements.txt
COPY . /app
WORKDIR /app
EXPOSE 80
CMD python ./bookstore-api.py