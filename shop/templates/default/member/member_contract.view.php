<?php defined('InShopNC') or exit('Access Invalid!'); ?>

<div class="wrap">
    <div class="tabmenu">
        <ul class="tab">
            <?php
            if (is_array($output['member_menu']) and ! empty($output['member_menu'])) {
                foreach ($output['member_menu'] as $key => $val) {
                    $classname = 'normal';
                    if ($val['menu_key'] == $output['menu_key']) {
                        $classname = 'active';
                    }
                    if ($val['menu_key'] == 'message') {
                        echo '<li class="' . $classname . '"><a href="' . $val['menu_url'] . '">' . $val['menu_name'] . '(<span style="color: red;">' . $output['newcommon'] . '</span>)</a></li>';
                    } elseif ($val['menu_key'] == 'system') {
                        echo '<li class="' . $classname . '"><a href="' . $val['menu_url'] . '">' . $val['menu_name'] . '(<span style="color: red;">' . $output['newsystem'] . '</span>)</a></li>';
                        //}elseif ($val['menu_key'] == 'close'){
                        //echo '<li class="'.$classname.'"><a href="'.$val['menu_url'].'">'.$val['menu_name'].'(<span style="color: red;">'.$output['newpersonal'].'</span>)</a></li>';
                    } else {
                        echo '<li class="' . $classname . '"><a href="' . $val['menu_url'] . '">' . $val['menu_name'] . '</a></li>';
                    }
                }
            }
            ?>
        </ul>
    </div>


    <div class="ncm-user-profile">
    <!--    <div class="user-avatar"><span><img src="<?php echo getMemberAvatar($output['member_info']['member_avatar']); ?>"></span></div>-->
        <div class="ncm-default-form fr" style="width:100%;">
            <form method="post" id="profile_form" enctype="multipart/form-data" action="index.php?act=member_information&op=certification">
                <input type="hidden" name="form_submit" value="ok" />
                <dl>
                    <dt>合同ID号：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['id']; ?></span>
                    </dd>
                </dl>
                
                <dl>
                    <dt>合同状态：</dt>
                    <dd>
                        <span class="w400"><B><?php echo $info['status_name']; ?></B></span>
                    </dd>
                </dl>
                
                <dl>
                    <dt>标题：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['title']; ?></span>
                    </dd>
                </dl>
                
                <dl>
                    <dt>描述：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['description']; ?></span>
                    </dd>
                </dl>
                
                 <dl>
                    <dt>合同文件地址：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['file_path']; ?></span>
                    </dd>
                </dl>
                
                 <dl>
                    <dt>煤企名称：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['store_name']; ?></span>
                    </dd>
                </dl>                
                
                 <dl>
                    <dt>发起时间：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['createdate']; ?></span>
                    </dd>
                </dl>  

                 <dl>
                    <dt>最后一次修改时间：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['modifydate']; ?></span>
                    </dd>
                </dl>                  
                
                
                <dl>
                    <dt>企业签署状态：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['store_signed_status_name']; ?></span>
                    </dd>
                </dl>   
                <?php 
                if($info['store_signed_status'] != 0){
                ?>
                 <dl>
                    <dt>企业签署时间：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['store_signed_datetime']; ?></span>
                    </dd>
                </dl>  
                
                 <dl>
                    <dt>企业签署文件：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['store_signed_file_path']; ?></span>
                    </dd>
                </dl> 
                <?php } ?>
                
                
                <dl>
                    <dt>用户签署状态：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['member_signed_status_name']; ?></span>
                    </dd>
                </dl>   
                <?php 
                if($info['store_signed_status'] != 0){
                ?>
                 <dl>
                    <dt>用户签署时间：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['member_signed_datetime']; ?></span>
                    </dd>
                </dl>  
                
                 <dl>
                    <dt>用户签署文件：</dt>
                    <dd>
                        <span class="w400"><?php echo $info['member_signed_file_path']; ?></span>
                    </dd>
                </dl> 
                <?php } ?>
                
<!--                <dl class="bottom">
                    <dt></dt>
                    <dd>
                        <label class="submit-border">
                            <input type="button" class="submit" value="返回" />
                        </label>
                    </dd>
                </dl>-->
            </form>
        </div>
    </div>    






</div>
<script type="text/javascript" src="<?php echo RESOURCE_SITE_URL; ?>/js/common_select.js" charset="utf-8"></script>