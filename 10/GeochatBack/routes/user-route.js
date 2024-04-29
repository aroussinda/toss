const express = require("express");
const router = express.Router();
const UserController = require("../controllers/user-controller.js");
const User = require("../models/User.js");
const upload = require('../middlewares/storage-images');
const app = express();
//

 /**
  * @swagger
 * /api/user:
 *   description: The utilisateurs managing API
 *   get:
 *     summary: Returns the list of all the utilisateurs
 *     tags: [Users]
*     responses:
 *       200:
 *         description: The list utilisateurs
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.get("/", UserController.getAllUsers);
 /**
  * @swagger
 * /api/user:
 *   description: The utilisateurs managing API
 *   get:
 *     summary: Set the user Position on map
 *     tags: [Users]
*     responses:
 *       200:
 *         description: User geographic position
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.put("/setPosition", UserController.setPosition);
// end

router.post("/addphoto", upload.single('image'),UserController.changerPhotoDeProfil)
/**
  * @swagger
 * /api/user/signup:
 *   description: The utilisateurs managing API
 *   get:
 *     summary: Returns the list of all the utilisateurs
 *     tags: [Users]
 *     parameters:
 *       - in: body
 *         name: id
 *         type: string
 *       - in: body
 *         name: email
 *         type: string
*     responses:
 *       200:
 *         description: The list utilisateurs
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.post("/signup", UserController.signup);
/**
  * @swagger
 * /api/user/signin:
 *   description: The utilisateurs managing API
 *   post:
 *     summary: Returns the list of all the utilisateurs
 *     tags: [Users]
 *     parameters:
 *       - in: body
 *         name: email
 *         type: string
 *       - in: body
 *         name: password
 *         type: string
*     responses:
 *       200:
 *         description: The list utilisateurs
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.post("/login", UserController.login)
/**
  * @swagger
 * /api/user/getUserFromToken:
 *   description: The utilisateurs managing API
 *   post:
 *     summary: Returns the list of all the utilisateurs
 *     tags: [Users]
 *     parameters:
 *       - in: body
 *         name: token
 *         type: string
 *     responses:
 *       200:
 *         description: Utilisateur par Token
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.post("/getUserFromToken", UserController.getUserFromToken)

router.post("/loginWithSocialApp", UserController.loginWithSocialApp);
/**
  * @swagger
 * /api/user/confirmation/:token:
 *   description: The utilisateurs managing API
 *   get:
 *     summary: Returns the list of all the utilisateurs
 *     tags: [Users]
 *     parameters:
 *       - in: body
 *         name: token
 *         type: string
 *     responses:
 *       200:
 *         description: Confirmation Token
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.get("/confirmation/:token", UserController.confirmation);
 
router.post("/resendConfirmation", UserController.resendConfirmation);
  
router.post("/forgotPassword", UserController.forgotPassword);
  /**
  * @swagger
 * /api/user:
 *   description: The utilisateurs managing API
 *   get:
 *     summary:     Modify the password 
 *     tags: [Users]
*     responses:
 *       200:
 *         description: Password was modified succesfflyy
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.put("/editPassword", UserController.editPassword);
  /**
  * @swagger
 * /api/user:
 *   description: The utilisateurs managing API
 *   get:
 *     summary: Modifie the profile
 *     tags: [Users]
*     responses:
 *       200:
 *         description: Profiles was modified
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.put("/editProfile", UserController.editProfile);
 /**
  * @swagger
 * /api/user:
 *   description: The utilisateurs managing API
 *   get:
 *     summary: Delete One User
 *     tags: [Users]
*     responses:
 *       200:
 *         description: the user was deleted
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */

router.delete("/deleteOne", UserController.deleteOne);
 /**
  * @swagger
 * /api/user:
 *   description: The utilisateurs managing API
 *   get:
 *     summary: Delete All the users
 *     tags: [Users]
*     responses:
 *       200:
 *         description: All users was deleted succerfully
 *         content:
 *           application/json:
 *       400:
 *         description: utilisateur error
 */
router.delete("/deleteAll", UserController.deleteAll);



module.exports = router;
