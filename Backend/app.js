const express = require('express');
const mongoose = require('mongoose');
const app = express();

const buyRouter = require('./routes/buys');
const rentRouter = require('./routes/rents');
const aboutRouter = require('./routes/abouts');
mongoose.connect('mongodb://localhost:27017/real_estate',
  { useNewUrlParser: true,
    useUnifiedTopology: true })
  .then(() => console.log('Connected successfully to MongoDB !'))
  .catch(() => console.log('Connection failed to MongoDB !'));
  app.use(express.json());

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
  });


  app.use('/api/buys', buyRouter);
  app.use('/api/rents', rentRouter);
  app.use('/api/abouts',aboutRouter);
module.exports = app;