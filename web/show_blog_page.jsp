<%-- 
    Document   : show_blog_page
    Created on : Mar 18, 2023, 6:27:30 PM
    Author     : Marketyard330S
--%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Comment"%>
<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post p = d.getPostByPostId(postId);


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitile()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background
            {
                clip-path: polygon(50% 0%, 100% 0, 100% 89%, 66% 82%, 28% 89%, 0 80%, 0 0);            }

            .post-title
            {
                font-weight: 100;
                font-size: 30px;
            }
            .post-content
            {
                font-weight: 100;
                font-size: 25px;
            }
            .post-date
            {
                font-style: italic;
                font-weight: bold;
            }
            .user-info
            {
                font-size: 20px;
                font-style: italic;

            }
            .row-user
            {
                border: 1px solid  #e2e2e2;
                padding-top: 15px; 
            }
            body{
                background: url(img/bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

        </style>   

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v16.0" nonce="QM5UGYO6"></script>

</head>
<body>

    <!--stsrt navBar-->

    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="profile.jsp"><spanc class="fa fa-asterisk"></span>TechBlog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>Learn Code With Ashok<span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>Catagories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language </a>
                        <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structure</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#do-post-modal"><span class="fa fa-pencil"></span>Do Post</a>
                </li>




            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!"  data-bs-toggle="modal" data-bs-target="#profile-model"><span class="fa fa-user-circle"></span><%=user.getName()%></a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-power-off"></span>Logout</a>
                </li> 
            </ul>

        </div>
    </nav>


    <!--End of navBar-->

    <!--main content of body-->


    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"><%=p.getpTitile()%></h4> 
                    </div>

                    <div class="card-body">
                        <img class="card-img-top" src="<%=p.getpPic()%>" alt="Card image cap">


                        <div class="row my-3 row-user">
                            <div class="col-md-8">
                                <%
                                    UserDao ud = new UserDao(ConnectionProvider.getConnection());

                                    int id = p.getUserId();
                                    User u = ud.getUserByUserId(id);
                                %>

                                <p class="user-info"><a href="#"><%=u.getName()%></a> has posted</p> 

                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%=p.getpDate().toLocaleString()%></p>

                            </div>


                        </div>
                        <p class="post-content"><%=p.getpContent()%></p>
                        <br>
                        <br>
                        <h4 class=" text center">Code:</h4>
                        <pre class="code"><%=p.getpCode()%></pre>
                    </div>
                    <div class="card-footer primary-background bg-">
                        <%

                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                     int count=0;

                        %>

                        <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>

                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span><%=count %></span></a>
                        <form action="CommentServlet">
                            <div class="input-group mb-3 mt-4">

                                <input type="text" id="comment" class="form-control" placeholder="Comment....." aria-label="Recipient's username" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <a href="#" onclick="doComment(<%=p.getPid()%>,<%=user.getId()%>)" type="submit" class="btn btn-outline-light" type="button">Button</a>

                                </div>
                            </div>
                        </form>


                    </div>
                    <%

                        CommentDao cd = new CommentDao(ConnectionProvider.getConnection());
                        List<Comment> l = cd.getAllComments(p.getPid());
                        
                        for (Comment comment : l) {
                            count++;
                    %>
                    <div class="card w-100">
                        <div class="card-body">
                            
                            <p class="card-text"><%=comment.getComment()%></p>
                            
                        </div>
                    </div>

                    
                        <%
                            }


                        %>

                </div>




            </div>



        </div>


    </div>




    <!--end of main content of body-->




    <!--profile Model-->


    <!-- Modal -->
    <div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background text-white text-center">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">

                    <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px;">
                    <h1 class="modal-title fs-5" id="exampleModalLabel"><%=user.getName()%></h1>

                    <!--Details-->
                    <div id="profile-detail">
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">ID</th>
                                    <td><%=user.getId()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%=user.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td ><%=user.getGender()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Status</th>
                                    <td ><%=user.getAbout()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Register Date</th>
                                    <td ><%=user.getDateTime().toString()%></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!--prifile Edit-->

                    <div id="profile-edit" style="display: none">
                        <h3 class="mt-2">Please Edit Carefully.</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data" > 
                            <table class="table" >
                                <tr>
                                    <td>ID :</td>
                                    <td><%=user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email" class="form-" name="user_email" value="<%=user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="name" class="form-" name="user_name" value="<%=user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="text" class="form-" name="user_password" value="<%=user.getPassword()%>"></td>
                                </tr>
                                <tr>
                                    <td>Gender :</td>
                                    <td><%=user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td>
                                        <textarea rows="3" class="form-control" name="user_about" ><%=user.getAbout()%>
                                        </textarea>

                                    </td>


                                </tr>
                                <tr>
                                    <td>New Profile:</td>
                                    <td>

                                        <input type="file" name="image" class="form-control" >  

                                    </td>


                                </tr>





                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary" >Save</button>

                            </div>


                        </form>


                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!--end of profile model-->

    <!--Post model-->


    <!-- Modal -->
    <div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide post details.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" action="AddPostServlet" method="post" > 
                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled="">---Select Category---</option> 
                                <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = postd.getAllCategories();

                                    for (Category c : list) {
                                %>



                                <option value="<%=c.getCid()%>"><%=c.getName()%></option> 

                                <%
                                    }
                                %>
                            </select>
                        </div>


                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control" />
                        </div>

                        <div class="form-group">
                            <textarea name="pContent" class="form-control" style="height:150px" placeholder="Enter your Content." ></textarea>
                        </div>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" style="height:150px" placeholder="Enter your progarm (If any)" ></textarea>
                        </div>
                        <div class="form-group">
                            <lable>Select your pic..</lable>
                            <input name="pic" type="file"  class="form-control" >  
                        </div>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">Post</button>
                        </div>

                    </form>


                </div>

            </div>
        </div>
    </div>



    <!--End of post model-->




    <!--javascript-->

    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>

    <script>
                                        $(document).ready(function ()
                                        {
                                            let editStatus = false;
                                            $('#edit-profile-button').click(function ()
                                            {
                                                if (editStatus == false)
                                                {
                                                    $("#profile-detail").hide();
                                                    $("#profile-edit").show();
                                                    editStatus = true;
                                                    $(this).text("Back");
                                                } else
                                                {
                                                    $("#profile-detail").show();
                                                    $("#profile-edit").hide();
                                                    editStatus = false;
                                                    $(this).text("Edit");
                                                }



                                            });
                                        });

    </script>

    <!--now add post js-->

    <script>

        $(document).ready(function (e)
        {
            $("#add-post-form").on("submit", function (event)
            {
//                    this code gets called when form is submitted

                event.preventDefault();
                console.log("you have clicked");

                let form = new FormData(this);

//                        now requesting to server

                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR)
                    {
                        //success
                        console.log(data);
                        if (data.trim() === 'done')
                        {
                            swal("Good job!", "Saved Successfully.", "success");
                            $("#do-post-modal").hide();
                        } else
                        {
                            swal("Error", "Something went wrong..", "error");


                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown)
                    {

                    },
                    processData: false,
                    contentType: false




                });

            });
        });




    </script>

    <!--Loading post using ajax-->   

    <script>

        function getPosts(catId, temp)
        {
            $("#loader").show();
            $("#post-container").hide();

            $(".c-link").removeClass("active");
            $.ajax({

                url: "load_posts.jsp",
                data: {cid: catId},
                success: function (data, textStatus, jqXHR)
                {
                    console.log(data);
                    $("#loader").hide();
                    $("#post-container").show();
                    $("#post-container").html(data);
                    $(temp).addClass('active');
                },

            })
        }

        $(document).ready(function (e)
        {
            let allPostRef = $('.c-link')[0]
            getPosts(0, allPostRef);
        });


    </script>






</body>
</html>
