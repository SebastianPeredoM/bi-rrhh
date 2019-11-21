const express = require("express");
const path = require("path");

const app = express();
const port = process.env.PORT || "3000";

app.get("/", (req, res) => {
    console.log('Aloojaa');
    res.status(200).send("WHATABYTE: Food For Devs");
});

app.listen(port, () => {
    console.log(`Listening to requests on http://localhost:${port}`);
});