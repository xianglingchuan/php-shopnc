<?php 
	require_once('load.php');
	$rt = $app->action('user','return_show_suppliers_info',$_GET['uid']);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>--</title>
<script type="text/javascript" src="<?php echo SITE_URL;?>js/jquery.min.js"></script> 
</head>

<body>
<form id="theForm" name="theForm" method="post" action="">
	<table cellspacing="2" cellpadding="5" width="100%">
	<tr>
	<td>&nbsp;</td>
	<td align="left">
		<fieldset style="border: 1px solid #B4C9C6;">
		  <legend style="background: none repeat scroll #FFF;">所辖地区:</legend>
		  <table style="width: 700px;" align="left">
		  <tr>
			<td id="regionCell">
			<?php 
			if(!empty($rt['area_data'])){
				foreach($rt['area_data'] as $row){
				?>
				<input type='checkbox' name='regions' value='<?php echo $row['region_id'];?>' checked='true' /> <?php echo $row['region_name'];?> &nbsp;&nbsp;
				<?php
				}
			}
			?>					
			</td>
		  </tr>
		  <tr>
			<td>
			<table cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td>国家：</td><td>省份：</td><td>城市：</td><td>区/县：</td><td>镇：</td><td>村：</td><td>&nbsp;</td>
				</tr>
				<tr>
					<td>
					<select name="country" id="selCountries" onchange="ger_ress('1',this,'selProvinces')" size="10" style="width: 80px; height:200px">
							<option value="1">中国</option>
					</select>
					</td>
					<td>
					<select name="province" id="selProvinces" onchange="ger_ress('2',this,'selCities')" size="10" style="width: 80px;height:200px">
					 <option value="">请选择...</option>
				</select>
					</td>
					<td>
					<select name="city" id="selCities" onchange="ger_ress('3',this,'selDistricts')" size="10" style="width: 80px;height:200px">
					<option value="">请选择...</option>
				</select>
					</td>
					<td>
					<select name="district" id="selDistricts" size="10" style="width: 130px;height:200px" onchange="ger_ress('4',this,'select_town')">
					<option value="">请选择...</option>
				</select>
					</td>
					<td>
					<select name="town" id="select_town" onchange="ger_ress('5',this,'select_village')" size="10" style="width: 80px;height:200px">
					<option value="">请选择...</option>
				</select>
					</td>
					<td>
					<select name="village" id="select_village" size="10" style="width: 130px;height:200px">
					<option value="">请选择...</option>
				</select>
					</td>
					<td valign="bottom">
					<input value="+" onclick="addRegion()" type="button" style="padding:0px 5px 0px 5px; cursor:pointer">
					</td>
				</tr>
			</table>
			</td>
		  </tr>
		  </table>
		</fieldset>
	</td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	<td>
	  <input type="button" value="保存" style="padding:3px 5px 3px 5px; cursor:pointer" onclick="return ajax_save_suppliers_info('<?php echo $_GET['uid'];?>','',this)"/>&nbsp;&nbsp;<?php //if(!empty($rt)){?><input type="button" class="altset" value="<?php echo $rt['active']=='1' ? '当前已审核，设为未审核状态': '当前未审核，设未审核状态';?>"  style=" padding:3px 5px 3px 5px; border:1px solid #ccc; color:#FE0000; cursor:pointer" lang="<?php echo $rt['active']=='1' ? '0': '1';?>" onclick="return ajax_save_suppliers_info('<?php echo $_GET['uid'];?>','1',this)"/><?php //} ?>
	</td>
	</tr>
	 </table>
 </form>
<script language="javascript" type="text/javascript">
function ajax_save_suppliers_info(uid,ac,obj){
	
	var arr = [];
	var val = $(obj).attr('lang');
	$('input[name="regions"]:checked').each(function(){
		arr.push($(this).val());
	});
	if(arr==null || arr=="") return false;
	var str=arr.join('+');
	$.post('<?php echo ADMIN_URL;?>user.php',{action:'ajax_save_suppliers_info',ids:str,uid:uid,active:ac,val:val},function(data){
		if(data=="" || data ==null){
			if(val==1){
				$('.altset').val("当前已审核，设为未审核状态");
				$(obj).attr('lang','0');
			}else{
				$('.altset').val("当前未审核，设为审核状态");
				$(obj).attr('lang','1');
			}
		}else{
			alert(data);
		}
	});
	return  true;
}
/**
 * 添加一个区域
 */
function addRegion()
{
    var selCountry  = document.forms['theForm'].elements['country'];
    var selProvince = document.forms['theForm'].elements['province'];
    var selCity     = document.forms['theForm'].elements['city'];
    var selDistrict = document.forms['theForm'].elements['district'];
    var regionCell  = document.getElementById("regionCell");
 	var seltown = document.forms['theForm'].elements['town'];
 	var selvillage = document.forms['theForm'].elements['village'];
	
	if(selvillage.selectedIndex > 0){
		regionId = selvillage.options[selvillage.selectedIndex].value;
		regionName = selvillage.options[selvillage.selectedIndex].text;
	}else{
		if(seltown.selectedIndex > 0){
			regionId = seltown.options[seltown.selectedIndex].value;
			regionName = seltown.options[seltown.selectedIndex].text;
		}else{
			if (selDistrict.selectedIndex > 0)
			{
				regionId = selDistrict.options[selDistrict.selectedIndex].value;
				regionName = selDistrict.options[selDistrict.selectedIndex].text;
			}
			else
			{
				if (selCity.selectedIndex > 0)
				{
					regionId = selCity.options[selCity.selectedIndex].value;
					regionName = selCity.options[selCity.selectedIndex].text;
				}
				else
				{
					if (selProvince.selectedIndex > 0)
					{
						regionId = selProvince.options[selProvince.selectedIndex].value;
						regionName = selProvince.options[selProvince.selectedIndex].text;
					}
					else
					{
						if (selCountry.selectedIndex >= 0)
						{
							regionId = selCountry.options[selCountry.selectedIndex].value;
							regionName = selCountry.options[selCountry.selectedIndex].text;
						}
						else
						{
							return;
						} //end if
					} //end if
				}//end if
			} //end if
		} //end if
	} //end if
	
    // 检查该地区是否已经存在
    exists = false;
    for (i = 0; i < document.forms['theForm'].elements.length; i++)
    {
      if (document.forms['theForm'].elements[i].type=="checkbox")
      {
        if (document.forms['theForm'].elements[i].value == regionId)
        {
          exists = true;
          alert('选定的地区已经存在。');
        }
      }
    }
    // 创建checkbox
    if (!exists)
    {
      regionCell.innerHTML += "<input type='checkbox' name='regions' value='" + regionId + "' checked='true' /> " + regionName + "&nbsp;&nbsp;";
    }
}

function ger_ress(type,obj,seobj){
	parent_id = $(obj).val();
	if(parent_id=="" || typeof(parent_id)=='undefined'){ return false; }
	$.post('<?php echo ADMIN_URL;?>user.php',{action:'get_ress',type:type,parent_id:parent_id},function(data){ 
			$('#'+seobj).html(data);
			if(type==1){
				$('#selCities').html('<option value="0">请选择...</option>');
				$('#selDistricts').html('<option value="0">请选择...</option>');
				$('#select_town').html('<option value="0">请选择...</option>');
				$('#select_village').html('<option value="0">请选择...</option>');
				
			}else if(type==2){
				$('#selDistricts').html('<option value="0">请选择...</option>');
				$('#select_town').html('<option value="0">请选择...</option>');
				$('#select_village').html('<option value="0">请选择...</option>');
			}else if(type==3){
				$('#select_town').html('<option value="0">请选择...</option>');
				$('#select_village').html('<option value="0">请选择...</option>');
			}else if(type==4){
				$('#select_village').html('<option value="0">请选择...</option>');
			}
	});
}

</script>

</body>
</html>