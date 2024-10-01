const admin = require('firebase-admin'); // Ensure Firebase Admin SDK is imported

// Middleware to verify Firebase token
async function authenticateToken(req, res, next) {
    const token = req.headers.authorization && req.headers.authorization.startsWith('Bearer ')
        ? req.headers.authorization.split(' ')[1]
        : null; // Extract token from the Authorization header

    if (!token) {
        return res.status(403).send('No token provided');
    }
    try {
        const decodedToken = await admin.auth().verifyIdToken(token);
        req.user = decodedToken; // Attach the decoded token to the request object
        next(); // Proceed to the next middleware or route handler
    } catch (error) {
        console.error('Token verification error:', error); // Log the error for debugging
        return res.status(403).send('Invalid token');
    }
}

module.exports = authenticateToken; // Export the middleware
