const express = require('express');
const Buy = require('./../models/Buy');

const router = express.Router();
const buyController = require('./../controllers/buy')
const MIME_TYPE_MAP = {
  'image/png': 'png',
  'image/jpeg': 'jpg',
  'image/jpg': 'jpg'
};
const multer  = require('multer')
const storage = multer.diskStorage({
  //destination for files
  destination: function (request, file, callback) {
    callback(null, './uploads');
  },

  //add back the extension
  filename: function (request, file, callback) {
    callback(null, Date.now() + file.originalname);
  },
});

//upload parameters for multer
const upload = multer({
  storage: storage,
  limits: {
    fieldSize: 1024 * 1024 * 3,
  },
});
/*
  router.post("/", multer({storage:storageEvents}).single("event_img") ,function (req, res, next) {
      console.log(req.file);
    const buy = new Buy({
      ...req.body,
      
    });
    buy.save()
      .then(() => res.status(201).json({ message: 'Buy created  !',status: 201}))
      .catch(error => res.status(400).json({ error }));
      console.log(buy.image);});
 router.post('/:id/events',auth,multer({storage:storageEvents}).single("event_img") ,(req, res, next) => {
        const event = {
            event_id: mongoose.Types.ObjectId().toString(),
            event_name: req.body.event_name,
            event_date: req.body.event_date,
            event_img: req.file.filename,
        }
        club.updateOne({'_id':req.body.club_id},{'$push':{'events':event}})
        .then(AddedEvent => res.json(AddedEvent));
    });
    router.post('/',  function (req, res,next)  {
      var str1 = new String( "assets/images/" ); 
       console.log(req.body);
      let buy = new Buy({
        title: req.body.title,
        owner: req.body.owner,
        description: req.body.description,
        image:str1.concat(req.body.image.replace(/C:\\fakepath\\/, '')) ,
        
        size: req.body.size,
        room_number: req.body.room_number,
        location: req.body.location,
        price: req.body.price
      });
    buy.image.replace(/C:\\fakepath\\/, '');
      buy.save()
      .then(() => res.status(201).json({ message: 'Buy created  !',status: 201}))
      .catch(error => res.status(400).json({ error }));
    });*/
    
router.get('/', buyController.all);
router.get('/:id', buyController.get);
//router.post('/', upload.single('image'), buyController.create);

/* router.put('/:id',function (req, res,next) {
  
  var str1 = new String( "assets/images/" ); 
  Buy.updateOne({ _id: req.params.id }, { 
    title: req.body.title,
    owner: req.body.owner,
    description: req.body.description,
    image:str1.concat(req.body.image.replace(/C:\\fakepath\\/, '')) ,
    
    size: req.body.size,
    room_number: req.body.room_number,
    location: req.body.location,
    price: req.body.price, _id: req.params.id })
    .then(() => res.status(200).json({ message: 'Buy updated !'}))
    .catch(error => res.status(400).json({ error }));
} );
*/
router.delete('/:id', buyController.delete);

module.exports = router;
