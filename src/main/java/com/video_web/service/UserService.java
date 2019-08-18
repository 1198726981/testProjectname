package com.video_web.service;
import com.video_web.po.User;
import com.video_web.po.Subscribe;
import com.video_web.po.Video;

import java.util.List;

public interface UserService {
    public User findUser(String usercode,String password);
    public User findUser2(String usercode);
    public int registerUser(String username,String usercode,String password);
    public User checkUserCode(String usercode);
    public int addSubscribe(String user_code, String room_url);
    public Subscribe checkSubscribe(String user_code, String room_url);
    public int update_userInfo(String user_name,String password,Integer age,String gender,String user_code);
    public int uploadImg(String user_img,String user_code);
    public int addVideo(String user_code,String video_url,String video_name);
    public List<Video> selectVideos(String user_code);
    public List<Video> selectAllUserVideos();
    public Video selectVideo(String video_name);
    public int updateApp(String user_code);
    public int deleteVideo(String user_code,String video_name);
    public List<User>selectUserAppList();
    public int updateUserIdentity(String user_code);
}
