from spin_sdk.http import Request, Response
from spin_sdk import http
import math

def is_prime(number: int):
    i = 2
    while i <= math.sqrt(number): 
        if number % i == 0:
            return False
        i+=1
    return True

def primes(number: int):
    return [x for x in range(1, number+1) if is_prime(x)]


class IncomingHandler(http.IncomingHandler):
    def handle_request(self, request: Request) -> Response:
        number = int(request.uri[1:])
        body = f"{{\"Primes till {number}\":" + str(primes(number)) + "}"
        return Response(
            200,
            {"content-type": "text/plain"},
            bytes(body, "utf-8")
        )
