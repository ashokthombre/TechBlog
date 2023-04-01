<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">

<%
   User user=(User)session.getAttribute("currentUser");
    Thread.sleep(100);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post> posts=null;
   if(cid==0)
   {
         posts = d.getAllPosts();
   }
   else
   {
       posts=d.getPostByCatId(cid);
   }
   if(posts.size()==0)
   {
       out.println("<h3 class='display-3 text-center' style='text-white'>No Posts in this Category</h3>");
   }
   

    for (Post p : posts) {

%>
<div class="col-md-6 mt-2" >
    
    <div class="card">
        <img class="card-img-top" src="<%=p.getpPic()%>" alt="Card image cap">
        <div class="card-body">
            <b><%=p.getpTitile()%></b>
       
            <b><%=p.getpContent()%></b>
           
            <div class="card-footer primary-background bg-">
                <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More..</a>
                <%
                
                LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                
                 
                %>
                
                <a href="#!" onclick="doloadLike(<%=p.getPid()%>,<%=user.getId()%>)"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
            </div>
          
            
            
        </div>
        
        
    </div>
    
    
    
    </div>


           

<%        }


%>
</div> 
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
