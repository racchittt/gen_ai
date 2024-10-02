
const { GoogleGenerativeAI } = require("@google/generative-ai");
const env = process.env;

const genAI = new GoogleGenerativeAI(env.GEMINI_API_KEY);

async function geminiResponse(body) {
    try {

        console.log(env.GEMINI_API_KEY)
        const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });
        console.log(body);
        let prompt = env.GEN_AI_PROMPT
        console.log(prompt)
        const result = await model.generateContent(prompt + body);
        const response = result.response;
        const text = response.text();
        console.log(text);
        return text;
    } catch (error) {
        throw error;
    }
}

module.exports = {
    geminiResponse: geminiResponse
}