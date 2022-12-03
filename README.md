# ETHIndia22
# Decagon



[![Nonagon](https://github.com/yuvaraj-06/Nonagon/blob/main/logo.png?raw=true)](https://github.com/yuvaraj-06/Nonagon/blob/main/logo.png?raw=true)
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# Project Demo


[![Cross Chain Analytics](https://assets.devfolio.co/hackathons/92aad02596384660a3f09b606d311ee7/projects/938c7774a8544c1cb8ab6503395d7c3c/bad0a071-eebd-4227-9fb7-6f2dd6d21ffa.png)](https://youtu.be/smjalXyNptU "Cross Chain Analytics")
####  Click on the image above to watch the demo

# Instructions to run application:


1. Create a python 3.7 virtual environment and proceeed with installation there:
2. Clone this repository cd to folder and install the modules in requirements.txt and run `pip install -r requirements.txt`.
3. To run this project, Open command prompt type 
4. `cd Nonagon/api`
5. Run `python main.py`
6. You can access the Swagger at http://localhost:8080
7. `cd ../Dashboard`
8. Run `python manage.py migrate` first and then `python manage.py runserver`
9. You Can See The Website Live in  http://localhost:8000/
10. Create a new account at the sign up page and avail the services.

# Motivation for the project:

Blockchains produce a lot of data that gets indexed and is sitting on chain. This data is not yet being analysed across dapps and chains to create insights for users, developers and investors. 

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

   <b> Website: </b> Django ,REST APIs 
   
   <b> Blockchains Supported: </b>  ETH,BSC,FANTOM,POLYGON,
   
   <b> API : </b>  Covalent APIs
   
   <b> Machine Learning : </b>  Data Mining Techniques , Pandas
   
 
# Overview of Website:

<img src="mocks/1.png">
<img src="mocks/2.png">
<img src="mocks/3.png">






