const express = require('express');
const router = express.Router();
const aboutController = require('./../controllers/about')

router.get('/', aboutController.all);
router.get('/:id', aboutController.get);
router.post('/', aboutController.create);
router.put('/:id', aboutController.update);
router.delete('/:id', aboutController.delete);

module.exports = router;