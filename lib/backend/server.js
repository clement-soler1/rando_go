const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const app = express();
const path = require("path");
const User = require("./models/user.model");
const Rando = require("./models/rando.model");
const Point = require("./models/point.model");

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


//API : Users
app.get("/api/users", async (req, res) => {
  try {
    const users = await User.find({}).exec();
    res.json(users);
  } catch (e) {
    res.status(500).json(e);
  }
});

app.post("/api/create_user", async (req, res) => {
    try {
        const body = req.body;
        const profile = await new User(body).save();
        res.json(profile);
    } catch (e) {
        res.status(500).json(e);
    }
});

//API : Randos
app.get("/api/randos", async (req, res) => {
  try {
    const randos = await Rando.find({}).exec();
    res.json(randos);
  } catch (e) {
    res.status(500).json(e);
  }
});

app.get("/api/rando_available_id", async (req, res) => {
  try {
    const randos = await Rando.find({}).exec();
    var av_nb = randos.map(r => r.id);
    res.json(Math.max(...av_nb) + 1);
  } catch (e) {
    res.status(500).json(e);
  }
});

app.post("/api/create_rando", async (req, res) => {
    try {
        const body = req.body;
        const profile = await new Rando(body).save();
        res.json(profile);
    } catch (e) {
        res.status(500).json(e);
    }
});

//API : Points
app.get("/api/getRandoPoints", async (req, res) => {
  try {
    const points = await Point.find({}).exec();
    res.json(points);
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
