module.exports.throw404 = (req, res, next) => {
  res.status(404).json({ success: false, message: "Route not found" });
};

module.exports.throwError = (error, req, res, next) => {
  console.log(error);
  const status = error.httpStatusCode || 500;
  res.status(status).json({
    message: error.message,
    name: error.name,
    data: error.data
  });
};
