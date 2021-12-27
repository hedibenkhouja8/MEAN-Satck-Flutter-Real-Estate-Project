const express = require('express');
const router = express.Router();
const buyController = require('./../controllers/buy')

router.get('/', buyController.all);
router.get('/:id', buyController.get);
router.post('/', buyController.create);
router.put('/:id', buyController.update);
router.delete('/:id', buyController.delete);

module.exports = router;
