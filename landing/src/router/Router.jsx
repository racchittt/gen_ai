import React from "react";
import { Routes, Route } from "react-router-dom";
import Home from "../pages/Home";
import Chat from "../pages/Chat";

const Router = () => {
  return (
    <>
      <Routes>
        <Route exact path="/chat" element={<Chat />} />
        <Route exact path="/" element={<Home />} />
      </Routes>
    </>
  );
};

export default Router;
