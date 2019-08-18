package com.video_web.service;

import com.video_web.po.Room;
import com.video_web.po.Subscribe;
import com.video_web.po.Video;

import java.util.List;

public interface RoomService {
    public List<Room> findRoom(String queryText);
    public Room findRoom2(String room_ownner);
    public List<Room> findRoom_classify(String room_classify);
    public List<Subscribe> selectSubscribe(String user_code);
    public int updateCount(int room_play_count,String room_ownner);
    public List<Video>selectVideo(String user_code);
    public int insertNewRoom(String user_code,String room_url);
    public int updateRoomOnline(String room_url,int room_online);
    public int uploadImg(String room_img,String room_ownner);
    public int updateRoomInfo(String room_ownner,String room_name,String room_classify);
}
