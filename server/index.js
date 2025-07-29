// Import the 'config' function from 'dotenv' to load environment variables.
import { config } from "dotenv";
config(); // Call the config function to load environment variables

// Import necessary modules using ES module syntax.
import cors from "cors";
import express from "express";
import rateLimit from "express-rate-limit";

const app = express();

// Enable Cross-Origin Resource Sharing for all origins.
app.use(cors());

// Configure a rate limiter to prevent abuse.
// Allows 100 requests per 15 minutes per IP address.
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  message: "Too many requests, please try again after 15 minutes.",
  standardHeaders: true,
  legacyHeaders: false,
});

// Apply the rate limiter to all incoming requests.
app.use(limiter);

// Define a GET route for '/api/hello' that returns a JSON message.
app.get("/api/hello", (req, res) => {
  res.json({ message: "Hello from the server!" });
});

// Set the port for the server, using the environment variable PORT or default to 3210.
const PORT = process.env.PORT || 3210;

// Start the server and listen on the specified port.
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
