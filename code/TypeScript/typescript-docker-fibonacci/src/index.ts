import express from 'express';

const app = express();
const port = 3000;

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

app.get('/fibonacci/:max', (req: any, res: any) => {
  const max = parseInt(req.params.max, 10);
  if (isNaN(max)) {
    return res.status(400).send('Invalid number');
  }
  const sequence = getFibonacciSequence(max);
  res.json(sequence);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
