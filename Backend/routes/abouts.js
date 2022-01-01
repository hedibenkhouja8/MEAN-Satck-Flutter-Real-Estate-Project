const express = require('express');
const router = express.Router();
const aboutController = require('./../controllers/about')

const About = require('./../models/About');
router.get('/', aboutController.all);
router.get('/:id', aboutController.get);

router.post('/',  function (req, res,next)  {
    var str1 = new String( "assets/images/" ); 
     console.log(req.body);
    let about = new About({
      owner: req.body.owner,
      mail: req.body.mail,
      phone: req.body.phone, 
      image_owner:str1.concat(req.body.image_owner.replace(/C:\\fakepath\\/, '')),
      location: req.body.location,
      image_location: str1.concat(req.body.image_location.replace(/C:\\fakepath\\/, '')),
      description: req.body.description,
      
      siege_social: req.body.siege_social,
      date_creation: req.body.date_creation,
      horaire: req.body.horaire,
     
    });
    about.save()
    .then(() => res.status(201).json({ message: 'About created  !',status: 201}))
    .catch(error => res.status(400).json({ error }));
  });
  
 router.put('/:id',function (req, res,next) {
  
    var str1 = new String( "assets/images/" ); 
    About.updateOne({ _id: req.params.id }, 
        {
            owner: req.body.owner,
            mail: req.body.mail,
            phone: req.body.phone, 
            image_owner:str1.concat(req.body.image_owner.replace(/C:\\fakepath\\/, '')),
            location: req.body.location,
            image_location: str1.concat(req.body.image_location.replace(/C:\\fakepath\\/, '')),
            description: req.body.description,
            
            siege_social: req.body.siege_social,
            date_creation: req.body.date_creation,
            horaire: req.body.horaire,})
      .then(() => res.status(200).json({ message: 'About updated !'}))
      .catch(error => res.status(400).json({ error }));
  } );
router.delete('/:id', aboutController.delete);

module.exports = router;