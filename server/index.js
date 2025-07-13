// ./server/index.js
const express = require("express");
const path = require("path");
const rateLimit = require("express-rate-limit");

const app = express();

/**
 * Configure rate limiting for static file requests to prevent abuse.
 * - `windowMs`: Time frame for requests (15 minutes).
 * - `max`: Maximum number of requests allowed within the window (100 requests).
 * - `message`: Message returned to the client when the limit is exceeded.
 * - `standardHeaders`: Enables standard `RateLimit-*` headers.
 * - `legacyHeaders`: Disables `X-RateLimit-*` headers for better security.
 */
const staticFileLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: "Too many requests, please try again after 15 minutes.",
  standardHeaders: true,
  legacyHeaders: false,
});

// Serve static files from the client's build directory.
app.use(express.static(path.join(__dirname, "../client/dist")));

// API endpoint for a simple "Hello" message.
app.get("/api/hello", (req, res) => {
  res.json({ message: "Hello from the server!" });
});

// Catch-all route to serve the client's `index.html` for all other requests.
// This route is protected by the `staticFileLimiter` to prevent excessive requests.
app.get("*", staticFileLimiter, (req, res) => {
  res.sendFile(path.join(__dirname, "../client/dist/index.html"));
});

// Define the port for the server, defaulting to 3210.
const PORT = process.env.PORT || 3210;

// Start the server and log the port it's running on.
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
