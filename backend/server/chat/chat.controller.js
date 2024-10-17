const ChatHandler = require('./chat.handler');
const { geminiResponse } = require('../../config/gemini')
const formatChatHistoryForBot = require('./chat.utils')

// Utility function to format the date as YYYY-MM-DD
function getFormattedDate() {
    return new Date().toISOString().split('T')[0];
}

// POST request to send a message (User -> Bot) 
// This is for the website
async function sendMessages(req, res, next) {
    try {
        const { userId, message } = req.body;
        if(!req.body.hasOwnProperty('userId') || !req.body.hasOwnProperty('message') ) {
            return res.status(500).json({message:"Invalid Request"})
        }
        const date = getFormattedDate(); // Get today's date (YYYY-MM-DD)
        let platform = null;
        if(req.body.hasOwnProperty('platform')) {
            let prevMessages = await ChatHandler.getChat(userId, date);
            if(prevMessages.length > 20) {
                return res.status(401).json({message:"exhausted",error:"limit", botResponse:"Please Download our app!"})
            }
            platform = req.body.platform;
        }
        const userMessageData = {
            userId,
            message,
            sender: 'user',
            timestamp: Date.now()
        };
        
        if(platform) {
            await ChatHandler.addChat(userId, date, userMessageData, platform);
        } else {
            await ChatHandler.addChat(userId, date, userMessageData);
        }

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
        res.status(500).json({ message: 'Failed to send message' , error:error});
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

// This is for the app
async function sendMessagesToPepo(req, res, next) {
    try {
        const { userId, message } = req.body;
        if (!req.body.hasOwnProperty('userId') || !req.body.hasOwnProperty('message')) {
            return res.status(500).json({ message: "Invalid Request" });
        }
        const date = getFormattedDate(); // Get today's date (YYYY-MM-DD)
        let platform = null;
        if (req.body.hasOwnProperty('platform')) {
            let prevMessages = await ChatHandler.getChat(userId, date);
            if (prevMessages.length > 20) {
                return res.status(401).json({ message: "exhausted", error: "limit", botResponse: "Please Download our app!" });
            }
            platform = req.body.platform;
        }
        const userMessageData = {
            userId,
            message,
            sender: 'user',
            timestamp: Date.now()
        };

        if (platform) {
            await ChatHandler.addChat(userId, date, userMessageData, platform);
        } else {
            await ChatHandler.addChat(userId, date, userMessageData);
        }

        let prevMessages = await ChatHandler.getChat(userId, date);
        const chatHistory = formatChatHistoryForBot(prevMessages);

        // Prepare the body for geminiPepo API request
        const body = {
            contents: [
                    {
                        parts: [
                            {
                                text: message
                            }
                        ]
                    }
                ]
            };
        

        // Call geminiPepo to get the bot response
        const botResponse = await geminiResponse(body);

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
        res.status(500).json({ message: 'Failed to send message', error: error });
    }
}

module.exports = {
    sendMessages,
    getMessages,
    sendMessagesToPepo
};
