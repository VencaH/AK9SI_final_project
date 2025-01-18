from fastapi import FastAPI

app = FastAPI()

def fibbonachi(n: int) -> int:
    match n:
        case 0:
            return 1
        case 1:
            return 1
        case _:
            return fibbonachi(n-1) + fibbonachi(n-2)

@app.get("/{number}")
def get_response(number: int):
    return {f"Fibonacci on position {number}": fibbonachi(number)}

    

