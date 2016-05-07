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
                    } elseif ($val['menu_key'] == 'close') {
                        echo '<li class="' . $classname . '"><a href="' . $val['menu_url'] . '">' . $val['menu_name'] . '(<span style="color: red;">' . $output['newpersonal'] . '</span>)</a></li>';
                    } else {
                        echo '<li class="' . $classname . '"><a href="' . $val['menu_url'] . '">' . $val['menu_name'] . '</a></li>';
                    }
                }
            }
            ?>
        </ul>
    </div>
    <div class="ncm-message-send">
        <div class="ncm-message-send-form">
            <div class="ncm-default-form">
                <form enctype="multipart/form-data" method="post" id="send_form" action="index.php?act=member_contract&op=add">
                    <input type="hidden" name="form_submit" value="ok" />
                    <dl>
                        <dt><i class="required">*</i>合同名称</dt>
                        <dd>
                            <input type="text" class="text w300" name="title" id="title" value=""/>
                            <p class ="error"></p>
                        </dd>
                    </dl>
                    
                    
                    
                    

                    <dl>
                        <dt><i class="required">*</i>3号线煤企</dt>
                        <dd>
                            <select name="store_id" id="store_id">
                                <option value="">请选择煤企</option>
                                <?php
                                if (!empty($storeList)) {
                                    foreach ($storeList as &$buf) {
                                        echo '<option value="' . $buf['store_id'] . '">' . $buf['store_name'] . '</option>';
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
                        <label class="submit-border">
                            <input type="submit" class="submit" value="发起合同"/>
                        </label>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function setFileName() {
        var f = document.getElementById("contract_file").files;
        $("#filename").html(f[0].name);
    }

//    function mySubmit() {
//        var filename = $("#filename").html();
//        alert("filename"+filename);
//        if (filename == "") {
//           $("#file_error").html("<span style='color:red'>请上传合同文件.</span>");
//        }
//        $('#send_form').submit();
//    }


//    $(function() {
//        $('#send_form').validate({
//            errorPlacement: function(error, element) {
//                $(element).next('p').html(error);
//            },
//            rules: {
//                title: {
//                    required: true
//                },
//                store_id: {
//                    required: true
//                }
//            },
//            messages: {
//                title: {
//                    required: '标题不能为空.'
//                },
//                store_id: {
//                    required: '请选择煤企.'
//                }
//            }
//        });
//    });
</script> 
