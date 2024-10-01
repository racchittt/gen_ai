// Import the functions you need from the SDKs you need
const { initializeApp } = require("firebase/app");
const { getFirestore } = require("firebase/firestore");
const admin = require('firebase-admin');
const serviceAccount = require('../config/serviceAccountKey.json'); // Your Firebase Admin SDK key

// Initialize Firebase Admin
if (!admin.apps.length) {
    admin.initializeApp({
        credential: admin.credential.cert(serviceAccount),
        databaseURL: 'https://<your-project-id>.firebaseio.com' // Replace with your database URL
    });
}

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyDKgc8X_P7AbPvJRdHypZOVW_Njuu-KkOk",
  authDomain: "genai-beab8.firebaseapp.com",
  projectId: "genai-beab8",
  storageBucket: "genai-beab8.appspot.com",
  messagingSenderId: "1061760502961",
  appId: "1:1061760502961:web:641e065dc4c9c923aea690"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
module.exports = {db, admin};