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

app.get('/cat/:c', (req, res) => {
    const { c } = req.params;
    axios
        .get('https://inshorts.deta.dev/news?category=' + c)
        .then(answer => {
            x = answer.data;
            res.status(200).header(header).send(x);
        })
        .catch(error => {
            console.log(`statusCode: 404\n`);
            res.status(404).send("Failed");
        });
})
app.get('/noti', (req, res) => {
    axios
        .get('https://newsapi.org/v2/everything?q=india&from=2023-01-17&sortBy=publishedAt&apiKey=c939257a6df04d6e8dbfb99ee1aa0842')
        .then(answer => {
            res.status(200).header(header).send(answer.data['articles'][0]);
        })
        .catch(error => {
            console.log(`statusCode: 404\n`);
            res.status(404).send("Failed");
        });
})

app.get('/saved/:s/:c/:id', (req, res) => {
    const { c } = req.params;
    const { id } = req.params;
    const { s } = req.params;
    flag = false;
    axios
        .get(c == 'all' ? 'https://saurav.tech/NewsAPI/everything/' + s + '.json' : 'https://saurav.tech/NewsAPI/top-headlines/category/' + c + '/in.json')
        .then(answer => {
            x = answer.data['articles'];
            for (i = 0; i < x.length; i++) {
                if (x[i]['publishedAt'] == id) {
                    flag = true;
                    break;
                }
            }
            res.status(200).header(header).send(!flag ? 'failed' : 'success');
        })
        .catch(error => {
            console.log(`statusCode: 404\n`);
            res.status(404).send("Failed");
        });
})