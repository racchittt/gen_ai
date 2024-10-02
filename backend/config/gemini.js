
const { GoogleGenerativeAI } = require("@google/generative-ai");
const env = process.env;

const genAI = new GoogleGenerativeAI(env.GEMINI_API_KEY);

async function geminiResponse(body) {
    console.log(env.GEMINI_API_KEY)
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });
    console.log(body);
    let prompt = "You will act as a therapist. You will be provided with a conversation. you will be responding next as per the ongoing conversation. Ask more questions but give answers and suggestions when required. all your response should be of maximum 30 words. Here you have the conversation - \n"
    const result = await model.generateContent(prompt + body);
    const response = result.response;
    const text = response.text();
    console.log(text);
    return text;
}

module.exports = {
    geminiResponse: geminiResponse
}