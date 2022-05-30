const mongoose = require("mongoose");
const schema = mongoose.Schema;

const pointSchema = schema({
  rando_id: { type: Number, required: true },
  number: { type: Number, required: true },
  icon: { type: String, required: false },
  lat: { type: Number, required: true },
  long: { type: Number, required: true },
  direction: { type: String, required: true },
});

const RandoGoPoint = mongoose.model("point", pointSchema);

module.exports = RandoGoPoint;

