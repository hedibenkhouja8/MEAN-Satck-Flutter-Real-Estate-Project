const express = require('express');
const router = express.Router();
const buyController = require('./../controllers/buy')

const multer  = require('multer')
const upload = multer({ dest: 'assets/' })
router.get('/', buyController.all);
router.get('/:id', buyController.get);
router.post('/', upload.single('image'), buyController.create);

router.put('/:id', buyController.update);
router.delete('/:id', buyController.delete);

module.exports = router;
