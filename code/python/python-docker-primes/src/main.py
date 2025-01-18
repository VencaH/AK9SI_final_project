from fastapi import FastAPI
import math

app = FastAPI()

def is_prime(number: int):
    i = 2
    while i <= math.sqrt(number): 
        if number % i == 0:
            return False
        i+=1
    return True

def primes(number: int):
    return [x for x in range(1, number+1) if is_prime(x)]

@app.get("/{number}")
def get_response(number: int):
    return {f"Prime numbers till {number}": primes(number)}

    

