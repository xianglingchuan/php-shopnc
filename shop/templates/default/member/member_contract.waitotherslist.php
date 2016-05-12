<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="wrap">
  <div class="tabmenu">
    <ul class="tab">
      <?php if(is_array($output['member_menu']) and !empty($output['member_menu'])) { 
	foreach ($output['member_menu'] as $key => $val) {
		$classname = 'normal';
		if($val['menu_key'] == $output['menu_key']) {
			$classname = 'active';
		}
		if ($val['menu_key'] == 'message'){
			echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'(<span style="color: red;">'.$output['newcommon'].'</span>)</a></li>';
		}elseif ($val['menu_key'] == 'system'){
			echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'(<span style="color: red;">'.$output['newsystem'].'</span>)</a></li>';
		//}elseif ($val['menu_key'] == 'close'){
			//echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'(<span style="color: red;">'.$output['newpersonal'].'</span>)</a></li>';
		}else{
			echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'</a></li>';
		}
	}
}?>
    </ul>
  </div>
    
    
    
  <table class="ncm-default-table" >
    <thead>
      <tr>
        <th class="w50">合同ID</th>
        <th class="w230">合同标题</th>
        <th class="w120">煤企名称</th>
        <th class="w100">签署状态</th>
        <th class="w100">我的签署状态</th>
        <th class="w80">类型</th>
        <th class="w150">发起时间</th>
        <th class="w80">操作</th>
      </tr>
    </thead>
    <?php if(!empty($output['list']) && is_array($output['list'])){?>
    <tbody>
      <?php foreach($output['list'] as $key=>$value){?>
      <tr class="bd-line">
        <td><?php echo $value['id'];?></td>
        <td class="tl"><?php echo $value['title'];?></td>
        <td><?php echo $value['store_name']; ?></td>
        <td><?php //echo $value['store_signed_status_name'];?>
        <?php
        if($value['store_signed_status'] == eqb_contractModel::STORE_SIGNED_STATUS_FAIL_KEY){
            echo "<span style='color:red'>".$value['store_signed_status_name']."</span>";
        }else{
            echo $value['store_signed_status_name'];
        }
        ?>         
        </td> 
        <td><?php //echo $value['member_signed_status_name'];?>
        <?php
        if($value['member_signed_status'] == eqb_contractModel::MEMBER_SIGNED_STATUS_FAIL_KEY){
            echo "<span style='color:red'>".$value['member_signed_status_name']."</span>";
        }else{
            echo $value['member_signed_status_name'];
        }
        ?> 
        </td>
        <td>
        <?php 
        if($value['createuid'] == $value['member_id']){
            echo "用户发起";
        }else{
            echo "煤企发起";
        }
        ?>    
        </td>
        <td>
            <?php echo $value['createdate']; ?>        
        </td>
        <td class="ncm-table-handle tl">
          <span><a href="index.php?act=member_contract&op=view&id=<?php echo $value['id'];?>&member_menu=waitothers" class="btn-red">
          <p>查看详情</p>
          </a></span>
        </td>
      </tr>
      <?php }?>
      <?php }else{?>
      <tr>
        <td colspan="20" class="norecord"><div class="warning-option"><i>&nbsp;</i><span><?php echo $lang['no_record'];?></span></div></td>
      </tr>
      <?php }?>
    </tbody>
  </table>
    
    
    
    
</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL;?>/js/common_select.js" charset="utf-8"></script>