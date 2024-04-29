const mongoose = require("mongoose");

const LikeSchema = new mongoose.Schema(
    {
        clickDate: { type: Date },
        seen: { type: Boolean },
        liker: { 
            type: mongoose.Schema.Types.ObjectId,
            ref: "User"
        },
        liked: { 
            type: mongoose.Schema.Types.ObjectId,
            ref: "User"
        }
    },
    {
        timestamps: { currentTime: () => Date.now() },
    }
);

module.exports = mongoose.model('Like', LikeSchema);