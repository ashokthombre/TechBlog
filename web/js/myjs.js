function doLike(pid,uid)
{
    console.log(pid+"," +uid);
    
    const d={
        uid:uid,
        pid:pid,
        operation:'like'
    }
    $.ajax({
        
        url:"LikeServlet",
        data:d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()=='true')
            {
                let c=$(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error");
        }
      
        
    })
}
function doloadLike(pid,uid)
{
    console.log(pid+"," +uid);
    
    const d={
        uid:uid,
        pid:pid,
        operation:'like'
    }
    $.ajax({
        
        url:"LikeServlet",
        data:d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()=='true')
            {
                let c=$(".like-counter").html();
                c++;
                $('.like-counter').html(c);
               location.href="profile.jsp";
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error");
        }
      
        
    })
}
function doComment(pid,uid)
{
    console.log(pid+"," +uid);
    let c=  $("#comment").val();
    
    const d={
        uid:uid,
        pid:pid,
        c:c,
        operation:'comment'
    }
    $.ajax({
        
        url:"CommentServlet",
        data:d,
        success: function (data, textStatus, jqXHR) {
            
            if(data.trim()=='true')
            {
                location.href="profile.jsp";
            }
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("error");
        }
      
        
    })
}

