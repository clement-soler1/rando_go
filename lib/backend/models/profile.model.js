const mongoose = require("mongoose");
const schema = mongoose.Schema;

const profileSchema = schema({
  firstname: { type: String, required: true },
  name: { type: String, required: true },
  photo: { type: String, required: true },
  phonenumber: { type: String, required: true },
  birthdate: { type: String, required: true },
});

const BirthDayApp = mongoose.model("profile", profileSchema);

module.exports = BirthDayApp;

