FROM python:3.11

RUN mkdir /deploy

WORKDIR /deploy

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]

