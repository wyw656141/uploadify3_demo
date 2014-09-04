<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<script type="text/javascript" src="./static/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./static/uploadify/jquery.uploadify.min.js"></script>
<link href="./static/uploadify/uploadifySimple.css" type="text/css" rel="stylesheet" />//上传进度条，按钮样式设置
</head>
<style type="text/css"> 
table{border-left: 1px solid #666; border-bottom: 1px solid #666;}
tr{border-right:1px solid #666;border-top: 1px solid #666;}
td{border-right:1px solid #666;border-top: 1px solid #666;}
th{border-right:1px solid #666;border-top: 1px solid #666;}
</style>
<body>
	<h2>Hello World!</h2>
	<table>
		<tr>
			<th>文件名</th>
			<th>文件id</th>
			<th>操作</th>
		</tr>
		<tr>
			<td id="filename1"></td>
			<td id="fileid1"></td>
			<td id="fileoption1"><input type="file" name="fileUpLoad" id="fileUpLoad"></td>
		</tr>
	</table>
	<a href="javascript:$('#fileUpLoad').uploadify('upload','*')">Upload Files</a>//手动上传
</body>
<script type="text/javascript">
	$("#fileUpLoad").uploadify({
		'buttonText':'点击选择文件',//上传按钮的文字 
	    'height': 20,//按钮高度
	    'fileTypeDesc' : '图片或文档文件',//选择文件时候提示信息
      	'fileTypeExts' : '*.gif; *.jpg; *.png; *.doc; *.xls; *.ppt; *.txt; *.pdf',//选择文件时，可以选择的类型
      	'fileSizeLimit':'20MB',//选择文件最大尺寸
		'swf' : './static/uploadify/uploadify.swf',//flash文件目录
		'uploader' : './upload.jsp',//上传目的地地址
		'auto'     : false,//自动上传，手动上传需要调用upload事件
		'multi'    : false,//一次可否选择多个文件
		'onSelect' : function (file) {//选择文件后触发，例如可以在此设置上传过程中不能提交form。
			
	        },
		'onUploadSuccess' : function(file, data, response) {//上传成功后调用，例如可以把上传返回结果设置到form中
			alert('The file ' + file.name + ' uploaded successfully.');
			$("#filename1").text(file.name);
			$("#fileid1").text(eval("(" + data + ")").fileName);
			//file.name file.type file.size....
		},
	    'onSelectError' : function (file, errorCode, errorMsg) {//汉化所有提示信息在此修改。
		      this.queueData.errorMsg='部分文件上传失败：';
		        switch(errorCode) {
					case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
						if (settings.queueSizeLimit > errorMsg) {
							this.queueData.errorMsg += '\nThe number of files selected exceeds the remaining upload limit (' + errorMsg + ').';
						} else {
							this.queueData.errorMsg += '\nThe number of files selected exceeds the queue size limit (' + settings.queueSizeLimit + ').';
						}
						break;
					case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
						this.queueData.errorMsg += '\n文件"' + file.name + '" 限制大小为 (20MB)。';
						break;
					case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
						this.queueData.errorMsg += '\n文件"' + file.name + '" 是空的。';
						break;
					case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
						this.queueData.errorMsg += '\n文件 "' + file.name + '" 文件类型不为 (图片或者文件类型 )。';
						break;
				}
	        }
	});
</script>
</html>
