module.exports.get404 = (req, res, next) => {
  res.status(404).json({ success: false, message: "Route not found" });
};

module.exports.get500 = (req, res, next) => {
  res.status(500).json({ success: false, message: "Internal server error" });
};
