# ETHIndia22
# Octagon

<img width="639" alt="Screenshot 2022-12-04 at 8 10 10 AM" src="https://user-images.githubusercontent.com/98009279/205471658-f1bf1964-f94e-4e48-8445-0485ca012b69.png">
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)
# Project Demo


<img width="150" src="https://github.com/shahabh3003/ETHIndia22/blob/hero/assets/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202022-12-04%20at%2007.40.39.png">

<img width="161" alt="Screenshot 2022-12-04 at 7 38 42 AM" src="https://user-images.githubusercontent.com/98009279/205471704-5f07519c-3565-4fb4-a564-ccefb8f662e0.png">
<img width="341" alt="Screenshot 2022-12-04 at 7 38 15 AM" src="https://user-images.githubusercontent.com/98009279/205471710-518635cf-69f5-4bce-a54f-a10e06b2bb4c.png">
<img width="341" alt="Screenshot 2022-12-04 at 7 38 03 AM" src="https://user-images.githubusercontent.com/98009279/205471712-8801ff1b-a707-433d-b434-b223d56f0b9f.png">


####  Click on the image above to watch the demo

# Instructions to run application:


1. Download & Install XCode
2. Git clone this repository
3. Create a build and run on any IOS simulator
4. To see widgets in action inoput the query url as the part of plugin configuration, select the desired type of data to be vizualised on top of widgets and boom🎉.  

# Motivation for the project:

With the rise of data anaytlics dashboards and tech bheind it was lacking innovation on how data is reperseted so the idea of showing on-chain data right away on our phone's widget willl help the users and  decerases the fricition while usimg such dashboards.

We would like to analyse the data available on chain by creating relations across dapps and chains to create insights.

# Overview for the project:

Nonagon is an Analytics dashboard for browsing, discovering, analysing and consuming on chain raw data in the form of information and insights. 

Covalent provides a unified API bringing visibility to billions of Web3 data points, by providing the richest and most robust data infrastructure for the entire Blockchain ecosystem.

We are using covalent apis for retreiving data and then creating relations between web3 dapps across multiple evm chains and providing insights to users into the kind of projects that are being used currently and how the users of Project A are also using Projects B, C and D. This allows users to be aware of their actions and gives them insights into the projects they could also potentially use. 

Another aspect to the use case is we can also let developers unlimit themselves and become aware of the actions and insights of their users and their behaviour.

Investors can also use the analytics dashboard to gain insights into the currencies to swap into, nfts and dapps to invest their funds in and cross chain analytics on popular dapps. 

# Challenges we ran into

We are using covalent apis to get indexed data but the api latency is extremely high due to which we are unable to do real-time wallet and dapp address analysis and thus had to pivot to csv which allows for faster data analysis with better performance, relations and insights. The data present in the apis is also limited and allows for very less information, insights and analytics to be created. 
A potential way make analysis easier and better with indexed data is by onboarding individual dapps and currencies to the platform using sub graphs, index that data in our own databaes and create relations and aggregated data on top of that to create better insights.

# Tech stack and Modules used:

   <b> IOS App: </b> SwiftUI, XCode 
   
   <b> Blockchains Supported: </b>  ETH,BSC,FANTOM,POLYGON,
   
   <b> API : </b>  Covalent APIs, Dune API, Graph API, Push Api







