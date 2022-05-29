const mongoose = require("mongoose");
const User = require("./models/user.model");

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
      new User({
        firstname: 'User',
        name: 'User',
        email: 'user@user.com',
        password: 'cryptedpwd',
        phonenumber: '0601020304',
        imagePath: 'path',
      }).save(),

    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
