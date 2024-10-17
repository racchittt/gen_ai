const axios = require("axios");
const env = process.env;

// DEPRECATED

async function geminiPepo(body) {
    try {
        const response = await axios.post(
            env.GEMINI_BASE_URL, 
            body, 
            {
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": env.AUTHORIZATION,
                    "x-goog-user-project": env.X_GOOG_USER_PROJECT
                },
            }
        );
        
        const candidates = response.data?.candidates;

        if (candidates && candidates.length > 0) {
            const content = candidates[0]?.content;
            const parts = content?.parts;

            if (parts && parts.length > 0) {
                return parts[0]?.text;
            }
        }

        throw new Error("Invalid response format");
    } catch (error) {
        throw error;
    }
}

module.exports = {
    geminiPepo: geminiPepo
};
