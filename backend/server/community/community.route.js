
const express = require('express');
const communityController = require('./community.controller');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth.middleware');

router.post('/addComment/:messageId',communityController.addComment );
router.post('/create',communityController.createCommunityMessage );
router.get('/get/:messageId',communityController.getCommunityMessageById );
router.get('/get', communityController.getCommunityMessages);

module.exports = router;