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
		<h3>文档转换并上传至e签宝（本地非PDF文件）</h3>
		<br>
		<form action="./index.php?act=tsign&op=addfile" method="post">
			<input type="hidden" name="type" value="0" />
			文档路径：<input type="text" name="docFilePath" value="E:/test.doc" /><br><br>
			文档类型：<input type="text" name="docType" value="doc" /><br><br>
			文档名称：<input type="text" name="docName" value="测试文档" /><br><br>
			<input type="submit" value="保存文档"/>
		</form>
    <br><br>
		<h3>文档上传至e签宝（本地PDF文件）</h3>
		<form action="./index.php?act=tsign&op=addfile" method="post">
			<input type="hidden" name="type" value="1" />
			文档路径：<input type="text" name="docFilePath" value="E:/test.pdf" /><br><br>
			文档名称：<input type="text" name="docName" value="测试文档" /><br><br>
			<input type="submit" value="保存文档"/>
		</form>
    </body>
</html>
