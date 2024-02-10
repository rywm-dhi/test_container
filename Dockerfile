FROM python:3.12-bullseyeFROM python:3.10-slim

RUN pip install --upgrade pip
RUN pip install numpy pandas ipykernel matplotlib

WORKDIR /tmp
ADD start_kernel.sh .

CMD bash /tmp/start_kernel.sh
