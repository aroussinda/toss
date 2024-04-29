const express = require('express');
const router = express.Router();
const NewsCntrl = require('../Controllers/platController');
const multer = require('../middleware/multer-config');

const upload = require('../middleware/storage');



router.post('/add', upload.single('image'),NewsCntrl.createNews);
router.get('/:id', NewsCntrl.getNewsbyid);
router.post('/get/all', NewsCntrl.getAllNews);
router.put('/:id', NewsCntrl.updateNews);
router.delete('/:id', NewsCntrl.deleteNews);


module.exports = router;
