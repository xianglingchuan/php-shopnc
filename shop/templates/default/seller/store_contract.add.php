<?php defined('InShopNC') or exit('Access Invalid!'); ?>
<style>
    /*上传按钮*/
.ncm-upload-btn { vertical-align: top; display: inline-block; *display: inline/*IE7*/; margin-right: 5px;  width: 80px; height: 30px; *zoom:1;}
.ncm-upload-btn a { display: block; position: relative; z-index: 1;}
.ncm-upload-btn span { width: 80px; height: 30px; position: absolute; left: 0; top: 0; z-index: 2; cursor: pointer;}
.ncm-upload-btn .input-file { width: 80px; height: 30px; padding: 0; margin: 0; border: none 0; opacity:0; filter: alpha(opacity=0); cursor: pointer; }
.ncm-upload-btn p { font-size: 12px; line-height: 20px; background-color: #F5F5F5; color: #999; text-align: center; color: #666; width: 78px; height: 20px; padding: 4px 0; border: solid 1px; border-color: #DCDCDC #DCDCDC #B3B3B3 #DCDCDC; position: absolute; left: 0; top: 0; z-index: 1;}
.ncm-upload-btn p i { vertical-align: middle; margin-right: 4px;}
.ncm-upload-btn a:hover p { background-color: #E6E6E6; color: #333; border-color: #CFCFCF #CFCFCF #B3B3B3 #CFCFCF;} 

    </style>
<div class="tabmenu">
    <?php include template('layout/submenu'); ?>
</div>
<div class="alert alert-block mt10">
    <ul class="mt5">
        <li>发起合同请求</li>
    </ul>
</div>


<div class="eject_con">
    <div id="warning" class="alert alert-error"></div>
    <form enctype="multipart/form-data" method="post" id="send_form" action="index.php?act=store_contract&op=add">
        <input type="hidden" name="form_submit" value="ok" />
        <dl>
            <dt><i class="required">*</i>合同名称</dt>
            <dd>
                <input type="text" class="text w300" name="title" id="title" value=""/>
                <p class ="error"></p>
            </dd>
        </dl>

        <dl>
            <dt><i class="required">*</i>3号线企业用户</dt>
            <dd>
                <select name="member_id" id="member_id">
                    <option value="">请选择企业用户</option>
                    <?php
                    if (!empty($memberList)) {
                        foreach ($memberList as &$buf) {
                            echo '<option value="' . $buf['member_id'] . '">' . $buf['member_name'] . '</option>';
                        }
                    }
                    ?>
                </select>
                <p class ="error"></p>
            </dd>
        </dl>

        <dl>
            <dt><i class="required">*</i>合同文件</dt>
            <dd>
                <span class="w300" style="float:left;">
                    <div class="ncm-upload-btn" style="margin-top: 0px;"> <a href="javascript:void(0);" onChange="setFileName()"><span>
                                <input type="file" hidefocus="true" size="1" class="input-file" name="contract_file" id="contract_file" file_id="0" multiple="" maxlength="0"/>

                            </span>
                            <p><i class="icon-upload-alt"></i>上传合同</p>
                            <input id="submit_button" name="submit_button" style="display:none" type="button" value=""/>
                        </a>
                    </div>
                    <span id="filename"></span>
                    <span style="color:red">(只能上传doc或pdf格式文件)</span>  
                </span>
            </dd>
        </dl>

        <dl>
            <dt>描述信息</dt>
            <dd>
                <textarea name="description" id="description" rows="3" class="textarea w500 h100"></textarea>
            </dd>
        </dl>        
        <div class="bottom">
            <label class="submit-border"><input type="submit" nctype="address_add_submit" class="submit" value="发送合同" /></label>
        </div>
    </form>
</div>
<script type="text/javascript">

    function setFileName() {
        var f = document.getElementById("contract_file").files;
        $("#filename").html(f[0].name);
    }
</script>
