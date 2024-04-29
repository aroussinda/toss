const mongoose = require("mongoose");



const articleModels = new mongoose.Schema({


    id: {
        type: String,


    },
    type: {
        type: String,

    },

    emplacement: {
        type: String,

    },

    plat: {
        type: String,

    },

});


module.exports = mongoose.model("commande", articleModels);
