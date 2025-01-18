from spin_sdk.http import Request, Response
from spin_sdk import http

def fibonacci(number: int) -> int:
    match number:
        case 0:
            return 1
        case 1:
            return 1
        case _:
            return fibonacci(number-1) + fibonacci(number-2)


class IncomingHandler(http.IncomingHandler):
    def handle_request(self, request: Request) -> Response:
        number = int(request.uri[1:])
        body = f"{{\"Fibonacci on position {number}\":" + str(fibonacci(number)) + "}"
        return Response(
            200,
            {"content-type": "text/plain"},
            bytes(body, "utf-8")
        )
