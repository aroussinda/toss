const Articles = require('../Models/commandeModels');


//create
exports.createArticles = (req, res, next) => {
  console.log(req.body)

  //delete req.body._id;
  const articles = new Articles({
    //id: req.body.id,
    type: req.body.type,
    emplacement: req.body.emplacement,
    plat: req.body.plat,
  })
  articles.save()
    .then(() => res.status(201).json({ message: 'commande saved !' }))
    .catch(error => res.status(400).json({ message: 'commande not saved !' }));
}

//get articles by id
exports.getArticlesbyid = (req, res, next) => {
  Articles.findOne({ _id: req.params.id })
    .then(articles => res.status(200).json(articles))
    .catch(error => res.status(404).json({ message: "commande not found " }));
}

//get all articles
exports.getAllArticles = (req, res, next) => {
  Articles.find()
    .then(articles => res.status(200).json(articles))
    .catch(error => res.status(400).json({ error }));
}

//update articles
exports.updateArticles = (req, res, next) => {
  Articles.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
    .then(() => res.status(200).json({ message: 'commande modified !' }))
    .catch(error => res.status(400).json({ error }));
}

//delete articles
exports.deleteArticles = (req, res, next) => {
  Articles.deleteOne({ _id: req.params.id })
    .then(() => res.status(200).json({ message: 'commande deleted !' }))
    .catch(error => res.status(400).json({ error }));
}

//delete all articles
exports.deleteAllArticles = (req, res, next) => {
   Articles.remove({}, function (err, message) {
    if (err) { return handleError(res, err); }
    return res.status(204).send({ message: "Aucun element" });
  })
}