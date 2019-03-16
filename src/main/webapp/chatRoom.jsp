<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <style>
    html {
      height: 100%;
    }
    body {
      margin: 0;
      padding: 0 5px;
      display: flex;
      align-items: right;
      flex-direction: column;
      background: rgba(99,99,191,.07);
      font-family: -apple-system, BlinkMacSystemFont, sans-serif;
    }
    .input-area {
      display: flex;
      flex-direction: column;
      border-bottom: 1px solid rgba(99,99,191,0.25);
      padding-bottom: 5px;
      margin-bottom: 5px;
      width: 50%;
      max-width: 700px;
    }
    textarea {
      background: white;
      margin-bottom: 5px;
      padding: 10px;
      font-size: 15px;
      border-radius: 12px;
      border: none;
      outline: none;
      border-bottom: 3px solid rgba(99,99,191,0.25);
      resize: none;
      flex-shrink: 0;
    }
   button {
      padding: 5px;
      background: white;
      border: none;
      font-size: 17px;
      border-radius: 12px;
      cursor: pointer;
      outline: none;
      border-bottom: 3px solid rgba(99,99,191,0.25);
      flex-shrink: 0;
    }
   button:hover {
      background: rgba(99, 99, 191, 0.06);
    }
   button:active {
      background: rgba(99, 99, 191, 0.10);
    }
    .submit{
     padding: 5px;
      background: white;
      border: none;
      font-size: 17px;
      border-radius: 12px;
      cursor: pointer;
      outline: none;
      border-bottom: 3px solid rgba(99,99,191,0.25);
      flex-shrink: 0;
    }
    .submit:active{
    	 background: rgba(99, 99, 191, 0.10);
    }
    .info {
      margin: 5px;
      color: #6363bf;
    }
    .feed {
      width: 50%;
      max-width: 700px;
    }
    .feed-item {
      background: white;
      margin-bottom: 5px;
      padding: 5px;
      font-size: 15px;
      border-radius: 12px;
      color: black;
      border-bottom: 3px solid rgba(99,99,191,0.25);
      
      line-height: 1;
    }
  </style>
</head>
<body>


<% HttpSession session2 = request.getSession(false); %>
<% if(null!=session2.getAttribute("userSession")){
  String name= session2.getAttribute("firstName").toString();
     request.setAttribute("name", name);
    }
else{
    response.sendRedirect(".#!/login");
    }
%>

  <div class="input-area">
    <textarea rows="1" cols="2" placeholder="Hi <%=request.getAttribute("name") %>, Say Something.."></textarea>
    <button id="button">Send message</button>
    <form  action="logout" method="post" id=form1>
     </form>
     <button type="submit" form="form1" value="Logout">Logout</button>
  </div>
  
  <div class="feed"></div>
  
  <script src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
  <script>
  
  const CHANNEL_ID = '1ffLe1psyxTjtAdD';
  const drone = new Scaledrone(CHANNEL_ID);

  drone.on('open', error => {
    if (error) {
      return console.error(error);
    }});

  drone.on('close', event => console.log('Connection was closed', event));
  drone.on('error', error => console.error(error));

  const room = drone.subscribe('feed', {
    historyCount: 1000 // ask for the 100 latest messages from history
  });

  room.on('history_message', ({data}) => {
    console.log(data);
    addFeedItemToTop(data);
  });

  room.on('data', data => {
    console.log(data);
    addFeedItemToTop(data);
  });

  //------------- DOM STUFF

  const DOM = {
    submitButton: document.querySelector('button'),
    textarea: document.querySelector('textarea'),
    feed: document.querySelector('.feed'),
  };

  DOM.submitButton.addEventListener('click', sendMessage);
	function sendMessage() {
    const value = "<%=request.getAttribute("name")%>:  "+DOM.textarea.value;
    if (!value) {
      return;
    }
    drone.publish({
      room: 'feed',
      
      message: {
        feedMessage: value,
  
      },
    });
    DOM.textarea.value = '';
  }

  function addFeedItemToTop(item) {
    DOM.feed.insertBefore(createFeedItem(item), DOM.feed.firstChild);
  }

 
  function createFeedItem(item) {
    const {feedMessage, color} = item;
    const el = document.createElement('div');
    el.appendChild(document.createTextNode(feedMessage));
    el.style.borderBottomColor = "#334425";
    el.className = 'feed-item';
    return el;
  }
  
</script>
</body>
</html>