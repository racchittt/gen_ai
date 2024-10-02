const { doc, setDoc, getDoc } = require('firebase/firestore');
const { User } = require('../../config/db'); // Firestore Users collection

// Create or update a user
async function createUser(userId, data) {
    try {
        const userRef = doc(User, userId);
        await setDoc(userRef, data, { merge: true }); // Merge if the document already exists
        return { userId, ...data };
    } catch (error) {
        throw error;
    }
}

// Get a user by userId
async function getUserById(userId) {
    try {
        const userRef = doc(User, userId);
        const userDoc = await getDoc(userRef);
        if (userDoc.exists()) {
            return { userId, ...userDoc.data() };
        } else {
            return null; // User not found
        }
    } catch (error) {
        throw error;
    }
}

module.exports = {
    createUser,
    getUserById
};
