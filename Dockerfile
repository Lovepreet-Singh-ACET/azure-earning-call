FROM python:3.10

# Copy app code and set working directory
WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install -r requirements.txt

EXPOSE 80

# Run
ENTRYPOINT streamlit run app.py --server.port=80 --server.address=0.0.0.0