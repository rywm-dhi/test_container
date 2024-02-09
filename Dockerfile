FROM python:3.7-slim-buster

RUN pip install --upgrade pip ipython ipykernel
CMD python -m ipykernel_launcher -f $DOCKERNEL_CONNECTION_FILE