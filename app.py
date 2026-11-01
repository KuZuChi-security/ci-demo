import os
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
    return "Web server live and ready"

@app.get("/version")
def version():
    return {
        "commit": os.environ.get("GIT_COMMIT", "unset"),
        "build":  os.environ.get("BUILD_NUMBER", "unset"),
    }
