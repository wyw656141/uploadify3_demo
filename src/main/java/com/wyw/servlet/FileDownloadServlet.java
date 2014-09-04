package com.wyw.servlet;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadServlet
 */
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
				String ConstantDATUM_UPLOAD_PATH="C:\\uploadDatumTemp\\";//上传路径读取配置文件
	            String filename = "0001.java";//此处应当读取request请求的文件（文件名根据业务需求可能重新设置过）
	            response.reset();
	            response.setContentType("application/x-msdownload");
	            response.addHeader("Content-Disposition", "attachment;filename="
	                    + new String(filename.getBytes("gb2312"), "ISO8859-1"));
	            FileInputStream fis = new FileInputStream(new java.io.File(ConstantDATUM_UPLOAD_PATH+filename));
	            BufferedInputStream br = new BufferedInputStream(fis);
	            OutputStream output = response.getOutputStream();
	            byte[] buf = new byte[4048];
	            int len;
	            try {
	                while ((len = br.read(buf)) > 0) {
	                    output.write(buf, 0, len);
	                }
	            } catch (Exception e) {
	                String msg = "文件不存在";
	                output.write(("<script type='text/javascript'>alert('" + msg + "');</script>").getBytes("UTF-8"));
	            } finally {
	                fis.close();
	                output.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
