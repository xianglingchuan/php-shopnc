<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="tabmenu">
  <?php include template('layout/submenu');?>
</div>
<div class="alert alert-block mt10">
  <ul class="mt5">
    <li>所有等我签署的合同信息。</li>
  </ul>
</div>


  


<!--<form method="get" action="index.php" target="_self">
  <table class="search-form">
    <input type="hidden" name="act" value="store_deliver" />
    <input type="hidden" name="op" value="index" />
    <?php if ($_GET['state'] !='') { ?>
    <input type="hidden" name="state" value="<?php echo $_GET['state']; ?>" />
    <?php } ?>
    <tr>
      <td></td>
      <th><?php echo $lang['store_order_add_time'];?></th>
      <td class="w240"><input type="text" class="text w70" name="query_start_date" id="query_start_date" value="<?php echo $_GET['query_start_date']; ?>" /><label class="add-on"><i class="icon-calendar"></i></label>
        &nbsp;&#8211;&nbsp;
        <input id="query_end_date" class="text w70" type="text" name="query_end_date" value="<?php echo $_GET['query_end_date']; ?>" /><label class="add-on"><i class="icon-calendar"></i></label></td>
      <th><?php echo $lang['store_order_buyer'];?></span></th>
      <td class="w100"><input type="text" class="text w80" name="buyer_name" value="<?php echo trim($_GET['buyer_name']); ?>" /></td>
      <th><?php echo $lang['store_order_order_sn'];?></th>
      <td class="w160"><input type="text" class="text w150" name="order_sn" value="<?php echo trim($_GET['order_sn']); ?>" /></td>
      <td class="w70 tc"><label class="submit-border">
          <input type="submit" class="submit"value="<?php echo $lang['store_order_search'];?>" />
        </label></td>
    </tr>
  </table>
</form>-->
<table class="ncsc-default-table order deliver">
  <tbody>
    <thead>
      <tr>
        <th class="w50">合同ID</th>
        <th class="w230">合同标题</th>
        <th class="w120">用户名称</th>
        <th class="w100">签署状态</th>
        <th class="w100">用户签署状态</th>
        <th class="w80">类型</th>
        <th class="w150">发起时间</th>
        <th class="w150">操作</th>
      </tr>
    </thead>   
  <?php if (is_array($output['list']) and !empty($output['list'])) { ?>
  <?php foreach($output['list'] as $key=>$value) {?>
   
      
    <tr>
      <td class="bdl w100"><?php echo $value['id'];?></td>
      <td class="w300"><?php echo $value['title'];?></td>
      <td class="w200"><?php echo $value['member_name']; ?></td>
      <td class="bdl bdr order-info w120"><?php echo $value['store_signed_status_name'];?></td>
      <td class="bdl bdr order-info w120"><?php echo $value['member_signed_status_name'];?></td>
      <td class="bdl bdr order-info w120">
        <?php 
        if($value['createuid'] == $value['member_id']){
            echo "用户发起";
        }else{
            echo "煤企发起";
        }
        ?>  
      </td>
      <td class="bdl bdr order-info w180"><?php echo $value['createdate']; ?>   </td>
        <td class="ncm-table-handle w100">
          <span><a href="index.php?act=member_contract&op=signContract&id=<?php echo $value['id'];?>&member_menu=waitme" target="_black" class="btn-red"><p>签置合同</p></a></span>   
          <?php 
          if($value['createuid'] == $value['store_member_id']){ ?>
          <span><a href="javascript:void(0)" class="btn-red" onclick="ajax_get_confirm('确认要关闭合同', 'index.php?act=store_contract&op=close&id=<?php echo $value['id'];?>');">
          <p>关闭合同</p>
          </a></span>   
          <?php 
          }else{ ?>
          <span><a href="javascript:void(0)" class="btn-red" onclick="ajax_get_confirm('确认要退回合同', 'index.php?act=member_contract&op=sendback&id=<?php echo $value['id'];?>');">
          <p>退回合同</p>
          </a></span>           
          <?php 
          } ?>           
          <span><a href="index.php?act=member_contract&op=view&id=<?php echo $value['id'];?>&member_menu=waitme" class="btn-red">
          <p>查看详情</p>
          </a></span>
        </td>      
      
      <!-- E 合并TD -->
    </tr>
    <?php } } else { ?>
    <tr>
      <td colspan="21" class="norecord"><div class="warning-option"><i class="icon-warning-sign"></i><span><?php echo $lang['no_record'];?></span></div></td>
    </tr>
    <?php } ?>
  </tbody>
  <tfoot>
    <?php if (!empty($output['list'])) { ?>
    <tr>
      <td colspan="21"><div class="pagination"><?php echo $output['show_page']; ?></div></td>
    </tr>
    <?php } ?>
  </tfoot>
</table>
