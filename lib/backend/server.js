const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();
const path = require("path");
const User = require("./models/user.model");

app.use(cors());
mongoose.set("debug", true);
mongoose
  .connect(
    "mongodb+srv://root:toor@randogo-bdd.c1mzk.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true
    }
  )
  .then(() => console.log("connexion ok !"));

app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());


app.get("/api/users", async (req, res) => {
  try {
    const users = await User.find({}).exec();
    res.json(profiles);
  } catch (e) {
    res.status(500).json(e);
  }
});

/*app.post("/api/profiles", async (req, res) => {
  try {
    const body = req.body;
    const profile = await new Profile(body).save();
    res.json(trip);
  } catch (e) {
    res.status(500).json(e);
  }
});*/



app.listen(80);
