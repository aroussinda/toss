const express = require('express')
const app = express()
const multer = require('multer')
const uuid = require('uuid').v4
const fs = require('fs')
const port = 3001 
//blockchain modules 
////////////////////////////////////////
const {ethers} = require('ethers')
const Web3Modal = require('web3modal')
const Web3 = require('web3')
const { create } = require("ipfs-http-client");
const config = require('./config')
const nftaddress = config.nftaddress
const nftmarketaddress = config.nftmarketaddress
const NFT = require('./artifacts/contracts/NFT.sol/NFT.json')
const Market = require('./artifacts/contracts/NFTMarket.sol/NFTMarket.json')
const Tx = require('ethereumjs-tx').Transaction
//////////////////////////////////////////////////////////////
app.use(express.json())
app.use(express.urlencoded({ extended: false }));
//////////////////////////////////////////////////////////////
async function ipfsClient() {
    const ipfs = await create(
        {
            host: "ipfs.infura.io",
            port: 5001,
            protocol: "https"
        }
    );
    return ipfs;
}
////////////////////////////////////////////////////////////////
async function saveFile() {

    let ipfs = await ipfsClient();

    let data = fs.readFileSync("./uploads/"+i+".png")
    let result = await ipfs.add(data);
    let imageurl ='https://ipfs.infura.io/ipfs/'+result.cid.toString()
    return imageurl
    //res.json(result.cid.toString())
}
////////////////////////////////////////////////////////////////
async function savesecondFile(data) {

    let ipfs = await ipfsClient();
    let result = await ipfs.add({path:"url.txt",content:JSON.stringify(data)});
    let imageurl ='https://ipfs.infura.io/ipfs/'+result.cid.toString()
    return imageurl
    //res.json(result.cid.toString())
}
////////////////////////////////////////////////////////////////
const MIME_TYPES = {
    'image/jpg': 'jpg',
    'image/jpeg': 'jpg',
    'image/png': 'png'
};

var i = 1
const storage = multer.diskStorage({
    destination: (req,file,cb) =>
    {
        cb(null,'uploads')
    },
    filename: (req, file, callback) => {
        const name = file.originalname.split(' ').join('_');
        const extension = MIME_TYPES[file.mimetype];
        //i = i +1
        callback(null, +  i + '.' + extension);
         
    }
    
})
////////////////////////////////////////////////////////////////////

const upload = multer({storage})


app.post('/upload',upload.single('image'), (req,res)=>{

 let url = saveFile()
 url.then(function(result){
     let data ={
         name : req.body.name,
         description : req.body.description,
         url:result,
         price : req.body.price,
         privateKey : req.body.privateKey,
         address : req.body.address
     }
     let finaldata = savesecondFile(data)
     finaldata.then(function(result){
         
         console.log(result)
         console.log(data.price)
         console.log(data.privateKey)
         console.log(data.address)
         //createSale(result,data.price,data.address,data.privateKey)
     })
 })
 
 res.json({status : "ok"})
})

///////////////////////////////////////////////////////////////////////
app.get('/upload',(req,res)=>{
   getBalance('0xeA0701825e0bed3dc4B3A47f8bcBA66D2FC42d65') 
    res.json({status : "ok"})
})


/////////////////////////////////////////////////////////////////////////
async function getBalance(account) {
    const rpcURL = "https://rinkeby.infura.io/v3/f4a94012fd1d4b17962965a57f0d7ca1"
    const web3 = new Web3(rpcURL)

    web3.eth.getBalance(account, (err, wei) => {
        balance = web3.utils.fromWei(wei, 'ether')
        res.status(200).json({balance});
      })
}





async function createSale(url,itemprice,account,privateKey) {
 //const web3Modal = new Web3Modal()
 const rpcURL = "https://rinkeby.infura.io/v3/f4a94012fd1d4b17962965a57f0d7ca1"
 const web3 = new Web3(rpcURL)
 //const connection = await web3Modal.connect()
 //const provider = new ethers.providers.Web3Provider(connection)   
 
 //const signer = provider.getSigner()
 

 /* next, create the item */
 //let contract = new ethers.Contract(nftaddress, NFT.abi, signer)
 const contract = new web3.eth.Contract(NFT.abi, nftaddress)
 const transaction1 = contract.methods.createToken(url).encodeABI()
 const account1 = account
const privateKey1 = Buffer.from(privateKey, 'hex')
 //'0xeA0701825e0bed3dc4B3A47f8bcBA66D2FC42d65'
 //35abc0cace40f86944dfb0ca73c818b1092f45835a0e4391383d3d74a97d70e3
 
 web3.eth.getTransactionCount(account1, (err, txCount) => {
//create a transaction object
const txObject = {
 nonce:    web3.utils.toHex(txCount),
 gasLimit: web3.utils.toHex(800000),
 gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei')),
 to: nftaddress,
 data: transaction1,
 
}

//sign the transaction 

const tx = new Tx(txObject, { chain: 'rinkeby' });
tx.sign(privateKey1)
const serializedTx = tx.serialize()
const raw = '0x' + serializedTx.toString('hex')

//broadcast the transaction 
web3.eth.sendSignedTransaction(raw, (err, txHash) => {
 console.log('err:', err, 'txHash:', txHash)
 console.log(tokenId)
 // Use this txHash to find the contract on Etherscan!
})
})
 //let transaction = await contract.createToken(url)


 /*let tx = await transaction
 let event = tx.events[0]
 let value = event.args[2]
 let tokenId = value.toNumber()

 //const price = ethers.utils.parseUnits(itemprice, 'ether')
 const price = web3.utils.toWei(itemprice, 'ether');

 then list the item for sale on the marketplace 
 //contract = new ethers.Contract(nftmarketaddress, Market.abi, signer)
 contract =new web3.eth.Contract(nftmarketaddress,  Market.abi)
 let listingPrice = await contract.methods.getListingPrice()
 listingPrice = listingPrice.toString()

 transaction = await contract.methods.createMarketItem(nftaddress, tokenId, price, { value: listingPrice })
 await transaction.wait()
 */
  }

app.listen(port,()=>{
    console.log("server is up and listening on port 3001")
})



