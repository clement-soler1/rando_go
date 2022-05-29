const mongoose = require("mongoose");
const Profile = require("./models/profile.model");

// Pour utiliser les images depuis le backend
// photo: 'http://localhost/assets/images/olivia.jpg',

mongoose
  .connect(
    "mongodb+srv://root:root@cluster0.yrapf.mongodb.net/BirthdaysApp?retryWrites=true&w=majority",
    {
      useNewUrlParser: true
    }
  )
  .then(() => {
    Promise.all([
      new Profile({
        firstname: 'Olivia',
        name: 'Katam',
        photo: 'img/olivia.jpg',
        phonenumber: '0601020304',
        birthdate: '1987-03-14',
      }).save(),
      new Profile({
        firstname: 'David',
        name: 'Meyer',
        photo: 'img/david.jpg',
        phonenumber: '0645020304',
        birthdate: '1976-02-01'
      }).save(),
      new Profile({
        firstname: 'Tom',
        name: 'Mori',
        photo: 'img/tom.jpg',
        phonenumber: '0607820304',
        birthdate: '2012-02-02'
      }).save(),
      new Profile({
        firstname: 'Inès',
        name: ' ',
        photo: 'img/ines.jpg',
        phonenumber: '0601020318',
        birthdate: '1995-03-09'
      }).save(),
      new Profile({
        firstname: 'Marcus',
        name: 'G.',
        photo: 'img/marcus.jpg',
        phonenumber: '0601056318',
        birthdate: '1997-07-05'
      }).save(),
      
    ]).then(res => {
      console.log("data installed");
      mongoose.connection.close();
    });
  });
