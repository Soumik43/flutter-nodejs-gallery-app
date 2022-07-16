const Image = require('../models/image.model')

module.exports.getAllImages = function getAllImages(req, res) {
    try {
        Image.find({}, (err, data) => {
            if (!err)
                res.json(data);
        });
    } catch (err) {
        res.json(err);
        console.log(err);
    }
}

module.exports.getImage = function getImage(req, res) {
    try {
        Image.findById(req.params.id, (err, data) => {
            if (!err)
                res.json(data);
        });
    } catch (err) {
        res.json(err);
        console.log(err);
    }
}

module.exports.addImage = function addImage(req, res) {
    try {
        let newImage = new Image({
            imgName: req.body.imgName,
            imgUrl: req.body.imgUrl,
            imgDetails: req.body.imgDetails,
        });
        newImage.save((err, data) => {
            if (!err)
                res.json({
                    imageAdded: true,
                    imageAddedData: data,
                });
        });
    } catch (err) {
        res.json({
            imageAdded: false,
            err: err,
        });
        console.log(err);
    }
}

module.exports.deleteImage = function deleteImage(req, res) {
    const imageId = req.params.id;
    try {
        Image.findByIdAndDelete(imageId, (err, data) => {
            if (!err)
                res.json({
                    deleted: true,
                    deletedImage: data,
                });
        });
    } catch (err) {
        res.json({
            deleted: false,
            err: err,
        });
        console.log(err);
    }
}

module.exports.editImage = function editImage(req, res) {
    const imageId = req.params.id;
    let newImage = {
        imgName: req.body.imgName,
        imgUrl: req.body.imgUrl,
        imgDetails: req.body.imgDetails,
    }
    try {
        Image.findByIdAndUpdate(imageId, { $set: newImage }, { new: true }, (err, data) => {
            if (!err)
                res.json({
                    updated: true,
                    updatedImage: data
                });
        })
    } catch (err) {
        res.json({
            updated: false,
            err: err
        });
        console.log(err);
    }
}