from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def get_response():
    return {"Greeting": "Hello, World"}
    

