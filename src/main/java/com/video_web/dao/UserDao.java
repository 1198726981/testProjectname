package com.video_web.dao;
import com.video_web.po.Subscribe;
import com.video_web.po.Video;
import org.apache.ibatis.annotations.Param;
import com.video_web.po.User;

import java.util.List;

public interface UserDao {
    public User findUser(@Param("user_code")String usercode,@Param("password")String password);
    public User findUser2(@Param("user_code")String usercode);
    public int registerUser(@Param("user_name")String username,@Param("user_code")String usercode,@Param("password")String password);
    public User checkUserCode(String user_code);
    public int addSubscribe(@Param("user_code") String user_code,@Param("room_url") String room_url);
    public Subscribe checkSubscribe(@Param("user_code") String user_code, @Param("room_url") String room_url);
    public int update_userInfo(@Param("user_name") String user_name,@Param("password")String password,@Param("age")Integer age,@Param("gender")String gender,@Param("user_code")String user_code);
    public int uploadImg(@Param("user_img") String user_img,@Param("user_code")String user_code);
    public int addVideo(@Param("user_code")String user_code,@Param("video_url")String video_url,@Param("video_name")String video_name);
    public List<Video> selectVideos(@Param("user_code")String user_code);
    public Video selectVideo(String video_name);
    public int updateApp(String user_code);
    public int deleteVideo(@Param("user_code")String user_code,@Param("video_name")String video_name);
    public List<User>selectUserAppList();
    public int updateUserIdentity(String user_code);
    public List<Video> selectAllUserVideos();
}
