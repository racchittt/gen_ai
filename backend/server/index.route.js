const express = require("express");
const router = express.Router();

router.get("/health-check",(req,res) => { res.send({message:"ok"})})

router.use("/chat", require("./chat/chat.route"));
router.use("/community", require("./community/community.route"))

module.exports = router;