const { db } = require('./firebase');
const { collection } = require("firebase/firestore");

// Access the 'users' collection using Firestore's modular SDK
const User = collection(db, 'users');
const Chats = collection(db, 'chats');
const CommunityMessages = collection(db, 'communityMessages');
const Sos = collection(db, 'sos');
const Day = collection(db, 'day');
const Moods = collection(db, 'moods');
const Therapist = collection(db, 'therapist');

module.exports = {
    User, Chats, CommunityMessages, Sos, Day, Moods, Therapist
};
