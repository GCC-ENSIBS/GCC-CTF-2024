FROM python:3.11-bullseye@sha256:3be0bf990f857e881647fb2954c5b4583926bb3ed5ae7a3fd6c79b53768d8893

ENV GECKODRIVER_VERSION=0.34.0
ENV MOZ_HEADLESS=1

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends cmake wget firefox-esr

RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v${GECKODRIVER_VERSION}/geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz && \
    tar -xvzf geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz && \
    mv geckodriver /usr/local/bin/ && \
    chmod +x /usr/local/bin/geckodriver && \
    rm geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz

COPY ./src /app/

# Install Pytorch / Hummingbird separately from Flask
RUN python3 -m pip install numpy && \
    python3 -m pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cpu && \
    python3 -m pip install hummingbird-ml && \
    python3 -m pip install -r requirements.txt

RUN useradd -m challenge && \
    chown -R challenge:challenge /app

USER challenge

EXPOSE 5000
CMD ["python3", "app.py"]