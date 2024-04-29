const express = require("express");
const app = express();

const mongoose = require("mongoose");
const port = process.env.PORT || 3000;
const config = require("./config.json");
const bodyParser = require("body-parser");
const path = require("path");
const cors = require("cors")

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.json());
app.use(cors());

//we want to be informed whether mongoose has connected to the db or not 
mongoose.Promise = global.Promise;
mongoose.connect(config.database, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(
        () => {
            console.log("Connecté a la base de données");
        },
        (err) => {
            console.log("Connexion a la base de données echouée", err);
        }
    );

const chatRoute = require("./routes/chat-route");
const likeRoute = require("./routes/like-route");
const messageRoute = require("./routes/message-route");
const paymentRoute = require("./routes/payment-route");
const userRoute = require("./routes/user-route");

app.use("/api/chat", chatRoute);
app.use("/api/like", likeRoute);
app.use("/api/message", messageRoute);
app.use("/api/payment", paymentRoute);
app.use("/api/user", userRoute);

if (process.env.NODE_ENV === "production") {
    console.log("app in production mode");
    app.use(express.static("client/build"));
    app.get("/*", function (req, res) {
        res.sendFile(
            path.join(__dir, "client", "build", "index.html"),
            function (err) {
                if (err) res.status(500).send(err);
            }
        );
    });
}

app.listen(port, () => console.log(`Server up and running on port ${port} !`));