 <html lang="zh-cn">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>
            Demo for e签宝认证签 
        </title>
    </head>
    <body>
		<h1>e签宝认证签Demo</h1>
		<br><br>
		<h3>个人账户</h3>
		<br>
		<form action="./index.php?act=tsign&op=account" method="post">
			<input type="hidden" name="type" value="0" />
			手机号：<input type="text" name="permobile" value="13333333355" /><br><br>
			姓名：<input type="text" name="pername" value="个人测试" /><br><br>
			身份证号：<input type="text" name="peridNo" value="11111111111111111" /><br><br>
			用户归属地：<input type="text" name="perArea" value="1" />(0-大陆 1-香港 2-澳门 3-台湾 4-外籍)<br/><br/>
			<input type="submit" value="生成账户"/>
		</form>
    <br><br>
		<h3>企业账户</h3>
		<form action="./index.php?act=tsign&op=account" method="post">
			<input type="hidden" name="type" value="1" />
			手机号：<input type="text" name="orgmobile" value="13333333366" /><br><br>
			公司名称：<input type="text" name="orgname" value="企业账户测试" /><br><br>
			组织机构代码：<input type="text" name="orgcode" value="111111112" /><br><br>
			用户归属地：<input type="text" name="legalArea" value="1" />(0-大陆 1-香港 2-澳门 3-台湾 4-外籍)<br/><br/>
			用户归属地：<input type="text" name="legalArea" value="1" />(0-大陆 1-香港 2-澳门 3-台湾 4-外籍)<br/><br/>
			<input type="submit" value="生成账户"/>
		</form>
    </body>
</html>
