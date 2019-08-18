package com.video_web.serviceImpl;
import com.video_web.po.Subscribe;
import com.video_web.po.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.video_web.po.User;
import com.video_web.dao.UserDao;
import com.video_web.service.UserService;

import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public User findUser(String usercode, String password) {
        User user=this.userDao.findUser(usercode,password);
        return user;
    }

    public User findUser2(String usercode) {
        User user=this.userDao.findUser2(usercode);
        return user;
    }

    @Override
    public int registerUser(String username,String usercode,String password){
        return userDao.registerUser(username,usercode,password);
    }

    public User checkUserCode(String usercode){
        return userDao.checkUserCode(usercode);
    }

    public int addSubscribe(String user_code,String room_url){
        return userDao.addSubscribe(user_code,room_url);
    }

    public Subscribe checkSubscribe(String user_code, String room_url){
        return userDao.checkSubscribe(user_code,room_url);
    }

    public int update_userInfo(String user_name,String password,Integer age,String gender,String user_code){
        return userDao.update_userInfo(user_name,password,age,gender,user_code);
    }

    public int uploadImg(String user_img,String user_code){
        return userDao.uploadImg(user_img,user_code);
    }

    public int addVideo(String user_code,String video_url,String video_name){
        return userDao.addVideo(user_code,video_url,video_name);
    }

    public List<Video> selectVideos(String user_code){
        return userDao.selectVideos(user_code);
    }

    public Video selectVideo(String video_name){
        return userDao.selectVideo(video_name);
    }

    public int updateApp(String user_code){
        return userDao.updateApp(user_code);
    }

    public int deleteVideo(String user_code,String video_name){
        return userDao.deleteVideo(user_code,video_name);
    }

    public List<User>selectUserAppList(){
        return userDao.selectUserAppList();
    }

    public int updateUserIdentity(String user_code){
        return userDao.updateUserIdentity(user_code);
    }

    public List<Video> selectAllUserVideos(){
        return userDao.selectAllUserVideos();
    }
}
