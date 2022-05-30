const mongoose = require("mongoose");
const User = require("./models/user.model");
const Rando = require("./models/rando.model");
const Point = require("./models/point.model");

// Pour utiliser les images depuis le backend
// photo: 'http://localhost/assets/images/olivia.jpg',

mongoose
  .connect(
    "mongodb+srv://root:toor@randogo-bdd.c1mzk.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true
    }
  )
  .then(() => {
    Promise.all([
      /*new User({
        firstname: 'User',
        name: 'User',
        email: 'user@user.com',
        password: 'n2ljh+eDPnvSuGOIIAVn1/Sv/ocw96yM',//equivalent : user
        phonenumber: '0601020304',
        imagePath: 'path',
      }).save(),*/

      new Rando({
        id: 0,
        name: "Visite de l'univ",
        creator: "user@user.com"
      }).save(),

      new Point({
        rando_id: 0,
        number: 1,
        icon: "",
        lat: 43.137304,
        long: 6.020865,
        direction: "Point de départ"
      }).save(),

      new Point({
          rando_id: 0,
          number: 2,
          icon: "",
          lat: 43.136833,
          long: 6.018927,
          direction: "Tout droit"
       }).save(),

    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
