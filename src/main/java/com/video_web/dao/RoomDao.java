package com.video_web.dao;

import com.video_web.po.Room;
import com.video_web.po.Subscribe;
import com.video_web.po.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomDao {
    public List<Room> findRoom(@Param("queryText") String queryText);
    public Room findRoom2(String room_ownner);
    public List<Room> findRoom_classify(String room_classify);
    public List<Subscribe> selectSubscribe(String user_code);
    public int updateCount(@Param("room_play_count") int room_play_count,@Param("room_ownner") String room_ownner);
    public List<Video>selectVideo(@Param("user_code") String user_code);
    public int insertNewRoom(@Param("user_code") String user_code,@Param("room_url")String room_url);
    public int updateRoomOnline(@Param("room_url")String room_url,@Param("room_online")int room_online);
    public int uploadImg(@Param("room_img")String room_img,@Param("room_ownner")String room_ownner);
    public int updateRoomInfo(@Param("room_ownner") String room_ownner,@Param("room_name")String room_name,@Param("room_classify")String room_classify);
}
