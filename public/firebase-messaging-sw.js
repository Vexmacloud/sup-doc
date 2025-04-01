// self.addEventListener("install", function (event) {
//     console.log("Service Worker installing...");
//     event.waitUntil(
//         (async () => {
//             try {
//                 console.log("Loading external scripts...");
//                 await self.importScripts(
//                     "https://www.gstatic.com/firebasejs/10.4.0/firebase-app-compat.js",
//                     "https://www.gstatic.com/firebasejs/10.4.0/firebase-messaging-compat.js"
//                 );

//                 console.log("External scripts loaded successfully.");
//                 const firebaseConfig = {
//                     apiKey: "AIzaSyBpBZdrB7--4pEvciWnyK0bB9FA1TSE5Js",
//                     authDomain: "eeee-elvish-bhai.firebaseapp.com",
//                     projectId: "eeee-elvish-bhai",
//                     storageBucket: "eeee-elvish-bhai.appspot.com",
//                     messagingSenderId: "86564333714",
//                     appId: "1:86564333714:web:509fa77e5fa708a3811e4b",
//                     measurementId: "G-DPXPLSWGKQ",
//                 };
//                 firebase.initializeApp(firebaseConfig);
//                 const messaging = firebase.messaging();
//                 console.log("eeeeeee elvish bhai");

//                 // Use getToken from the messaging instance
//                 const currentToken = await messaging.getToken({
//                     vapidKey:
//                         "BHYO_aNScX__OkvDG-gmkHLJiIqegRyZJzWAbIQtqCMd_sFbyfFwz1ncYfqisfvlGY7n",
//                 });
//                 console.log(currentToken);
//                 alert(currentToken);
//             } catch (error) {
//                 console.error("Error Generated:", error);
//             }
//         })()
//     );
// });
importScripts('https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.3.2/firebase-messaging.js');
   
firebase.initializeApp({
  apiKey: "AIzaSyBY3macSEyW_4Z5EoK3DXo_jsUGWQA1mek",
  authDomain: "vexmacloud-38e99.firebaseapp.com",
  projectId: "vexmacloud-38e99",
  storageBucket: "vexmacloud-38e99.appspot.com",
  messagingSenderId: "44992656871",
  appId: "1:44992656871:web:c48259320d175f89e47942",
  measurementId: "G-PVSVHJHM6Z"
});
  
const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function({data:{title,body,icon}}) {
    console.log('title',title);
    return self.registration.showNotification(title,{body,icon});
});