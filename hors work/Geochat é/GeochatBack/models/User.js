const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema(
        {
                email: { type: String },
                password: { type: String },
                firstname: { type: String },
                lastname: { type: String },
                age: { type: Number },
                // added for test
                latitude: { type: Number },
                longitude: { type: Number },

                // end
                sexe: { type: String },
                location: { type: String },
                isVerified: { type: Boolean },

                likes: {
                        type: mongoose.Schema.Types.ObjectId,
                        ref: "Like"
                },
                chats: {
                        type: mongoose.Schema.Types.ObjectId,
                        ref: "Chat"
                },
        },
        {
                timestamps: { currentTime: () => Date.now() },
        }
);

module.exports = mongoose.model('User', UserSchema);