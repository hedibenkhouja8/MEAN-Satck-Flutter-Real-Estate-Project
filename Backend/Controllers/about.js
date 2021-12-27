const About = require('./../models/About');
exports.all = (req, res) => {
    About.find()
        .then(abouts => res.status(200).json(abouts))
        .catch(err => res.status(400).json({ error: err.message }));
};
exports.get = (req, res, next) => {
    About.findOne({ _id: req.params.id })
        .then(about => res.status(200).json(about))
        .catch(error => res.status(404).json({ error }));
};
exports.create = (req, res, next) => {
    const about = new About({
        ...req.body
    });
    about.save()
        .then(() => res.status(201).json({ message: 'About created  !' }))
        .catch(error => res.status(400).json({ error }));
};
exports.update = (req, res, next) => {
    About.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
        .then(() => res.status(200).json({ message: 'About updated !' }))
        .catch(error => res.status(400).json({ error }));
};
// delete a About by id
exports.delete = (req, res, next) => {
    About.deleteOne({ _id: req.params.id })
        .then(() => res.status(200).json({ message: 'About deleted !' }))
        .catch(error => res.status(400).json({ error }));
};