"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const port = 3000;
const isPrime = (num) => {
    if (num <= 1)
        return false;
    for (let i = 2; i <= Math.sqrt(num); i++) {
        if (num % i === 0)
            return false;
    }
    return true;
};
const getPrimes = (max) => {
    const primes = [];
    for (let i = 2; i <= max; i++) {
        if (isPrime(i))
            primes.push(i);
    }
    return primes;
};
app.get('/primes/:max', (req, res) => {
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
