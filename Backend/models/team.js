const mongoose = require('mongoose');

const teamSchema = new mongoose.Schema({
    
    name: { type: String, required: true },
    mail: { type: String, required: true },
    phone: { type: String, required: true },
    image: { type: String, required: true },
    location: { type: String, required: true },
});

module.exports = mongoose.model('Team', teamSchema);