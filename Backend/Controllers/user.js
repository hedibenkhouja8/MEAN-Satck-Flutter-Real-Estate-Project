    const bcrypt = require('bcrypt');
    const User = require('../models/User');
    const jwt = require('jsonwebtoken');
    
    exports.signup = (req, res, next) => {
      bcrypt.hash(req.body.password, 10)
            .then(hash => {
                const user = new User({
                    name: req.body.name,
                    email: req.body.email,
                    password: hash
                });
                user.save()
                    .then(() => res.status(201).json({ message: 'User created !' }))
                    .catch(error => res.status(400).json({ error }));
            })
            .catch(error => res.status(500).json({ error }));
    };

exports.login = (req, res, next) => {

};


exports.profile = (req, res, next) => {
    User.findOne({ _id: req.params.id })
      .then(user => res.status(200).json(user))
      .catch(error => res.status(500).json({ error }));
  };