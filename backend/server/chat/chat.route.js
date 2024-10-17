const express = require('express');
const chatController = require('./chat.controller');
const router = express.Router();
const authenticateToken = require('../middleware/auth.middleware');

// this is for website
router.post('/add',chatController.sendMessages );

router.post('/sendMessage',authenticateToken, chatController.sendMessages );
router.post('/sendMessageToPepo',chatController.sendMessagesToPepo );
router.get('/get/:userId/:date', chatController.getMessages);

module.exports = router;