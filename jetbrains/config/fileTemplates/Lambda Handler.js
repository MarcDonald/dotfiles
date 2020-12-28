const response = {
  headers: { 'content-type': 'application/json' },
  statusCode: 500
}

module.exports = (dependencies) => async (event) => {
    return response;
};