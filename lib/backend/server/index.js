const express = require('express');
const axios = require('axios');
const cors = require("cors");
const app = express();
const port = process.env.PORT || 3000;

app.use(cors());

const header = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE"
}


//////////////
//          //
//  LISTEN  //
//          //
//////////////

app.listen(port, () => {
    console.log("App listening on port " + port);
})



////////////
//        //
//   GET  //
//        //
////////////

app.get('/welcome', (req, res) => {

    axios
        .get('https://www.thunderclient.com/welcome')
        .then(answer => {
            console.log(`statusCode: ${answer.status}\n`);
            res.status(200).header(header).send(answer.data);
        })
        .catch(error => {
            console.log(`statusCode: 404\n`);
            res.status(404).send("Failed");
        });
})