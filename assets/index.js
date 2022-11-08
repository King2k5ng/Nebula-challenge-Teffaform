window.onload = function () {

  let popUp = document.getElementById("popUp")

  popUp.style.display = "block"

  let myIp = null

  let btn = document.getElementsByClassName("register")[0]

  let greet = document.getElementById('client_greet')

  const getIp = () => {
    fetch("http://www.geoplugin.net/json.gp")
    .then(res=>res.json())
    .then(({geoplugin_request})=>{
        myIp = geoplugin_request ?? "Oops Cant locate you!"
    })
    .catch(new Error)
  }
  getIp()
  btn.onclick =  () => {
    let username_v = document.getElementById("username").value
    let username =  username_v.length ? username_v : "Unknown"
    greet.innerText = `Hello ${username}, your IP address is ${myIp}`
    popUp.style.display = "none";
  };
};
