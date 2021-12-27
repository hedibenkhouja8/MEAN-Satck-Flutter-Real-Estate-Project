const mongoose = require('mongoose');

const buySchema = new mongoose.Schema({
  title: {type: String, required: true},
  
  owner: {type: String, required: true},
  description: {type: String, required: true},
  image: {type: String, required: true},
  
  size: {type: Number, required: true},
  
  room_number: {type: Number, required: true},
  location: {type: String, required: true},
  price: {type: Number, required: true},
  
  user_id: {type: String, required: true}
});

module.exports = mongoose.model('Buy', buySchema);