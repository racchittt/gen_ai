
const express = require('express');
const usersController = require('./users.controller');
const router = express.Router();

router.post('/firebaseUser',usersController.firebaseLogin );
router.post('/normalUser',usersController.simpleLogin );
router.get('/getUser/:userId',usersController.getUser );

module.exports = router;