const CommunityMessagesHandler = require('./community.handler');

// POST request to add a new community message
async function createCommunityMessage(req, res) {
    try {
        if(!req.body.hasOwnProperty('userId') || !req.body.hasOwnProperty('message') ) {
            return res.status(500).json({message:"Invalid Request"})
        }
        const { userId, message } = req.body;
        const messageData = {
            userId,
            message
        };
        const messageId = await CommunityMessagesHandler.addCommunityMessage(messageData);
        res.status(200).json({ message: 'Community message added', messageId });
    } catch (error) {
        res.status(500).json({ error: 'Failed to add community message' });
    }
}

// POST request to add a comment to a community message
async function addComment(req, res) {
    try {
        if(!req.body.hasOwnProperty('userId') || !req.body.hasOwnProperty('comment') ) {
            return res.status(500).json({message:"Invalid Request"})
        }
        const { messageId } = req.params;
        const { userId, comment } = req.body;
        const commentData = {
            userId,
            comment,
            timestamp: Date.now()
        };
        await CommunityMessagesHandler.addCommentToMessage(messageId, commentData);
        res.status(200).json({ message: 'Comment added' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to add comment' });
    }
}

// GET request to retrieve all community messages
async function getCommunityMessages(req, res) {
    try {
        const messages = await CommunityMessagesHandler.getCommunityMessages();
        res.status(200).json(messages);
    } catch (error) {
        res.status(500).json({ error: 'Failed to retrieve community messages' });
    }
}

// GET request to retrieve a specific community message by ID
async function getCommunityMessageById(req, res) {
    try {
        const { messageId } = req.params;
        const message = await CommunityMessagesHandler.getCommunityMessageById(messageId);
        res.status(200).json(message);
    } catch (error) {
        res.status(404).json({ error: 'Message not found' });
    }
}

module.exports = {
    createCommunityMessage,
    addComment,
    getCommunityMessages,
    getCommunityMessageById
};
