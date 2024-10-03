import React, { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
const BASE_URL = process.env.REACT_APP_SERVER_URL;

const Chat = () => {
  const [messages, setMessages] = useState([]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false); // Loading state
  const [modalOpen, setModalOpen] = useState(false); // Modal state
  const [userId, setuserId] = useState(""); // Modal state
  //   const userId = "134982huwbcjiabsc";

  function createRandomString(length) {
    const chars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let result = "";
    for (let i = 0; i < length; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  }

  useEffect(() => {
    function createUserId() {
      const id = localStorage.getItem("userId");
      console.log(id);

      if (id && id !== "null") {
        setuserId(id);
        console.log("User ID already present");
      } else {
        const str = createRandomString(18);
        setuserId(str);
        localStorage.setItem("userId", str); // Save the generated userId directly
      }
    }
    createUserId();
  }, []);

  const navigate = useNavigate();

  const sendMessage = async () => {
    if (input.trim() === "") return;

    // Open the modal for users who haven't downloaded the app

    // Add user's message to the chat
    setMessages([...messages, { sender: "user", message: input }]);
    setLoading(true); // Start loading

    try {
      console.log(BASE_URL);
      // Send the message to the backend API
      const response = await axios.post(BASE_URL, {
        userId,
        message: input,
        platform: "site",
      });

      // Add the chatbot's response to the chat
      setMessages([
        ...messages,
        { sender: "user", message: input },
        { sender: "bot", message: response.data.botResponse },
      ]);
    } catch (error) {
      if (error.response && error.response.data.message === "exhausted") {
        setModalOpen(true);
        setMessages([
          ...messages,
          { sender: "user", message: input },
          { sender: "bot", message: error.response.data.botResponse },
        ]);
      } else if (error.response?.data?.error) {
        if (error.response.data.error.response) {
          setMessages([
            ...messages,
            { sender: "user", message: input },
            {
              sender: "bot",
              message:
                "I can't respond due to inappropriate talks. Please be respectful and breathe. 😮‍💨",
            },
          ]);
        }
      }
      console.error("Error sending message:", error);
    } finally {
      setInput("");
      setLoading(false); // Stop loading
    }
  };

  const closeModal = () => {
    setModalOpen(false);
  };

  return (
    <div className="flex h-screen antialiased text-gray-800">
      {/* Sidebar */}
      <div className="w-[20%] bg-[#0CADB5] flex flex-col justify-between text-white p-4">
        <div>
          <h2
            className="text-md font-semibold mb-2 p-2 hover:cursor-pointer"
            onClick={() => navigate("/")}
          >
            {"←"} Go back
          </h2>
          <hr className="py-2" />
          <h2 className="text-xl font-semibold mb-4">Chat History</h2>
          <ul>
            <li className="bg-[#16a1a8] p-4 rounded-xl">Limited Chat</li>
          </ul>
        </div>
        <div className="text-xl text-center bg-[#07848b] p-4 rounded-xl">
          <a href="https://github.com/racchittt/gen_ai">Get our App!</a>
          
        </div>
      </div>

      {/* Chat Section */}
      <div className="flex flex-col h-full w-[80%] overflow-hidden bg-white">
        <div className="flex flex-col flex-auto h-full p-6">
          <div className="flex flex-col flex-auto flex-shrink-0 bg-gray-100 h-full p-4 rounded-2xl">
            {messages.length === 0 && (
              <div className="flex flex-col items-center justify-center h-full">
                <div className="p-6 rounded-lg flex flex-col items-center text-center">
                  <img src="otter.gif" className="h-40 my-16" alt="" />
                  <h2 className="text-2xl font-semibold mb-2 text-[#0CADB5]">
                    Welcome to chat with Pepo!
                  </h2>
                  <p className="text-gray-600 mb-4">
                    Start a conversation with your therapy bot, or ask a
                    question. We're here to help!
                  </p>
                </div>
              </div>
            )}

            <div className="flex flex-col h-full overflow-x-auto mb-4">
              <div className="flex flex-col h-full">
                <div className="flex flex-col gap-y-2">
                  {messages.map((msg, idx) => (
                    <div
                      key={idx}
                      className={`col-start-${
                        msg.sender === "user" ? "12" : "1"
                      } col-end-${
                        msg.sender === "user" ? "13" : "8"
                      } p-3 rounded-lg`}
                    >
                      <div
                        className={`flex items-center ${
                          msg.sender === "user" ? "justify-end" : ""
                        }`}
                      >
                        {msg.sender === "bot" && (
                          <div className="flex items-center justify-center h-10 w-10 rounded-full bg-[#0CADB5]">
                            <img src="otterChat.png" alt="Bot" />
                          </div>
                        )}
                        <div
                          className={` max-w-[80%] h-full relative ml-3 text-sm ${
                            msg.sender === "user" ? "bg-indigo-100" : "bg-white"
                          } py-2 px-4 shadow rounded-xl`}
                        >
                          <div className="">{msg.message}</div>
                        </div>
                      </div>
                    </div>
                  ))}
                  {/* Loading Animation */}
                  {loading && (
                    <div className="col-start-1 col-end-8 p-3 rounded-lg flex items-center">
                      <div className="flex items-center justify-center h-10 w-10 rounded-full bg-[#0CADB5]">
                        <img src="otter.gif" alt="" />
                      </div>
                      <div className="ml-3 h-10 text-sm py-2 px-4 shadow rounded-xl bg-white">
                        <img src="chatting.gif" className="h-5" alt="loading" />
                      </div>
                    </div>
                  )}
                </div>
              </div>
            </div>
            <div className="flex flex-row items-center rounded-xl bg-white">
              <div className="flex-grow">
                <div className="relative w-full">
                  <input
                    type="text"
                    value={input}
                    onChange={(e) => setInput(e.target.value)}
                    onKeyDown={(e) => {
                      if (e.key === "Enter") {
                        if (e.ctrlKey) {
                          setInput((prev) => prev + "\n");
                        } else {
                          e.preventDefault(); 
                          sendMessage();
                        }
                      }
                    }}
                    className="flex w-full border rounded-xl focus:outline-none focus:border-indigo-300 pl-4 h-10"
                    placeholder="Type your message..."
                    disabled={loading}
                  />
                </div>
              </div>
              <div className="ml-4">
                <button
                  onClick={sendMessage}
                  className="flex items-center justify-center bg-[#0CADB5] hover:bg-[#0CADB5] rounded-xl text-white px-4 py-1 flex-shrink-0"
                  disabled={loading}
                >
                  <span>Send</span>
                  <span className="ml-2">
                    <svg
                      className="w-4 h-4 transform rotate-45 -mt-px"
                      fill="none"
                      stroke="currentColor"
                      viewBox="0 0 24 24"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        strokeLinecap="round"
                        strokeLinejoin="round"
                        strokeWidth="2"
                        d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"
                      />
                    </svg>
                  </span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Modal for Download Prompt */}
      {modalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
          <div className="bg-white rounded-lg p-8 max-w-sm mx-auto text-center">
            <a href="https://github.com/racchittt/gen_ai"><h2 className="text-2xl font-semibold mb-4">Download Our App</h2></a>
            <p className="mb-6">
              To continue chatting, please download our app for the best
              experience.
            </p>
            <div className="flex gap-5 items-center justify-center">
              <a
                href="/download" // Update with your app download link
                className="inline-block bg-[#0CADB5] text-white px-6 py-2 rounded-full hover:bg-[#0CADB5]"
              >
                Download Now
              </a>
              <button
                onClick={closeModal}
                className="text-gray-500 hover:text-gray-700"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Chat;
