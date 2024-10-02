const ChatHandler = require('./chat.handler');
const { geminiResponse } = require('../../config/gemini')
const formatChatHistoryForBot = require('./chat.utils')

// Utility function to format the date as YYYY-MM-DD
function getFormattedDate() {
    return new Date().toISOString().split('T')[0];
}

// POST request to send a message (User -> Bot)
async function sendMessages(req, res, next) {
    try {
        const { userId, message } = req.body;
        if(!req.body.hasOwnProperty('userId') || !req.body.hasOwnProperty('message') ) {
            return res.status(500).json({message:"Invalid Request"})
        }
        const date = getFormattedDate(); // Get today's date (YYYY-MM-DD)

        // User message data
        const userMessageData = {
            userId,
            message,
            sender: 'user',
            timestamp: Date.now()
        };
        
        // Add user message to Firestore
        await ChatHandler.addChat(userId, date, userMessageData);

        let prevMessages = await ChatHandler.getChat(userId, date);
        const chatHistory = formatChatHistoryForBot(prevMessages);
        // Simulate bot response (replace this with actual Gemini API)
        const botResponse = await geminiResponse(chatHistory);
        const botMessageData = {
            userId,
            message: botResponse,
            sender: 'bot',
            timestamp: Date.now() + 1000 // Simulated delay
        };
        
        // Add bot message to Firestore
        await ChatHandler.addChat(userId, date, botMessageData);
        
        res.status(200).json({ message: 'Message sent', botResponse });
    } catch (error) {
        console.log(error);
        res.status(500).json({ error: 'Failed to send message' });
    }
}

// GET request to retrieve chat history (User <-> Bot) for a specific day
async function getMessages(req, res, next) {
    const { userId, date } = req.params; // Date format: YYYY-MM-DD
    
    try {
        const messages = await ChatHandler.getChat(userId, date);
        
        if (messages.length > 0) {
            res.status(200).json(messages);
        } else {
            res.status(404).json({ error: 'No messages found for this date' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Failed to retrieve messages' });
    }
}

module.exports = {
    sendMessages,
    getMessages
};
