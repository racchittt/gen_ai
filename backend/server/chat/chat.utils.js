function formatChatHistoryForBot(prevMessages) {
    return prevMessages
        .map(chat => `${chat.sender}: ${chat.message}`) // Format as 'user: message' or 'bot: message'
        .join('\n'); // Join all messages by a newline to create a readable conversation history
}

module.exports = formatChatHistoryForBot