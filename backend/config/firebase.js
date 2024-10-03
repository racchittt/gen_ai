// Import the functions you need from the SDKs you need
const { initializeApp } = require("firebase/app");
const { getFirestore } = require("firebase/firestore");
const admin = require('firebase-admin');
// const serviceAccount = require('../config/serviceAccountKey.json'); // Your Firebase Admin SDK key
const env = process.env;

// Initialize Firebase Admin
if (!admin.apps.length) {
    admin.initializeApp({
        credential: admin.credential.cert({
          "type": "service_account",
          "project_id": "genai-beab8",
          "private_key_id": env.PRIVATE_KEY_ID,
          "private_key": env.PRIVATE_KEY,
          "client_email": env.CLIENT_EMAIL,
          "client_id": env.CLIENT_ID,
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-okdkq%40genai-beab8.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }
        ),
        databaseURL: 'https://genai-beab8.firebaseio.com'
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