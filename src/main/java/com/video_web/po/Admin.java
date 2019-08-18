package com.video_web.po;

import java.util.List;

public class Admin {
    private String user_code;
    private String video_url;
    private List<String> userAppList;
    private List<String> userVideoList;


    public String getUser_code() {
        return user_code;
    }

    public void setUser_code(String user_code) {
        this.user_code = user_code;
    }

    public String getVideo_url() {
        return video_url;
    }

    public void setVideo_url(String video_url) {
        this.video_url = video_url;
    }

    public List<String> getUserAppList() {
        return userAppList;
    }

    public void setUserAppList(List<String> userAppList) {
        this.userAppList = userAppList;
    }

    public List<String> getUserVideoList() {
        return userVideoList;
    }

    public void setUserVideoList(List<String> userVideoList) {
        this.userVideoList = userVideoList;
    }
}
