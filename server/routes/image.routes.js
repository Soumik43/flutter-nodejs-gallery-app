const express = require('express');
const imageRouter = express.Router();
const imageController = require('../controllers/image.controller');
const Image = require('../models/image.model');

// Get all images
imageRouter.get('/images', imageController.getAllImages);

// Get specific image
imageRouter.get('/images/show/:id', imageController.getImage);

// Add new image
imageRouter.post('/images/new', imageController.addImage);

// Delete image
imageRouter.delete('/images/delete/:id', imageController.deleteImage);

// Edit image
imageRouter.put('/images/:id/edit', imageController.editImage);

module.exports = imageRouter;