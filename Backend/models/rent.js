const mongoose = require('mongoose');

const rentSchema = new mongoose.Schema({
    title: { type: String, required: true },
    owner: { type: String, required: true },
    description: { type: String, required: true },
    image: { type: String, required: true },
    size: { type: Number, required: true },
    room_number: { type: Number, required: true },
    location: { type: String, required: true },
    price_per_month: { type: Number, required: true },
    start_date_available: { type: String, required: true },
    end_date_available: { type: String, required: true },
    user_id: { type: String, required: true }
});

module.exports = mongoose.model('Rent', rentSchema);