const express = require('express');
const router = express.Router();
const ArticleCntrl = require('../Controllers/commandeController');

router.post('/add', ArticleCntrl.createArticles);
router.get('/:id', ArticleCntrl.getArticlesbyid);
router.get('/', ArticleCntrl.getAllArticles);
router.put('/:id', ArticleCntrl.updateArticles);
router.delete('/:id', ArticleCntrl.deleteArticles);

router.delete('/delete/all', ArticleCntrl.deleteAllArticles);

module.exports = router;