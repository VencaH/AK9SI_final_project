from spin_sdk.http import Request, Response
from spin_sdk import http

class IncomingHandler(http.IncomingHandler):
    def handle_request(self, request: Request) -> Response:
        return Response(
            200,
            {"content-type": "text/plain"},
            bytes("Hello, world!", "utf-8")
        )
