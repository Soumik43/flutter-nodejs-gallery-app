const mongoose = require('mongoose')

const imageSchema = mongoose.Schema({
    imgName: String,
    imgUrl: String,
    imgDetails: String,
});

const Image = mongoose.model('Image', imageSchema);

module.exports = Image;