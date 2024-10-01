const { doc, addDoc, updateDoc, arrayUnion, getDoc, getDocs, collection } = require('firebase/firestore');
const { CommunityMessages } = require('../../config/db'); // Firestore CommunityMessages collection

// Add a new community message
async function addCommunityMessage(data) {
    try {
        // Add a new document to the communityMessages collection
        const messageRef = await addDoc(CommunityMessages, {
            message: data.message,
            userId: data.userId,
            timestamp: Date.now(),
            comments: [] // Initially, there are no comments
        });
        return messageRef.id;
    } catch (error) {
        throw error;
    }
}

async function addCommentToMessage(messageId, commentData) {
    try {
        const messageRef = doc(CommunityMessages, messageId);
        // Append the comment to the comments array
        await updateDoc(messageRef, {
            comments: arrayUnion(commentData)
        });
    } catch (error) {
        throw error;
    }
}

// Get all community messages
async function getCommunityMessages() {
    try {
        const querySnapshot = await getDocs(CommunityMessages);
        const messages = querySnapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
        return messages;
    } catch (error) {
        throw error;
    }
}

// Get a specific community message by ID
async function getCommunityMessageById(messageId) {
    try {
        const messageRef = doc(CommunityMessages, messageId);
        const messageDoc = await getDoc(messageRef);
        if (messageDoc.exists()) {
            return { id: messageDoc.id, ...messageDoc.data() };
        } else {
            throw new Error('Message not found');
        }
    } catch (error) {
        throw error;
    }
}

module.exports = {
    addCommunityMessage,
    addCommentToMessage,
    getCommunityMessages,
    getCommunityMessageById
};
