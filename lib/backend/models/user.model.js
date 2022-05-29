const mongoose = require("mongoose");
const schema = mongoose.Schema;

const userSchema = schema({
  firstname: { type: String, required: true },
  name: { type: String, required: true },
  email: { type: String, required: true },
  password: { type: String, required: true },
  phonenumber: { type: String, required: true },
  imagePath: { type: String, required: true },
});

const RandoGoUser = mongoose.model("user", userSchema);

module.exports = RandoGoUser;

