const Buy = require('./../models/Buy');
exports.all = (req, res) => {
  Buy.find()
    .then(buys => res.status(200).json(buys))
    .catch(err => res.status(400).json({error: err.message}));
};
exports.get = (req, res, next) => {
    Buy.findOne({ _id: req.params.id })
        .then(buy => res.status(200).json(buy))
        .catch(error => res.status(404).json({ error }));
    };
    exports.create = (req, res, next) => {
        const buy = new Buy({
          ...req.body
        });
        buy.save()
          .then(() => res.status(201).json({ message: 'Buy created  !'}))
          .catch(error => res.status(400).json({ error }));
      };
      exports.update = (req, res, next) => {
    Buy.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
      .then(() => res.status(200).json({ message: 'Buy updated !'}))
      .catch(error => res.status(400).json({ error }));
  };
// delete a buy by id
exports.delete = (req, res, next) => {
    Buy.deleteOne({ _id: req.params.id })
      .then(() => res.status(200).json({ message: 'Buy deleted !'}))
      .catch(error => res.status(400).json({ error }));
  };