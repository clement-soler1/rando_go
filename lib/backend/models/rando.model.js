const mongoose = require("mongoose");
const schema = mongoose.Schema;

const randoSchema = schema({
  id: { type: Number, required: true },
  name: { type: String, required: true },
  creator: { type: String, required: true },
});

const RandoGoRando = mongoose.model("rando", randoSchema);

module.exports = RandoGoRando;

