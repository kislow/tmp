// tests/load/k6-spike.js
import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
  stages: [
    { duration: '30s', target: 50 },
    { duration: '1m', target: 500 },
    { duration: '1m', target: 0 },
  ],
};

export default function () {
  http.get('https://staging.emirates-platform.example.com/api/booking');
  sleep(1);
}
