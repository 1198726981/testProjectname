package com.video_web.web.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.video_web.po.Admin;
import com.video_web.po.Subscribe;
import com.video_web.po.Video;
import com.video_web.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.video_web.po.User;
import com.video_web.service.UserService;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoomService roomService;
    @RequestMapping(value = "/login.action",method = RequestMethod.POST)
    @ResponseBody
    public String login(String user_code,String password,Model model,HttpSession session){
        User user=userService.findUser(user_code,password);
        if(user!=null){
            session.setAttribute("USER_SESSION",user);
            return "OK";
        }
        return "FALL";
    }

    @RequestMapping(value="/register.action",method = RequestMethod.POST)
    @ResponseBody
    public String register(String new_username,String new_usercode,String new_password,String new_password2,Model model) {
        if (!new_password.equals(new_password2)) {
            return "WRONG";
        } else {
            if(userService.checkUserCode(new_usercode)!=null){
                return "WRONG2";
                }else{
                    int rows = userService.registerUser(new_username, new_usercode, new_password);
                    if (rows > 0) {
                        return "OK";
                    }else{
                        return "FALL";
                    }
                }
            }
    }

    @RequestMapping(value="/logout.action")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:showSelectRoom";
    }

    @RequestMapping(value = "/addSubscribe.action",method = RequestMethod.POST)
    @ResponseBody
    public String addSubscribe(String user_code, String room_url){
        Subscribe subscribe =userService.checkSubscribe(user_code, room_url);
        //输出内存地址
        System.out.println(subscribe);
        if(subscribe!=null){
            return "WRONG";
        }
        int rows = userService.addSubscribe(user_code, room_url);
        if (rows > 0) {
            return "OK";
        }else{
            return "FALL";
        }
    }

    @RequestMapping(value = "/update.action",method = RequestMethod.POST)
    @ResponseBody
    public String updateCustomer(String user_name,String password,Integer age,String gender,HttpSession session,Model model){
        System.out.println("**"+gender);
        User user=(User)session.getAttribute("USER_SESSION");
        int row=userService.update_userInfo(user_name,password,age,gender,user.getUser_code());
        if(row>0){
            return "OK";
        }else {
            return "FALL";
        }
    }

    //@RequestParam注解将请求参数绑定至方法参数，required=false即不强制要求必须传参
// private String uploadPath=request.getSession().getServletContext().getRealPath("/");
    private  String uploadPath="D:\\uploadimg"+ File.separator;
    @RequestMapping(value = "/uploadImg.action",method =  RequestMethod.POST)
    public String fileUpload(@RequestParam(value = "file",required = false) MultipartFile multipartFile, Model model,HttpSession session,HttpServletRequest request) throws IOException {
        if(multipartFile!=null&&!multipartFile.isEmpty()){
            //1.截取原始文件名
            String originalFilename=multipartFile.getOriginalFilename();
            System.out.println(originalFilename);
            //2.截取原文件名的前缀
            String fileNamePrefix=originalFilename.substring(0,originalFilename.indexOf("."));
            //3.将源文件+时间戳
            String newFileNamePrefix=fileNamePrefix+new Date().getTime();
            //4.新文件名+后缀
            String newFileName=newFileNamePrefix+originalFilename.substring(originalFilename.lastIndexOf("."));
            //5.构建文件对象
            //String url = request.getSession().getServletContext().getRealPath("/img");
            //System.out.println(url);
            //url=url+"/";
            //System.out.println(url+newFileName);
            File file=new File(uploadPath+newFileName);
            //6.上传至新建文件对象
            try {
                multipartFile.transferTo(file);
                model.addAttribute("fileName",newFileName);
                System.out.println(uploadPath+newFileName);
                System.out.println(newFileName);
                System.out.println("session的sessionId"+session.getId());
                System.out.println("request的sessionId"+request.getSession().getId());
                User user=(User) session.getAttribute("USER_SESSION");
                //session的id
                System.out.println("session的sessionId"+session.getId());
                System.out.println("request的sessionId"+request.getSession().getId());
                user.setUser_img(newFileName);
                session.setAttribute("USER_SESSION",user);
                System.out.println("session的sessionId"+session.getId());
                System.out.println("request的sessionId"+request.getSession().getId());
                //插入数据库
                userService.uploadImg(newFileName,user.getUser_code());
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        return "userinfo";
        //遍历数据库
    }

    private  String uploadFilePath="D:\\uploadvideo"+ File.separator;
    @RequestMapping(value ="/uploadFile",method = RequestMethod.POST)
    @ResponseBody
    public Video uploadFile(@RequestParam("file") MultipartFile file, HttpSession session){
        if(file!=null&&!file.isEmpty()){
            System.out.println("文件类型:"+file.getContentType());
            String filename = file.getOriginalFilename();
            System.out.println("文件名:"+filename);
            String fileNamePrefix=filename.substring(0,filename.indexOf("."));
            System.out.println("文件前缀:"+fileNamePrefix);
            String suffix = filename.substring(filename.length() - 3);
            System.out.println("文件后缀:"+suffix);
            System.out.println("文件大小:"+file.getSize()/1024+"KB");
            File video=new File(uploadFilePath+filename);
            User user=(User)session.getAttribute("USER_SESSION");
            userService.addVideo(user.getUser_code(),filename,fileNamePrefix);
            Video video1=userService.selectVideo(fileNamePrefix);
            try {
                //将文件写入创建的路径
                file.transferTo(video);

            } catch (IOException e) {
                e.printStackTrace();
            }
            return video1;
        }else {
            return null;
        }
    }

    @RequestMapping(value ="/showAllVideo",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> showAllVideo( HttpSession session){
        User user=(User)session.getAttribute("USER_SESSION");
        List<Video> videoList=userService.selectVideos(user.getUser_code());
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("videoList",videoList);
        return map;
    }

    @RequestMapping(value ="/addApplication",method = RequestMethod.POST)
    public String addApplication(String user_code,String user_name,Model model, HttpSession session){
        User user=(User)session.getAttribute("USER_SESSION");
        if(user_code.equals(user.getUser_code())&&user_name.equals(user.getUser_name())){
            int row=userService.updateApp(user_code);
            if(row>0){
                model.addAttribute("appMessage", "申请成功");
            }
            else {
                model.addAttribute("appMessage", "已经申请，请等待!");
            }
        }else {
            model.addAttribute("appMessage", "账号名和姓名不匹配");
        }
        return"userinfo";
    }

    @RequestMapping(value ="/deleteVideo.action")
    @ResponseBody
    public String deleteVideo(HttpSession session,@RequestParam("video_name")String video_name){
        System.out.println(video_name);
        User user=(User)session.getAttribute("USER_SESSION");
        int row=userService.deleteVideo(user.getUser_code(),video_name);
        if(row>0){
            return "SUCCESS";
        }else {
            return "FALL";
        }
    }

    @RequestMapping(value ="/userAppsList.action")
    @ResponseBody
    public Map<String,Object> userAppsList(){
        List<User>userList=userService.selectUserAppList();
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("userList",userList);
        return map;
    }

    private String path="C:\\Users\\walse\\IdeaProjects\\testProjectname\\src\\main\\webapp\\jsp"+ File.separator;
    private String templatePath="room-template.jsp";
    @RequestMapping(value ="/consentApp.action",method = RequestMethod.GET)
    @ResponseBody
    public String updateUserIdentity(@RequestParam("user_code")String user_code){
        String uuid= UUID.randomUUID().toString();
        uuid=uuid.replace("-","");
        User user=userService.findUser2(user_code);
        if(user.getIdentity()==1){
            File templatefile=new File(path+templatePath);
            File newfile=new File(path+File.separator+uuid+".jsp");//创建新抽象文件
            if(!templatefile.exists()||!templatefile.isFile()) {
                System.out.println("复制文件莫得¿¿¿");
                return "Fall";
            }
            try {
                newfile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                FileInputStream fin=new FileInputStream(templatefile);//输入流
                try {
                    FileOutputStream fout=new FileOutputStream(newfile,true);//输出流
                    byte[]b=new byte[16474];
                    try {
                        while((fin.read(b))!=-1) {//读取到末尾 返回-1 否则返回读取的字节个数
                            fout.write(b);
                        }
                        fin.close();
                        fout.close();
                        System.out.println("success创建");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            userService.updateUserIdentity(user_code);
            roomService.insertNewRoom(user.getUser_code(),uuid);
            return "SUCCESS";
        }else {
            return "OK";
        }
    }

    @RequestMapping(value ="/selectAllUserVideos.action",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> showAllUserVideo( HttpSession session){
        List<Video> AllUservideoList=userService.selectAllUserVideos();
        Map<String,Object>map=new HashMap<String, Object>();
        map.put("AllUservideoList",AllUservideoList);
        return map;
    }

    @RequestMapping(value ="/adminDeleteVideo.action")
    @ResponseBody
    public String adminDeleteVideo(@RequestParam("video_name")String video_name,@RequestParam("user_code")String user_code){
        System.out.println(video_name);
        System.out.println(user_code);
        int row=userService.deleteVideo(user_code,video_name);
        if(row>0){
            return "SUCCESS";
        }else {
            return "FALL";
        }
    }
}
