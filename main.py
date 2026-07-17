from fastapi import FastAPI
import time

app = FastAPI(title="Deployxa FastAPI Template")

@app.get("/")
def read_root():
    return {"message": "Deployxa FastAPI Template"}

@app.get("/health")
def health_check():
    return {"status": "healthy", "time": time.time()}
