const mongoose = require("mongoose");

const ChatSchema = new mongoose.Schema(
    {
        date: { type: Date },
        lastMessage: { type: String },

        sender: { 
            type: mongoose.Schema.Types.ObjectId,
            ref: "User"
        },
        receiver: { 
            type: mongoose.Schema.Types.ObjectId,
            ref: "User"
        }
    },
    {
        timestamps: { currentTime: () => Date.now() },
    }
);

module.exports = mongoose.model('Chat', ChatSchema);