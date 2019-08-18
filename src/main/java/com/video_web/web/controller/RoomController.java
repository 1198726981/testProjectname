package com.video_web.web.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import com.video_web.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.video_web.po.*;
import com.video_web.service.UserService;
import org.springframework.web.multipart.MultipartFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class RoomController {
    //File.separator-系统有关的默认名称分隔符,Microsoft Windows 系统上，它为 '\\'

    @Autowired
    private RoomService roomService;
    @Autowired
    private UserService userService;
    //默认启动方法
    @RequestMapping(value = "/showSelectRoom", method = RequestMethod.GET)
        public String findRoom(String queryText,Model model,ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
            System.out.println("controller"+queryText);
            Integer pageSize=8;//每页显示记录数
            //分页查询
            PageHelper.startPage(pageNo, pageSize);

            if(queryText==null||queryText.length()<=0){queryText=null;}
            List<Room>roomList= roomService.findRoom(queryText);

            PageInfo<Room> pageInfo=new PageInfo<Room>(roomList);
            map.addAttribute("pageInfo", pageInfo);
            //model.addAttribute("roomList",roomList);
            return "main";
    }
//@PathVariable String room_url,@PathVariable String room_ownner
    @RequestMapping("/openRoom")
    public String selectRoomUser(@RequestParam String room_url,@RequestParam String room_ownner, Model model){
        User user=userService.checkUserCode(room_ownner);
        Room room=roomService.findRoom2(room_ownner);
        int room_play_count=room.getRoom_play_count()+1;
        roomService.updateCount(room_play_count,room_ownner);
        model.addAttribute("room_Ownner",user);
        model.addAttribute("ownner_Room",room);
        List<Video> videos=roomService.selectVideo(room_ownner);
        model.addAttribute("videos",videos);
        return room_url;
    }


    @RequestMapping("/classify")
    public String selectClassifyRoom(@RequestParam(required = false) String room_classify,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo, Model model,ModelMap map){
        Integer pageSize=8;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);

        List<Room>roomList= roomService.findRoom_classify(room_classify);
        PageInfo<Room> pageInfo=new PageInfo<Room>(roomList);
        map.addAttribute("pageInfo", pageInfo);
        //model.addAttribute("roomList",roomList);
        return "classify";
    }



    @RequestMapping("/selectSubscribe")
    public String selectSubscribe(HttpSession session, Model model,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,ModelMap map){
        Integer pageSize=8;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        User user=(User) session.getAttribute("USER_SESSION");
        List<Subscribe>subscribeList=roomService.selectSubscribe(user.getUser_code());
        List<Room>roomList=new ArrayList<Room>();
        for(Subscribe subscribedemo:subscribeList){
           roomList.add(subscribedemo.getRoom());
        }
        PageInfo<Room> pageInfo=new PageInfo<Room>(roomList);
        map.addAttribute("pageInfo", pageInfo);
        //model.addAttribute("roomList",roomList);
            return "subscribe";
    }

    @RequestMapping(value ="/showMyRoomInfo.action")
    @ResponseBody
    public Room showMyRoomInfo(HttpSession session){
        User user=(User)session.getAttribute("USER_SESSION");
        Room room=roomService.findRoom2(user.getUser_code());
        return room;
    }

    private  String uploadFilePath="D:\\uploadimg"+ File.separator;
    @RequestMapping(value ="/uploadRoomImg.action",method = RequestMethod.POST)
    @ResponseBody
    public String uploadRoomImg(@RequestParam("file") MultipartFile file, HttpSession session){
        if(file!=null&&!file.isEmpty()){
            System.out.println("文件类型:"+file.getContentType());
            String originalFilename = file.getOriginalFilename();
            String fileNamePrefix=originalFilename.substring(0,originalFilename.indexOf("."));
            System.out.println("文件名:"+fileNamePrefix);
            String newFileNamePrefix=fileNamePrefix+new Date().getTime();
            String newFileName=newFileNamePrefix+originalFilename.substring(originalFilename.lastIndexOf("."));
            System.out.println("新文件名"+newFileName);
            File imgfile=new File(uploadFilePath+newFileName);
            try {
                file.transferTo(imgfile);
                User user=(User) session.getAttribute("USER_SESSION");
                //插入数据库
                roomService.uploadImg(newFileName,user.getUser_code());
            }catch (IOException e){
                e.printStackTrace();
            }
            return newFileName;
        }else {
            return "WRONG";
        }
    }

    @RequestMapping(value="updateRoom_info.action",method = RequestMethod.POST)
    @ResponseBody
    public Room updateRoom_info(@RequestParam("room_name")String room_name,@RequestParam("selectclassify")String room_classify,HttpSession session){
        User user=(User) session.getAttribute("USER_SESSION");
        roomService.updateRoomInfo(user.getUser_code(),room_name,room_classify);
        Room room=roomService.findRoom2(user.getUser_code());
        return room;
    }
}

