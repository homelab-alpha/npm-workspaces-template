const express = require("express");
const path = require("path");
const rateLimit = require("express-rate-limit");

const app = express();

const staticFileLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: "Too many requests, please try again after 15 minutes.",
  standardHeaders: true,
  legacyHeaders: false,
});

app.use(express.static(path.join(__dirname, "../client/dist")));

app.get("/api/hello", (req, res) => {
  res.json({ message: "Hello from the server!" });
});

app.get("*", staticFileLimiter, (req, res) => {
  res.sendFile(path.join(__dirname, "../client/dist/index.html"));
});

const PORT = process.env.PORT || 3210;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
