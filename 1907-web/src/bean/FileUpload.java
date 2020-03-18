package bean;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUpload {
   String upload = "C:\\Users\\choi\\git\\1907-web\\1907-web\\WebContent\\upload\\"; // 파일을 저장할 경로
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
   
   public MemberVo2 uploading() {
      MemberVo2 vo = new MemberVo2();
      List<MemberPhoto> photoList = new ArrayList<MemberPhoto>();
      
      
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
               case "mId": // input type= 'text' name='mId'인가
                  vo.setmId(v);
               break;
               
               case "pwd":
                  vo.setPwd(v);
               break;
               
               case "mName":
                  vo.setmName(v);
               break;
               
               case "rDate":
                  vo.setrDate(v);
               break;
               
               case "grade":
                  vo.setGrade(Integer.parseInt(v));
               break;
               case "findStr":
            	   req.setAttribute("findStr", v);
               break;
               } // end of switch
            } else { // <input type='file'/>
               if(fi.getSize()>0) {
                  String f = fi.getName();
                  String sysfile = new Date().getTime()+"-"+f;
                  
                  MemberPhoto p = new MemberPhoto();
                  p.setOriFile(f);
                  p.setSysFile(sysfile);
                  photoList.add(p);
                  
                  File file = new File(upload + sysfile);
                  fi.write(file); // 파일을 저장함
                  fi.delete(); // 임시파일을 지움
                  
               }
            } // end of i/e
         } // end of for
      } catch (Exception e) {
         // TODO: handle exception
      } // end of t/c
      
      vo.setPhotos(photoList);
      return vo;
   } // end of if
   
} // end of class