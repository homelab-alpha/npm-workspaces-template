const express = require("express");
const path = require("path");
const app = express();

app.use(express.static(path.join(__dirname, "../client/dist")));

app.get("/api/hello", (req, res) => {
  res.json({ message: "Hello from the server!" });
});

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "../client/dist/index.html"));
});

const PORT = process.env.PORT || 3210;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
