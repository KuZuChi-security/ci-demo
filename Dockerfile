FROM python:3.12-slim
WORKDIR /app
RUN useradd --uid 10001 --no-create-home --shell /usr/sbin/nologin appuser
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
ARG GIT_COMMIT=unset
ARG BUILD_NUMBER=unset
ENV GIT_COMMIT=$GIT_COMMIT BUILD_NUMBER=$BUILD_NUMBER
USER 10001
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
