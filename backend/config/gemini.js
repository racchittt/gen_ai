const env = process.env;
const axios = require('axios');

async function geminiResponse(body) {
    let data = JSON.stringify({
        "safetySettings": [
            { "category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_NONE" },
            { "category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_NONE" },
            { "category": "HARM_CATEGORY_DANGEROUS_CONTENT", "threshold": "BLOCK_NONE" }
        ],
        "contents": [
            {
                "parts": [
                    {
                        "text": body + env.GEMINI_PROMPT
                    }
                ]
            }
        ],
        "generationConfig": {
            "temperature": 0.8,
            "topK": 64,
            "topP": 0.95,
            "maxOutputTokens": 8192,
            "responseMimeType": "text/plain"
        }
    });

    let config = {
        method: 'post',
        maxBodyLength: Infinity,
        url: env.GEMINI_URL,
        headers: {
            'Content-Type': 'application/json'
        },
        data: data
    };

    try {
        const response = await axios.request(config);
        const candidates = response.data?.candidates;

        if (candidates && candidates.length > 0) {
            const content = candidates[0]?.content;
            const parts = content?.parts;

            if (parts && parts.length > 0) {
                let text = parts[0]?.text;
                if (text.startsWith("bot:")) {
                    text = text.substring(4);
                }
                return text;
            }
        }

        throw new Error("Invalid response format");
    } catch (error) {
        console.log(error);
        throw error;
    }
}

module.exports = {
    geminiResponse: geminiResponse
}


