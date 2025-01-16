use actix_web::{App, HttpResponse, HttpServer, Responder, get, web};

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

#[get("/{number}")]
async fn hello(path: web::Path<i32>) -> impl Responder {
    let number = path.into_inner();
    let body = format!(
        "{{\"Primes till {}\":[{}]}}",
        number,
        primes(number)
            .into_iter()
            .reduce(|acc, num| acc + ", " + &num)
            .unwrap_or(String::new())
            .as_str()
    );
    HttpResponse::Ok().body(body)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().service(hello))
        .bind(("0.0.0.0", 8080))?
        .run()
        .await
}
