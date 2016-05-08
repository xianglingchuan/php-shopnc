<?php defined('InShopNC') or exit('Access Invalid!'); ?>

<div class="tabmenu">
    <?php include template('layout/submenu'); ?>
</div>
<div class="alert alert-block mt10">
    <ul class="mt5">
        <li>查看合同详细信息。</li>
    </ul>
</div>

<div class="ncsc-form-default">
    <form method="post"  action="index.php?act=store_setting&op=store_setting" enctype="multipart/form-data" id="my_store_form">


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
        if ($info['store_signed_status'] != 0) {
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
        if ($info['member_signed_status'] != 0) {
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

    </form>
</div>
