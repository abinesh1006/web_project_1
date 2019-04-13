<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.userBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
 <link href="mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>

<% if(null!=session.getAttribute("userSession")){
  userBean name= (userBean)session.getAttribute("login_user");
     request.setAttribute("name", name.getFirstName());
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