<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#!home">iFeElZ</a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="chatRoom.jsp">chatRoom</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Electronics</a></li>
					</ul></li>
				<li><a href="#">products</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<form action="logout" method="post" id=form1></form>
				<%if(null!=session.getAttribute("userName")){%>
				<li><a href=".#!profile"><span
						class="glyphicon glyphicon-user"></span><%=session.getAttribute("userName") %></a></li>
				<%if(null!=session.getAttribute("signup")){%>
				<li><a href="<%=request.getContextPath() %>/logout"><span
						class="glyphicon glyphicon-log-in"></span> Cancel</a></li>
				<%}else{%>
				<li><a href="<%=request.getContextPath() %>/logout"><span
						class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				<%}}else { %>
				<li><a href=".#!signup"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href=".#!login"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<%}%>


			</ul>
		</div>
	</div>
</nav>