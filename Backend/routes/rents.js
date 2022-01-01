const express = require('express');
const router = express.Router();
const rentController = require('./../controllers/rent')

const Rent = require('./../models/Rent');
router.get('/', rentController.all);
router.get('/:id', rentController.get);
router.post('/',  function (req, res,next)  {
    var str1 = new String( "assets/images/" ); 
     console.log(req.body);
    let rent = new Rent({
      title: req.body.title,
      owner: req.body.owner,
      description: req.body.description,
      image:str1.concat(req.body.image.replace(/C:\\fakepath\\/, '')) ,
      
      size: req.body.size,
      room_number: req.body.room_number,
      location: req.body.location,
      price_per_month: req.body.price_per_month,
      start_date_available: req.body.start_date_available,
      end_date_available: req.body.end_date_available
    });
    rent.save()
    .then(() => res.status(201).json({ message: 'Rent created  !',status: 201}))
    .catch(error => res.status(400).json({ error }));
  });

  router.put('/:id',function (req, res,next) {
  
    var str1 = new String( "assets/images/" ); 
    Rent.updateOne({ _id: req.params.id }, { 
      title: req.body.title,
      owner: req.body.owner,
      description: req.body.description,
      image:str1.concat(req.body.image.replace(/C:\\fakepath\\/, '')) ,
      
      size: req.body.size,
      room_number: req.body.room_number,
      location: req.body.location,
      price_per_month: req.body.price_per_month,
    start_date_available:req.body.start_date_available,
end_date_available:req.body.end_date_available })
      .then(() => res.status(200).json({ message: 'Rent updated !'}))
      .catch(error => res.status(400).json({ error }));
  } );
router.delete('/:id', rentController.delete);

module.exports = router;