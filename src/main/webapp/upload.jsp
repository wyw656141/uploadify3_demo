<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%
	String ConstantDATUM_UPLOAD_PATH="C:\\uploadDatumTemp";
	request.setCharacterEncoding("utf-8");
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List list = upload.parseRequest(request);
	String fileId = "";	
	for(int i=0; i<list.size(); i++) {		
		FileItem el = (FileItem) list.get(i);		
		//判断FileItem类对象封装的数据是否属于一个普通表单字段，还是属于一个文件表单字段
		if(!el.isFormField()) {//属于一个文件表单字段
			String id="wyw0001";//原来系统生成8位id
			String fileName = el.getName();		
			fileId = id + fileName.substring(fileName.lastIndexOf("."));
			File file = new File(ConstantDATUM_UPLOAD_PATH, fileId);
			File parent = file.getParentFile(); 
			if(parent!=null&&!parent.exists()){ 
			parent.mkdirs(); 
			} 

			try{
				el.write(file);
			}catch(Exception e){
				return;
			}
		} else {
			String name = el.getFieldName();
			String value = el.getString();
			if(name.equals("oldFileName")) {
				File file = new File(ConstantDATUM_UPLOAD_PATH + "/" + value);
				file.delete();
			}
		}
	}
%>
{"fileName" : '<%=fileId%>'}

