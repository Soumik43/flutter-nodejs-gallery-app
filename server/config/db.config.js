const mongoose = require('mongoose');

const connectDB = async () => {
    try {
        const mongoConn = await mongoose.connect(process.env.MONGO_URI);
        console.log(`Mongo DB connected ${mongoConn.connection.host}`);
    } catch (err) {
        console.log(err);
    }
}

module.exports = connectDB;