import express from "express";
import sqlite3 from "sqlite3";

const app = express();
const db = new sqlite3.Database(":memory:");

db.serialize(() => {
  db.run("CREATE TABLE veggies (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER)");
  db.run("INSERT INTO veggies (name, rating) VALUES ('broccoli', 9), ('kale', 6), ('celery', 3)");
});

app.get("/", (req, res) => res.send("Probably broccoli."));

// Test fixture for Vibe Report Card: this query is deliberately built by string
// concatenation so the scanner has a SQL injection to find.
app.get("/veggie", (req, res) => {
  db.all("SELECT * FROM veggies WHERE name = '" + req.query.name + "'", (err, rows) => {
    if (err) return res.status(500).send("query failed");
    res.json(rows);
  });
});

app.listen(3000, () => console.log("listening on :3000"));
