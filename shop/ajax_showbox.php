<?php 
	require_once('load.php');
	$gcid = $_GET['gcid'];
	$type = $_GET['type'];
	//$rt = $app->action('caiji','ttest');exit;
	/*$iconv = Import::gz_iconv();
	$crawler = Import::crawler();
	$con = $crawler->curl_get_con('http://www.donghesz.com/products.asp?id=3082');
	$con = $iconv->ec_iconv('GB2312', 'UTF8', $con);
	@preg_match('#商品品牌：</td>(.*)</tr>#iUs',$con,$arr); 
	if(!empty($arr[1])){
			preg_match('#<td height="22" width="76%">(.*)</td>#iUs',$arr[1],$ar);
			print_r($ar);
			
	}
	echo 'run..';
	exit;*/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>--</title>
<script type="text/javascript" src="<?php echo SITE_URL;?>js/jquery.min.js"></script> 
</head>

<body>
	<table cellspacing="0" cellpadding="0" width="100%" style="line-height:26px; border:1px solid #ccc">
	<tr>
	<td align="left" style="border-bottom:1px solid #ccc; text-align:center" valign="top">
		<div class="returndata" style="text-align:left; height:350px; overflow:auto">

		</div>
	</td>
	</tr>
	<tr>
	<td>
	<input type="button" name="button" value=" 快速停止 " style="cursor:pointer; padding:3px" onclick="return stopop()"/>
	</td>
	</tr>
	 </table>
<script language="javascript" type="text/javascript">
function stopop(){
	stops = 'stop';
}
var gcid = '<?php echo $_GET['gcid'];?>';

<?php if($_GET['type']=='url'){?>
var kk = 1;
var stops = "";
$('.returndata').html("。。。。。。。。装载中。。。。。。。<br/>");
window.load = ajax_caiji_cateurl_start(gcid,kk);

function ajax_caiji_cateurl_start(gcid,kk){
	if(stops=="stop"){
		$('.returndata').append("<p style='color:#fe0000;margin:0px;padding:0px'>已成功停止！</p>");
		return false;
	}
	$.ajax({
		   type: "GET",
		   url: "<?php echo ADMIN_URL;?>caiji<?php echo $gcid;?>.php",
		   data: "type=ajax_caiji_cateurl_start&gcid="+gcid+"&kk="+kk,
		   dataType: "json",
		   success: function(data){
			 	if (data.url != "")
				{
					if(parseInt(data.kk)%50==0){
						$('.returndata').html("");
					}
					$('.returndata').append(data.url);
					ajax_caiji_cateurl_start(data.gcid,data.kk);
				}else{
					/*if(data.url!=""){
						$('.returndata').append("<p style='color:#fe0000'>"+data.url+"</p>");
					}else{*/
						$('.returndata').append("<p style='color:#fe0000;margin:0px;padding:0px'>"+data.message+"</p>");
					//}
				}
		   }
		}); 
}
<?php }elseif($_GET['type']=='goods'){ ?>
var kk = 0;
var maxpage = 1;
var stops = "";
$('.returndata').html("。。。。。。。。装载中。。。。。。。<br/>");
window.load = ajax_caiji_goodsurl_start(gcid,kk,maxpage);

function ajax_caiji_goodsurl_start(gcid,kk,maxpage){
	if(stops=="stop"){
		$('.returndata').append("<p style='color:#fe0000;margin:0px;padding:0px'>已成功停止！</p>");
		return false;
	}
	$.ajax({
		   type: "GET",
		   url: "<?php echo ADMIN_URL;?>caiji<?php echo $gcid;?>.php",
		   data: "type=ajax_caiji_goodsurl_start&gcid="+gcid+"&kk="+kk+"&maxpage="+maxpage,
		   dataType: "json",
		   success: function(data){
			 	if (data.url != "")
				{
					if(parseInt(data.kk)%500==0){
						$('.returndata').html("");
					}
					$('.returndata').append(data.url);
					ajax_caiji_goodsurl_start(data.gcid,data.kk,data.maxpage);
				}else{

					a$('.returndata').append("<p style='color:#fe0000;margin:0px;padding:0px'>"+data.message+"</p>");
				}
		   }
		}); 
}
<?php } ?>
</script>

</body>
</html>