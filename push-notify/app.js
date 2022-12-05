const PushAPI = require("@pushprotocol/restapi");
const express = require('express');

const app = express();

// port = process.env.PORT || 3000;

// app.listen(port);

// console.log('RESTfull API server started on: ' + port);

const getSubscriptions = async (address) => {
    //const addressInCAIP = 'eip155:5:' + address;
    //console.log(addressInCAIP);
    const channelsData = await PushAPI.channels.getChannel({
        channel: address, // user address in CAIP
        env: 'staging'
    });
    console.log(channelsData);
}

const fetchPushData = async () => {
    try {
        const subscriptions = await PushAPI.user.getSubscriptions({
            user: 'eip155:5:0xD8634C39BBFd4033c0d3289C4515275102423681', // user address in CAIP
            env: 'staging'
        });
        console.log("Subscriptions \n \n", subscriptions)
        subscriptions.forEach((element, idx) => {
            console.log(element.channel);
            //getSubscriptions(element.channel);
            idx === 1 ? null : getSubscriptions(element.channel);
        });
        // getSubscriptions("0x6cd92Fd63f2f65069F8EEa541Eb9865058b0dC68")
    } catch (err) {
        console.log(err);
    }
    try {
        const notifications = await PushAPI.user.getFeeds({
            user: 'eip155:5:0xD8634C39BBFd4033c0d3289C4515275102423681', // user address in CAIP
            env: 'staging'
        });
        console.log("Notifications \n \n", notifications)
    } catch (err) {
        console.log(err)
    }

    try {
        const spams = await PushAPI.user.getFeeds({
            user: 'eip155:5:0xD8634C39BBFd4033c0d3289C4515275102423681', // user address in CAIP
            spam: true,
            env: 'staging'
        });

        console.log('Spams: \n\n', spams);
    } catch (err) {
        console.log(err)
    }
}

fetchPushData()

// const makeRequest = async (query_url) => {
//     let headersList = {
//         "Accept": "*/*",
//         "User-Agent": "Thunder Client (https://www.thunderclient.com)"
//     }
//     let response = await fetch(url, {
//         method: "GET",
//         headers: headersList
//     }).then(await response.text());
//     if (data != null) {
//         fetchSpam(data.user_address);
//     }
// }