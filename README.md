# probable-broccoli

A tiny Express app used to test the Vibe Report Card GitHub App. `server.js` contains a deliberate SQL injection so the check run has something to report.

Try it: `npm install && npm start`, then open http://localhost:3000/veggie?name=broccoli

The `/veggie` route is vulnerable on purpose. Do not deploy this.

Check runs come from the Vibe Report Card GitHub App.

Fix pull requests: when the app knows how to fix a problem, it opens a PR.
