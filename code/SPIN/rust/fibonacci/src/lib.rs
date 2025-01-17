use spin_sdk::http::{HeaderValue, IntoResponse, Request, Response};
use spin_sdk::http_component;
use std::collections::HashMap;

fn fibonacci(number:i32) ->i128 {
    match number {
        0 => 1,
        1 => 1,
        n => fibonacci(n-1) + fibonacci(n-2)
    }
}


/// A simple Spin HTTP component.
#[http_component]
fn handle_fibonacci(req: Request) -> anyhow::Result<impl IntoResponse> {
    println!("Handling request to {:?}", req.header("spin-full-url"));
    let number = req.headers().collect::<HashMap<&str, &HeaderValue>>()
        .get("spin-path-info").expect("Could not get path info")
        .as_str().expect("Could not get path info")
        .replace("/","")
        .parse::<i32>()?;
    let body = format!("{{\"fibonacci of {}\": {}}}", number, fibonacci(number));
    Ok(Response::builder()
        .status(200)
        .header("content-type", "text/plain")
        .body(body)
        .build())
}
