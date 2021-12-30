const express = require('express');
const router = express.Router();
const teamController = require('./../controllers/team')

router.get('/', teamController.all);
router.get('/:id', teamController.get);
router.post('/', teamController.create);
router.put('/:id', teamController.update);
router.delete('/:id',teamController.delete);

module.exports = router;