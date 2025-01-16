use actix_web::{get, web, Responder, App, HttpResponse, HttpServer};


fn fib (n:i32) -> i128 {
    match n {
        0 => 1,
        1 => 1,
        n => fib(n-1) + fib(n-2)
    }
}


#[get("/{number}")]
async fn fibonacci(path: web::Path<i32>) -> impl Responder {
    let number = path.into_inner(); 
    let body:String = format!("{{\"fibonacci at postiion {}\":{}}}", number, fib(number));
    HttpResponse::Ok().body(body)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(fibonacci)
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
