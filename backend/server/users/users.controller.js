const { admin } = require('../../config/firebase');
const { v4: uuidv4 } = require('uuid');
const UsersHandler = require('./users.handler');

// POST request to log in with a simple username
async function simpleLogin(req, res) {
    console.log("hello");
    try {
        const { username } = req.body;
        // Generate a UUID for the user (for direct login users)
        const userId = uuidv4();
        const userData = {
            username,
            firebaseUid: null,
            createdAt: Date.now()
        };

        await UsersHandler.createUser(userId, userData);
        res.status(200).json({ message: 'User logged in', userId, username });
    } catch (error) {
        console.log(error)
        res.status(500).json({ error: 'Failed to log in with username' });
    }
}

// POST request to log in with Firebase Authentication
async function firebaseLogin(req, res) {
    try {
        const { token } = req.body; // Firebase ID Token from Flutter
        if (!token) {
            return res.status(400).json({ error: 'Token is required' });
        }

        console.log(`Received token: ${token}`);
        const decodedToken = await admin.auth().verifyIdToken(token);
        const firebaseUid = decodedToken.uid;

        // Get user info from Firebase Auth
        const firebaseUser = await admin.auth().getUser(firebaseUid);

        // Create or update the user in Firestore
        const userData = {
            username: firebaseUser.displayName || 'Anonymous',
            firebaseUid: firebaseUid,
            createdAt: Date.now()
        };

        await UsersHandler.createUser(firebaseUid, userData);
        res.status(200).json({ message: 'Firebase user logged in', userId: firebaseUid, username: userData.username });
    } catch (error) {
        console.error('Error logging in with Firebase:', error);
        res.status(500).json({ error: 'Failed to log in with Firebase' });
    }
}

// GET request to retrieve a user by ID
async function getUser(req, res) {
    try {
        const { userId } = req.params;
        const user = await UsersHandler.getUserById(userId);
        if (user) {
            res.status(200).json(user);
        } else {
            res.status(404).json({ error: 'User not found' });
        }
    } catch (error) {
        console.log(error)
        res.status(500).json({ error: 'Failed to retrieve user' });
    }
}

module.exports = {
    simpleLogin,
    firebaseLogin,
    getUser
};
