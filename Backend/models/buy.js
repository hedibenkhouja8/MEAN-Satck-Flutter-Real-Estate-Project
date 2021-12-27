const mongoose = require('mongoose');

const buySchema = new mongoose.Schema({
  title: {type: string, required: true},
  
  owner: {type: string, required: true},
  description: {type: string, required: true},
  image: {type: string, required: true},
  
  size: {type: number, required: true},
  
  room_number: {type: number, required: true},
  location: {type: string, required: true},
  price: {type: number, required: true}
});

module.exports = mongoose.model('Buy', buySchema);