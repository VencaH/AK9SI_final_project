import express from 'express';

const app = express();
const port = 3000;

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

app.get('/primes/:max', (req: any, res: any) => {  // Změna typů na 'any'
  const max = parseInt(req.params.max, 10);
  if (isNaN(max)) {
    return res.status(400).send('Invalid number');
  }
  const primes = getPrimes(max);
  res.json(primes);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
