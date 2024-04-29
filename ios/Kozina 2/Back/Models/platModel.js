const mongoose = require("mongoose");

const newsModelSchema =  mongoose.Schema({

    ref: { type: String},
    prix: { type: String },
    description: { type: String },
    composition: { type: String },
    image: { type: String, }


});
module.exports = mongoose.model("plat", newsModelSchema);
