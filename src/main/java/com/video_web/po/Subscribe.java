package com.video_web.po;

public class Subscribe {
    private int subscribe_id;
    private String user_code;
    private Room room;
    private String room_url;

    public String getRoom_url() {
        return room_url;
    }

    public void setRoom_url(String room_url) {
        this.room_url = room_url;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public int getSubscribe_id() {
        return subscribe_id;
    }

    public void setSubscribe_id(int subscribe_id) {
        this.subscribe_id = subscribe_id;
    }

    public String getUser_code() {
        return user_code;
    }

    public void setUser_code(String user_code) {
        this.user_code = user_code;
    }


}
