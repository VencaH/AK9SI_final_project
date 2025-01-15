/*import { ResponseBuilder } from "@fermyon/spin-sdk";

export async function handler(req: Request, res: ResponseBuilder) {
    console.log(req);
    res.send("hello universe");
}*/
import { ResponseBuilder } from "@fermyon/spin-sdk";

// funkce pro výpočet Fibonacciho posloupnosti
const fibonacci = (n: number): number => {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
};

const getFibonacciSequence = (max: number): number[] => {
  const sequence = [];
  for (let i = 0; i <= max; i++) {
    sequence.push(fibonacci(i));
  }
  return sequence;
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

  const sequence = getFibonacciSequence(max);
     res.send(JSON.stringify(sequence));
}
