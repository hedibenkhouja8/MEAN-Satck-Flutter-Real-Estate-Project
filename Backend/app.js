const express = require('express');
const mongoose = require('mongoose');
const app = express();

mongoose.connect('mongodb://localhost:27017/real_estate',
  { useNewUrlParser: true,
    useUnifiedTopology: true })
  .then(() => console.log('Connected successfully to MongoDB !'))
  .catch(() => console.log('Connection failed to MongoDB !'));
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
  });

app.get('/api/buys', (req, res) => {
    const buys = [
        {
          id: '1',
          title: 'Introduction to Computer Science',
          owner:'hedi',
          description:
            'This course introduces students to the basic concepts of computer science. It covers the basic programming concepts, data structures, and algorithms, and introduces students to the software development process. Students will learn to use a programming language, and to write algorithms in a programming language. This course is a prerequisite for the CS program.',
          image: 'assets/images/work-1.jpg',
            size:100,
            room_number:5,
            location:'bizerte',
          
          price: 500.99,
        
          
        },{
          id: '2',
          title: 'Introduction to Computer Science',
          owner:'hedi',
          description:
            'This course introduces students to the basic concepts of computer science. It covers the basic programming concepts, data structures, and algorithms, and introduces students to the software development process. Students will learn to use a programming language, and to write algorithms in a programming language. This course is a prerequisite for the CS program.',
            image: 'assets/images/work-2.jpg',   size:100,
            room_number:5,
            location:'bizerte',
          
          price: 500.99, 
        },{
          id: '3',
          title: 'Introduction to Computer Science',
          owner:'hedi',
          description:
            'This course introduces students to the basic concepts of computer science. It covers the basic programming concepts, data structures, and algorithms, and introduces students to the software development process. Students will learn to use a programming language, and to write algorithms in a programming language. This course is a prerequisite for the CS program.',
            image: 'assets/images/work-3.jpg',  size:100,
            room_number:5,
            location:'bizerte',
          
          price: 500.99, 
        },{
          id: '4',
          title: 'Introduction to Computer Science',
          owner:'hedi',
          description:
            'This course introduces students to the basic concepts of computer science. It covers the basic programming concepts, data structures, and algorithms, and introduces students to the software development process. Students will learn to use a programming language, and to write algorithms in a programming language. This course is a prerequisite for the CS program.',
            image: 'assets/images/work-4.jpg',  size:100,
            room_number:5,
            location:'bizerte',
          
          price: 500.99, 
        },{
          id: '5',
          title: 'Introduction to Computer Science',
          owner:'hedi',
          description:
            'This course introduces students to the basic concepts of computer science. It covers the basic programming concepts, data structures, and algorithms, and introduces students to the software development process. Students will learn to use a programming language, and to write algorithms in a programming language. This course is a prerequisite for the CS program.',
            image: 'assets/images/work-5.jpg',   size:100,
            room_number:5,
            location:'bizerte',
          
          price: 500.99, 
        },{
          id: '6',
          title: 'Introduction to Computer Science',
          owner:'hedi',
          description:
            'This course introduces students to the basic concepts of computer science. It covers the basic programming concepts, data structures, and algorithms, and introduces students to the software development process. Students will learn to use a programming language, and to write algorithms in a programming language. This course is a prerequisite for the CS program.',
            image: 'assets/images/work-6.jpg',  size:100,
            room_number:5,
            location:'bizerte',
          
          price: 500.99, 
        }
      ];
    res.json(buys);
});
module.exports = app;