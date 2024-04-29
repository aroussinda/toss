const express = require('express');
const router = express.Router();
const UserCtrl = require('../Controllers/userController');

const jwt = require("jsonwebtoken");
const multer = require('../middleware/multer-config');
const userdb = require('../Models/userModel');
const nodemailer = require("nodemailer");

router.post('/login', UserCtrl.login);
router.post('/signup', multer,UserCtrl.signup);
router.post('/loginWithSocial', UserCtrl.loginWithSocial);
router.post('/motDePasseOublie', UserCtrl.motDePasseOublie);
router.put('/changerMotDePasse', UserCtrl.changerMotDePasse);

router.get('/:id', UserCtrl.getUserbyid);
router.get('/', UserCtrl.getAllUser);
router.put('/:id', UserCtrl.updateUser);
router.delete('/:id', UserCtrl.deleteUser);




// router.post("/reset", (req, res) => {
    
//     val = Math.floor(1000 + Math.random() * 9000);
//     console.log(val, req.body);
//     try {
//         let email = req.body.email;
//         userdb.find({ email: email }).then((user) => {
//             compte = user[0];
            
//             if (compte) {
//                 var smtpTrans = nodemailer.createTransport({
//                     service: 'gmail',
//                     auth: {
//                         user: process.env.email_app,
//                         pass: process.env.password_app,
            
//                     }
//                 });
            
            
//                 var transporter = nodemailer.createTransport({
//                     service: "gmail",
//                     auth: {
//                         user: process.env.email_app,
//                         pass: process.env.password_app,
//                     },
//                 });
//                 var mailOptions = {
//                     from: process.env.email_app,
//                     to: compte.email,
//                     subject: "Reset password",
//                     text : val

                    
                   
//                 };

//             } else {
//                 res.json("false");
//             }
//         });
//     } catch (error) {
//         console.log(error);
//     }
// });


// //update  password

// router.patch("/reset", getUserEmail, async(req, res) => {
//     if (req.body.password != null) {
//         if (req.body.code == val) {
//             res.user.password = req.body.password;
//         }

//         try {
//             res.user.save().then((updateduser) => {
//                 res.json(updateduser);
//             });
//         } catch (error) {
//             res.status(400).json({ message: error.message });
//         }
//     } else {
//         res.json({ code: false });
//     }
// });



var val;



router.post("/reset", (req, res) => {
    val = Math.floor(1000 + Math.random() * 9000);
    console.log(val, req.body);
    try {
        let email = req.body.email;
        userdb.find({ email: email }).then((user) => {
            compte = user[0];
            if (compte) {
                var transporter = nodemailer.createTransport({
                    service: "gmail",
                    auth: {
                        user: process.env.email_app,
                        pass: process.env.password_app,
                    },
                });
                var mailOptions = {
                    from: process.env.email_app,
                    to: compte.email,
                    subject: "Reset password",
                text: "Reset password"+ val
                   
                };
                transporter.sendMail(mailOptions, async function(error, info) {
                    if (error) {
                        console.log(error);
                    } else {
                        console.log("Email sent: " + info.response);
                    }
                });

                res.json("true");
            } else {
                res.json("false");
            }
        });
    } catch (error) {
        console.log(error);
    }
});




async function getUserEmail(req, res, next) {
    try {
        user = await userdb.find({ email: req.body.email });
        if (user == null) {
            return res.status(404).json({ message: "cannot find user" });
        }
    } catch (error) {
        return res.status(500).json({ message: err.message });
    }
    res.user = user[0];
    next();
}


module.exports = router;