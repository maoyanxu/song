<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
	System.out.println(basePath);
%>
<!DOCTYPE html>
  <html lang="en">
   <head>
     <meta charset="UTF-8">
       <meta name="viewport"
             content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
       <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <title>Document</title>
    <style>
         .kuang{
             display: inline-block;
              vertical-align: middle;
              box-shadow: inset 0px 1px 20px 5px #ddd;
            text-align: left;
             margin-right: 20px;
             margin-bottom: 20px;
             width: 165px;
             height: 165px;
        }
         .addhao{
            width: 165px;
             height: 165px;
            background: url(../img/add_photo_plus.png);
        }
         .on{
            display: inline-block;
             text-align: left;
             margin-right: 20px;
             margin-bottom: 20px;
             width: 165px;
             height: 165px;
             display: none;
             position: relative;
            overflow: hidden;
            line-height: 200px;
        }
         .xian{
            width: 165px;
             height: 165px;
             position: absolute;
            background-image: linear-gradient(
                    0deg,
                    rgba(0,0,0,0.7) 50%,
                    transparent 50%
            );
             background-size: 165px 4px;
            display: none;
            z-index: 2;
         }
        .chahao{
            position: absolute;
            width: 60px;
             height: 60px;
            background: url(../img/ico_02.png);
             background-position: -171px -158px;
            top: 52.5px;
             left: 52.5px;
             display: none;
             z-index: 2;
         }
        .on img{
             width: 100%;
            height: auto;
           position: absolute;
           left: 0;
             right: 0;
            top: 0;
            bottom: 0;
             margin:auto;
         }
        .kuang input{
            width: 164px;
             height: 164px;
             opacity: 0;
         }
        .button{
             width: 500px;
             height: 36px;
            margin: 0 auto;
             
         }
        .button .set{
             float: left;
             width: 216px;
            height: 36px;
           background: #ddd;
            text-align: center;
            position: relative;
        }
        .set input{
             width: 216px;
            height: 36px;
           opacity: 0;
           position: absolute;
             top: 0;
            left: 0;
         }
         .button .next{
            float: right;
             width: 216px;
            height: 36px;
             background: red;
             color: white;
       }
       .bigk{
            width: 1000px;
            margin: 0 auto;
           text-align: center;
        }
     </style>
     <script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
 </head>
 <body>
 <div class="bigk">
     
        
       <div class="kuang">
             <div class="addhao">
            <img  src="<%=basePath%>img/java.png" width="165px" height="165px">
            </div>
             <div class="on">
                 <div class="xian"></div>
               <div class="chahao"></div>
           </div>
         </div>
       <div class="kuang">
             <div class="addhao">
                 <img  src="<%=basePath%>img/java1.png" width="165px" height="165px">
            </div>
             <div class="on">
                 <div class="xian"></div>
               <div class="chahao"></div>
           </div>
         </div>
       <div class="kuang">
             <div class="addhao">
                 <input type="file" name="" class="fileinput">
            </div>
             <div class="on">
                 <div class="xian"></div>
               <div class="chahao"></div>
           </div>
         </div><br>
            <div class="kuang">
             <div class="addhao">
                 <input type="file" name="" class="fileinput">
            </div>
             <div class="on">
                 <div class="xian"></div>
               <div class="chahao"></div>
           </div>
         </div>   <div class="kuang">
             <div class="addhao">
                 <input type="file" name="" class="fileinput">
            </div>
             <div class="on">
                 <div class="xian"></div>
               <div class="chahao"></div>
           </div>
         </div>   <div class="kuang">
             <div class="addhao">
                 <input type="file" name="" class="fileinput">
            </div>
             <div class="on">
                 <div class="xian"></div>
               <div class="chahao"></div>
           </div>
         </div>
         
         <h1>菜鸟系统资料面板</h1><br>
         <div class="button" >
             <a href=""><div class="set">上传<input type="file" name="" multiple="multiple" id="piliang"></div></a>
             <a href="" class="next">限制张数</a>
        </div>
     </div>
 </div>
 </div>
 <script>
 // 单张上传照片  删除照片
 $(" .fileinput").change(function () {
      var file = this.files[0];
     readFile(file,$(this).parent().siblings(".on"));
 });
 $(".on").mouseover(function () {
      $(this).children(".xian").show();
   $(this).children(".chahao").show();
 
});
 $(".on").mouseleave(function () {
     $(this).children(".xian").hide();
      $(this).children(".chahao").hide();
 });
 $(".chahao").click(function () {
     $(this).next().remove();
     $(".xian").hide();
     $(".chahao").hide();
   $(this).parent().hide();
      $(this).parent().siblings(".addhao").show();
      $(this).parent().siblings(".addhao").children().val("");

 });
 var on =document.querySelector(".on");
 //    需要把阅读的文件传进来file element是把读取到的内容放入的容器
 function readFile(file,element) {
//        新建阅读器
 var reader = new FileReader();
 //        根据文件类型选择阅读方式
switch (file.type){
case 'image/jpg':
case 'image/png':
 case 'image/jpeg':
 case 'image/gif':
 reader.readAsDataURL(file);
break;
 }
 //        当文件阅读结束后执行的方法
 reader.addEventListener('load',function () {
 //         如果说让读取的文件显示的话 还是需要通过文件的类型创建不同的标签
 switch (file.type){
     case 'image/jpg':
     case 'image/png':
    case 'image/jpeg':
     case 'image/gif':
     var img = document.createElement('img');
     img.src = reader.result;
    element.append(img);
    element.siblings(".addhao").hide();
    element.show();
    break;
   }
   });
 }
 // 批量上传部分
 var piliang = document.querySelector('#piliang');
 var on = $(".on");
 piliang.addEventListener('change',function () {
 for (var i = 0;i < this.files.length;i++){
 var file = this.files[i];
 on.eq(i).children(".chahao").next().remove();
 readFile(file,on.eq(i));
 }
 });
 //
 var on = $(".on");
 $(".next").click(function () {
   for (var i = 0; i < 10; i++) {
   console.log(on[i].childNodes.length);
    if (on[i].childNodes.length==6){
 //这个判断就是说明里面有多少个孩子，孩子不够数，不会生成相册
      }else{
           alert("上传照片不足3张");
         $(".next").attr("href","javascript:void(0)");
            return
           }
      $(".next").attr("href","生成相册.html");
    }
 });
 </script>
 </body>
 </html>
