use std::collections::HashMap;

use spin_sdk::http::{HeaderValue, IntoResponse, Request, Response};
use spin_sdk::http_component;

fn is_prime(number: &i32) -> bool {
    let mut i = 2;
    while (i as f32) <= (*number as f32).sqrt() {
        if number % i == 0 {
            return false;
        }
        i+=1;
    }
    true
    }

fn primes(number: i32) -> Vec<String> {
    (1..=number)
        .into_iter()
        .filter(|x| is_prime(x))
        .map(|x| x.to_string())
        .collect()
}

/// A simple Spin HTTP component.
#[http_component]
fn handle_primes(req: Request) -> anyhow::Result<impl IntoResponse> {
    println!("Handling request to {:?}", req.header("spin-full-url"));
    let number = req.headers().collect::<HashMap<&str, &HeaderValue>>()
        .get("spin-path-info").expect("Could not get path info")
        .as_str().expect("Could not get path info")
        .replace("/","")
        .parse::<i32>()?;
    let body = format!("{{\"Primes till {}\":[{}]}}",
        number, 
        primes(number)
            .into_iter()
            .reduce(|acc, num| format!("{}, {}",acc,num))
            .unwrap_or(String::new())
            .as_str()
    );
     Ok(Response::builder()
        .status(200)
        .header("content-type", "text/plain")
        .body(body)
        .build())
}
