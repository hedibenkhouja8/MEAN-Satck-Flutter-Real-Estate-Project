const mongoose = require('mongoose');

const aboutSchema = new mongoose.Schema({
    
    owner: { type: String, required: true },
    mail: { type: String, required: true },
    phone: { type: String, required: true },
    image_owner: { type: String, required: true },
    location: { type: String, required: true },
    image_location: { type: String, required: true },
    description: { type: String, required: true },
    siege_social: { type: String, required: true },
    date_creation: { type: String, required: true },
    horaire: { type: String, required: true },
});

module.exports = mongoose.model('About', aboutSchema);