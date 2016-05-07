<?php defined('InShopNC') or exit('Access Invalid!');?>

<div class="tabmenu">
  <?php include template('layout/submenu');?>
</div>
<div class="alert alert-block mt10">
  <ul class="mt5">
    <li>所有被对方退回的合同文件列表。</li>
  </ul>
</div>
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