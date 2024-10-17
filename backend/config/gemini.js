const env = process.env;
const axios = require('axios');

async function geminiResponse(body) {
    let data = JSON.stringify({
        "contents": [
            {
                "parts": [
                    {
                        "text": body
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
        let text = response.data.candidates[0].content.parts[0].text
        if (text.startsWith("bot:")) {
            text = text.substring(4);
        }
        console.log(JSON.stringify(response.data));

        return text;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

module.exports = {
    geminiResponse: geminiResponse
}


