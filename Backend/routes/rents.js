const express = require('express');
const router = express.Router();
const rentController = require('./../controllers/rent')

router.get('/', rentController.all);
router.get('/:id', rentController.get);
router.post('/', rentController.create);
router.put('/:id', rentController.update);
router.delete('/:id', rentController.delete);

module.exports = router;