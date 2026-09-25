# probable-broccoli

A tiny Express app used to test the Vibe Report Card GitHub App: grades, checks, and fix pull requests.

Try it: `npm install && npm start`, then open http://localhost:3000/veggie?name=broccoli

The `/veggie` route is vulnerable on purpose. Do not deploy this.

Check runs come from the Vibe Report Card GitHub App.

Fix pull requests: when the app knows how to fix a problem, it opens a PR.

Checks say what each push added or fixed.
