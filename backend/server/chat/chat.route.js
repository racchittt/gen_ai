const express = require('express');
const chatController = require('./chat.controller');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth.middleware');

router.post('/add',chatController.sendMessages );
router.get('/get/:userId/:date', chatController.getMessages);

module.exports = router;