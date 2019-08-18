package com.video_web.po;

public class Room {
    private Integer room_id;
    private String room_ownner;
    private String room_name;
    private String room_img;
    private Integer room_online;
    private Integer room_play_count;
    private String room_url;
    private String room_classify;

    public String getRoom_classify() {
        return room_classify;
    }

    public void setRoom_classify(String room_classify) {
        this.room_classify = room_classify;
    }

    public String getRoom_url() {
        return room_url;
    }

    public void setRoom_url(String room_url) {
        this.room_url = room_url;
    }

    public Integer getRoom_id() {
        return room_id;
    }

    public void setRoom_id(Integer room_id) {
        this.room_id = room_id;
    }

    public String getRoom_ownner() {
        return room_ownner;
    }

    public void setRoom_ownner(String room_ownner) {
        this.room_ownner = room_ownner;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getRoom_img() {
        return room_img;
    }

    public void setRoom_img(String room_img) {
        this.room_img = room_img;
    }

    public Integer getRoom_online() {
        return room_online;
    }

    public void setRoom_online(Integer room_online) {
        this.room_online = room_online;
    }

    public Integer getRoom_play_count() {
        return room_play_count;
    }

    public void setRoom_play_count(Integer room_play_count) {
        this.room_play_count = room_play_count;
    }
}
