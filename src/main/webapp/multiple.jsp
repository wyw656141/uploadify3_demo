<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<script type="text/javascript" src="./static/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./static/uploadify/jquery.uploadify.min.js"></script>
<link href="./static/uploadify/uploadify.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<table>
		<tr>
			<td id="fileoption1">
				<input type="file" name="fileUpLoad" id="fileUpLoad">
			</td>
		</tr>
		<tr>
			<td id="filelist"></td>
		</tr>
		
	</table>
<a href="javascript:$('#fileUpLoad').uploadify('upload','*')">Upload Files</a>//手动上传
	<div id="fileitem_1" style="display: none;" class="uploadify-queue">
		<div class="uploadify-queue-item">
			<div class="cancel">
				<a href="">X</a>
			</div>
			<span class="fileName">wyw0001.java</span> 
			<div class="uploadify-progress">
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#fileUpLoad").uploadify({
		'swf' : './static/uploadify/uploadify.swf',
		'uploader' : './upload.jsp',
		'multi' : true,
		'auto' : false,
		'onUploadSuccess' : function(file, data, response) {
			alert('The file ' + file.name + ' uploaded successfully.');
			$("#filelist").html($("#fileitem_1").clone(true));
		}
	});
</script>
</html>
