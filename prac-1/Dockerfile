FROM python:3.10.6
WORKDIR /app
COPY requierements.txt . 
RUN pip install --no-cache-dir -r requierements.txt
COPY . .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]