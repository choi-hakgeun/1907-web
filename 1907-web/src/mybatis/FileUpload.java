package mybatis;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.Page;

public class FileUpload {
   static public String upload = "C:\\Users\\choi\\git\\1907-web\\1907-web\\WebContent\\upload\\"; // 파일을 저장할 경로
   String tempDir = "c:/temp/";
   
   int maxSize = 1024*1024*50; // byte 크기
   HttpServletRequest req;
   HttpServletResponse resp;
   
   public FileUpload(HttpServletRequest req, HttpServletResponse resp) {
      this.req = req;
      this.resp = resp;
   }
   
   public boolean uploadFormCheck() {
      boolean flag = ServletFileUpload.isMultipartContent(req);
      
      return flag;
   }
   
   public HttpServletRequest uploading() {
	  BoardVo vo = new BoardVo();
      List<AttVo> attList = new ArrayList<AttVo>(); //첨부파일목록
      List<AttVo> delList = new ArrayList<AttVo>(); //삭제파일목록
      Page p = new Page();
      
      DiskFileItemFactory factory = new DiskFileItemFactory(); // 외워야함
      factory.setSizeThreshold(4096); // 파일을 업로드할때 쓰는 메모리의 크기(버퍼)
      factory.setRepository(new File(tempDir)); // 파일이 저장될때 사용되는 임시 디렉토리
      
      ServletFileUpload sf = new ServletFileUpload(factory);
      sf.setHeaderEncoding("UTF-8"); // 파일명등 한글일때 안 깨지게 하기 위함
      sf.setFileSizeMax(maxSize); // 저장될 파일의 최대크기
      
      try {
         List<FileItem> list = sf.parseRequest(req);
         
         for(FileItem fi : list) {
            String v = fi.getString("UTF-8");
            String k = fi.getFieldName();
            
            if(fi.isFormField()) {
               switch(k) {
               case "id": // input type= 'text' name='mId'인가
                  vo.setId(v);
                  break;
               
               case "pwd":
                  vo.setPwd(v);
                  break;               
               case "subject":
                  vo.setSubject(v);
                  break;
               case "content":
                   vo.setContent(v);
                   break;
               case "mDate":
            	   vo.setmDate(v);
            	   break;
                   
               case "serial":
                   vo.setSerial(Integer.parseInt(v));
                   break;
               case "pSerial":
                   vo.setpSerial(Integer.parseInt(v));
                   break;
                   
               case "delFile":
                   AttVo attVo = new AttVo();
                   attVo.setSysFile(v);
                   delList.add(attVo);
                   break;
                   
               case "findStr":
            	   p.setFindStr(v);
            	   break;              
               case "nowPage":
            	   if(v != null && v != "") {
            		   System.out.println("fileupload nowPage" + v);
            		   p.setNowPage(Integer.parseInt(v));
            	   }
            	   break;
               } // end of switch
            } else { // <input type='file'/>
               if(fi.getSize()>0) {
                  String f = fi.getName();
                  String sysfile = new Date().getTime()+"-"+f;                  
                  
                  AttVo attVo = new AttVo();
                  attVo.setOriFile(f);
                  attVo.setSysFile(sysfile);
                  attList.add(attVo);
                  
                  File file = new File(upload + sysfile);
                  fi.write(file); // 파일을 저장함
                  fi.delete(); // 임시파일을 지움
                  
               }
            } // end of i/e
         } // end of for
      } catch (Exception e) {
         e.printStackTrace();
      } // end of t/c
      
      req.setAttribute("vo", vo);
      req.setAttribute("attList", attList);
      req.setAttribute("delList", delList);
      req.setAttribute("p", p);
      
      return req;
   } // end of if
   
} // end of class