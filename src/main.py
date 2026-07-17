from fastapi import FastAPI
app = FastAPI()
@app.get("/health")
def health():
    return {"status": "ok"}
@app.get("/")
def read_root():
    return {"message": "Deployxa FastAPI Template"}
