 
				 var pause=false; 
var scrollTimeId=null; 
var container=null; 
var lineHeight=null; 
var speed=0; 
var delay=0; 
simpleScroll=function(container1,lineHeight1,speed1,delay1){ 
    container=document.getElementById(container1); 
    lineHeight=lineHeight1; 
    speed=speed1; 
    delay=delay1; 
    //����Ч�� 
    scrollexc=function(){ 
        if(pause) return ; 
        container.scrollTop+=2; 
        var lh=lineHeight||container.getElementsByTagName('li')[0].offsetHeight; 
        if(container.scrollTop%lh<=1){ 
            clearInterval(scrollTimeId); 
            fire(); 
            container.scrollTop=0; 
            setTimeout(start,delay*1000); 
        } 
    }; 
    //��ʼ���� 
    start=function(){ 
        var lh=lineHeight||container.getElementsByTagName('li')[0].offsetHeight; 
            if (container.scrollHeight - container.offsetHeight >= lh) 
                scrollTimeId = setInterval(scrollexc, speed); 
    }; 
    //���ӽڵ����еĵ�һ���ƶ������ 
    fire=function(){ 
        container.appendChild(container.getElementsByTagName('li')[0]); 
    }; 
    container.onmouseover=function(){pause=true;}; 
    container.onmouseout=function(){pause=false;}; 
    setTimeout(start,delay*1000); 
};
 