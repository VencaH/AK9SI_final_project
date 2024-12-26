from fastapi import FastAPI

app = FastAPI()

def fibbonachi(n:int) -> int:
    match n:
        case 0:
            return 1
        case 1:
            return 1
        case _:
            return fibbonachi(n-1) + fibbonachi(n-2)

@app.get("/")
def get_response():
    return {"40th number of fibbonachi": fibbonachi(40)}

    

