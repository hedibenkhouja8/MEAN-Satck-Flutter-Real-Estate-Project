const Rent = require('./../models/Rent');
const express = require('express')
const multer  = require('multer')
const upload = multer({ dest: 'images/' })
const app = express()
exports.all = (req, res) => {
    Rent.find()
        .then(rents => res.status(200).json(rents))
        .catch(err => res.status(400).json({ error: err.message }));
};
exports.get = (req, res, next) => {
    Rent.findOne({ _id: req.params.id })
        .then(rent => res.status(200).json(rent))
        .catch(error => res.status(404).json({ error }));
};
exports.create = (req, res, next) => {
    const rent = new Rent({
        ...req.body
    });
    rent.save()
        .then(() => res.status(201).json({message: 'Rent created  !',status: 201}))
        .catch(error => res.status(400).json({ error }));
};
exports.update = (req, res, next) => {
    Rent.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Rent updated !' }))
        .catch(error => res.status(400).json({ error }));
};
// delete a rent by id
exports.delete = (req, res, next) => {
    Rent.deleteOne({ _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Rent deleted !' }))
        .catch(error => res.status(400).json({ error }));
};