import { ResponseBuilder } from "@fermyon/spin-sdk";

// funkce pro výpočet prvočísel
const isPrime = (num: number): boolean => {
  if (num <= 1) return false;
  for (let i = 2; i <= Math.sqrt(num); i++) {
    if (num % i === 0) return false;
  }
  return true;
};

const getPrimes = (max: number): number[] => {
  const primes = [];
  for (let i = 2; i <= max; i++) {
    if (isPrime(i)) primes.push(i);
  }
  return primes;
};

export async function handler(req: Request, res: ResponseBuilder) {
  console.log(req);

  const url = new URL(req.url);
  const maxParam = url.searchParams.get("max");
  const max = parseInt(maxParam || "0", 10);

  if (isNaN(max)) {
    res.status(400).send("Invalid number");
    return;
  }

  const primes = getPrimes(max);
  //res.withHeader("Content-Type", "application/json")
  res.send(JSON.stringify(primes));
}
