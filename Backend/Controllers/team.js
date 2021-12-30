const Team = require('./../models/Team');
exports.all = (req, res) => {
    Team.find()
        .then(teams => res.status(200).json(teams))
        .catch(err => res.status(400).json({ error: err.message }));
};
exports.get = (req, res, next) => {
    Team.findOne({ _id: req.params.id })
        .then(team => res.status(200).json(team))
        .catch(error => res.status(404).json({ error }));
};
exports.create = (req, res, next) => {
    const team = new Team({
        ...req.body
    });
    team.save()
        .then(() => res.status(201).json({ message: 'team created  !' }))
        .catch(error => res.status(400).json({ error }));
};
exports.update = (req, res, next) => {
    Team.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
        .then(() => res.status(200).json({ message: 'team updated !' }))
        .catch(error => res.status(400).json({ error }));
};
// delete a About by id
exports.delete = (req, res, next) => {
    Team.deleteOne({ _id: req.params.id })
        .then(() => res.status(200).json({ message: 'team deleted !' }))
        .catch(error => res.status(400).json({ error }));
};