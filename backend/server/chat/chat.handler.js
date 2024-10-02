const { doc, updateDoc, setDoc, arrayUnion, getDoc } = require("firebase/firestore");
const {Chats} = require('../../config/db'); // Firestore initialization

async function addChat(userId, date, data, platform = null) {
    try {
        // Use the userId and date to form the document ID
        const chatDocId = `${userId}_${date}`;
        const chatRef = doc(Chats, chatDocId);
        
        // Append the message to the array of messages for the day
        await updateDoc(chatRef, {
            messages: arrayUnion(data)
        }).catch(async (error) => {
            // If the document doesn't exist, create it
            console.log(error);
            if (error.code === 'not-found') {
                await setDoc(chatRef, {
                    messages: [data],
                    userId: userId,
                    date: date,
                    platform:null
                });
            } else {
                throw error;
            }
        });

        return;
    } catch (e) {
        throw e;
    }
}

// Get all messages for a specific user and day
async function getChat(userId, date) {
    try {
        // Use the userId and date to form the document ID
        const chatDocId = `${userId}_${date}`;
        const chatRef = doc(Chats, chatDocId);
        const chatDoc = await getDoc(chatRef);
        
        if (chatDoc.exists()) {
            return chatDoc.data().messages;
        } else {
            return []; // No messages found for this date
        }
    } catch (e) {
        throw e;
    }
}

module.exports = {
    addChat,
    getChat
};
