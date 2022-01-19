//첨부파일 업로드
$(document).ready(function(){
    var fileTarget = $('.filebox .upload-hidden');
  
      fileTarget.on('change', function(){
          if(window.FileReader){
              var filename = $(this)[0].files[0].name;
          } else {
              var filename = $(this).val().split('/').pop().split('\\').pop();
          }
  
          $(this).siblings('.upload-name').val(filename);
      });
  }); 
  



//  팝업
$( document ).ready(function() { 
    $('.btnType').click(function(){ 
     $('#popup, #overlay_t').show(); 
     //$('#popup').css("top", Math.max(0, $(window).scrollTop() + 0 ) + "px"); 
     //$('#popup_layer').css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px"); 
 }); 
 $('#overlay_t, .confirm_btn').click(function(e){ 
     e.preventDefault(); 
     $('#popup, #overlay_t').hide(); 
 }); 
});


// 페이지 인디케이터 컨트롤
$(document).ready(function(){
$('.page-indicator > ul > li > a').click(function(e) {
    var href = $(this).attr('href');
    
    var targetTop = $(href).offset().top;
    
    //한번에 가도록 하는 방법
    $(window).scrollTop(targetTop);
    
    $('html').stop().animate({scrollTop:targetTop}, 300);
    
    e.preventDefault();
});

function Page__updateIndicatorActive() {
    var scrollTop = $(window).scrollTop();
    
    // 역순으로 검색해야 편하다
    $($('.page').get().reverse()).each(function(index, node) {
        var $node = $(this);
        var offsetTop = parseInt($node.attr('data-offset-top'));
        
        if ( scrollTop >= offsetTop ) {
            // 기존 녀석에게 활성화 풀고
            $('.page-indicator > ul > li a.active').removeClass('active');
            // 해당하는 녀석에게 활성화 넣고
            
            var currentPageIndex = $node.index();
            $('.page-indicator > ul > li a').eq(currentPageIndex).addClass('active');
            
            $('html').attr('data-current-page-index', currentPageIndex);
            
            return false; // 더 이상 다른 페이지를 검사하지 않는다.
        }
    });
}

// 각 페이지의 offsetTop 속성을 업데이트
function Page__updateOffsetTop() {
    
    $('.page').each(function(index, node) {
        var $page = $(node);
        var offsetTop = $page.offset().top;
        
        $page.attr('data-offset-top', offsetTop);
    });
    
    // 계산이 바뀌었으니까, 다시 상태 업데이트
    Page__updateIndicatorActive();
}

function Page__init() {
    Page__updateOffsetTop();
}

// 초기화
Page__init();

// 화면이 리사이즈 할 때 마다, offsetTop을 다시계산
$(window).resize(Page__updateOffsetTop);

// 스크롤이 될 때 마다, 인디케이터의 상태를 갱신
$(window).scroll(Page__updateIndicatorActive);

}); 
  


// nav 메뉴 제이쿼리
$( document ).ready(function() { 
    $("#nav .dept1_li").on("mouseenter mouseleave",function(e){
        var $gnb = $("#nav");
        if(e.type == "mouseenter"){
        $gnb.stop().css({'background':'#ffffff'}).css({'box-shadow':'0px 0px 20px rgba(0,0,0,0.1)'}).animate({'height':'394px'},100);
        }
    });
    $("#nav .nav_wr").on("mouseenter mouseleave",function(e){
        var $gnb = $("#nav");
        if(e.type == "mouseleave"){
            $gnb.stop().css({'background':'transparent'}).css({'box-shadow':'none'}).animate({'height':'114px'},100);
        }
    });


    // nav 호버시 로고 변경
    $("#nav .dept1_li").mouseenter(function(){
        $("#logo1").hide();
        $("#logo2").show();
    });
    $("#nav .nav_wr").mouseleave(function(){
        $("#logo1").show();
        $("#logo2").hide();
    });

    
    // nav 호버시 #nav .dept1_a 컬러 변경
    $("#nav .dept1_li").mouseenter(function(){
        $("#nav .dept1_a").addClass('on');
    });
    $("#nav .nav_wr").mouseleave(function(){
        $("#nav .dept1_a ").removeClass('on');
    });


    //1뎁스 클래스
    $(".dept1 > li").mouseenter(function(){
        $(this).addClass('active').siblings().removeClass('active');
    });
    $(".dept1 > li").mouseleave(function(){
        $(this).removeClass('active');
    });

});

        
  
// 스크롤 시 페이지 인디케이터 컬러 변경(화이트->블랙)
$(document).ready(function(){
    $(window).scroll(function(){
      var scroll = $(window).scrollTop();
      if (scroll > 1) {
        $(".border_s").css("background" , "#333333");
      }
      else{
        $(".border_s").css("background" , "#ffffff");   
      }
    })
  });   

//   $(document).ready(function(){
//     $('#page-5').mouseenter(function(){
//         $('.border_s').css("background" , "#ffffff");
//       });
//     $('#page-5').mouseleave(function(){
//         $('.border_s').css("background" , "#333333");
//     });
//   });

// sub2-2 편리해랑 tab 


/**
 * 펼침/닫힘
 */

    beforeMenu = "show1";  /* 이전에 펼쳐진 div */
    beforeMenuDisplay = "con_show1";  /* 이전에 펼쳐진 div 화면 */

    function fnShow(curr){

    if(curr != beforeMenu){

        if(beforeMenu!="" && beforeMenu!=curr) {
        document.getElementById(beforeMenu).className = "";
        }

        beforeMenu = curr;

        thisMenu = document.getElementById(curr).style;
        thisMenu2 = document.getElementById(curr);

        if(thisMenu2.className == "on"){
        thisMenu2.className = "";
        }else{
        thisMenu2.className = "on";
        }

        /**
         * 하위 확인
         */

        displaymenu = "con_"+curr;

        if(beforeMenuDisplay!="" && beforeMenuDisplay!=displaymenu) {
        document.getElementById(beforeMenuDisplay).style.display = "none";
        }

        beforeMenuDisplay = displaymenu;

        thisMenu = document.getElementById(displaymenu).style;
        thisMenu2 = document.getElementById(displaymenu);

        if(thisMenu.display == "block"){
        thisMenu.display = "none";
        }else{
        thisMenu.display = "block";
        }

    }

    }




/*Tabs*/
// Depth1
$(document).ready(function(){
    $('.tab_menu > a').on('click', function(){
        $(this).siblings().removeClass('on');
        $(this).addClass('on');
        $(this).parent().siblings('.tab_container').children('.tab_content').removeClass('on');
        $(this).parent().siblings('.tab_container').children('.tab_content').eq( $(this).index() ).addClass('on');
    });
    // Depth2
    $('.depth2 > li').on('click', function(){
        $(this).siblings().removeClass('on');
        $(this).addClass('on');
        $(this).children('.depth2_cont').show();
        $(this).parent().siblings('.tab_item_list').children().hide();
        $(this).parent().siblings('.tab_item_list').children().eq( $(this).index() ).show();
    });
});




//  sub1-1 - 소통하場 갤러리 - 더보기  
  $(document).ready(function () {
    var moreBtn = $(".hsrch_more");

    $(".hschD_glry_wrap").each(function () {
        if(!$(this).find(".hschD_glry_more").length){
            $(this).find(".hsrch_more").hide();
        }
    });

    moreBtn.on("click",function () {
        if($(this).prev(".hschD_glry_more").length){
            if($(this).prev(".hschD_glry_more").is(":hidden")){
                $(this).prev(".hschD_glry_more").slideDown("fast");
                $(this).text("닫기");
                $(this).addClass("on");
            }else{
                $(this).prev(".hschD_glry_more").slideUp("fast");
                $(this).text("더보기");
                $(this).removeClass("on");
            }
        }
        return false;
    });
});


// sub1-1 소통하場 - 최신순/조회순 Tab
$(document).ready(function(){
	   
    $('ul.tabs li').click(function(){
      var tab_id = $(this).attr('data-tab');
   
      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');
   
      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
    })
   
  });


