package com.video_web.web.controller;

import com.video_web.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.*;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@Controller
@ServerEndpoint(value = "/websocket/{room_url}",configurator = SpringConfigurator.class)
public class WebSocketController {
    /***静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。被 static 修饰的成员称为静态成员或类成员。
     * 它属于整个类所有，而不是某个对象所有，使用类名直接访问
     */
    //private static int onlineCount = 0;
    private static Map<String,Integer> onlineCounts = new HashMap<>();

    private static final Map<String, Set<Session>> rooms = new ConcurrentHashMap();
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    private static CopyOnWriteArraySet<WebSocketController> webSocketSet = new CopyOnWriteArraySet<WebSocketController>();

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    /**
     * 注解来表明所修饰的方法是触发事件的回调
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @Autowired
    private RoomService roomService;

    @OnOpen
    public void onOpen(@PathParam("room_url")String room_url, Session session){
        if(!rooms.containsKey(room_url)){
            Set<Session>room=new HashSet<>();
            room.add(session);
            rooms.put(room_url,room);
        }else {
            rooms.get(room_url).add(session);
        }
        if(!onlineCounts.containsKey(room_url)){
            Integer onlineCount=1;
            onlineCounts.put(room_url,onlineCount);
        }else {
            addOnlineCount(room_url);
        }
        System.out.println("有新连接加入！房间"+room_url+"当前在线人数为" + getOnlineCount(room_url));
        System.out.println(roomService.hashCode()+"注解的hashCode");
        roomService.updateRoomOnline(room_url,getOnlineCount(room_url));
        System.out.println("a client has connected!");
        //addOnlineCount();           //在线数加1

        /*this.session = session;
        System.out.println("当前session的id是：" + session.getId());
        webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1
        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());*/
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(@PathParam("room_url")String room_url,Session session){
        rooms.get(room_url).remove(session);
        System.out.println("a client has disconnected!");
        subOnlineCount(room_url);           //在线数减1
        System.out.println("有一连接关闭！房间"+room_url+"当前在线人数为" + getOnlineCount(room_url));
        roomService.updateRoomOnline(room_url,getOnlineCount(room_url));
        /*webSocketSet.remove(this);  //从set中删除
        subOnlineCount();           //在线数减1
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
        */
    }

    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(@PathParam("room_url")String room_url, String message, Session session)throws Exception {
        System.out.println(message);
        /*message=session.getId()+":"+message;
        System.out.println(message);*/
        broadcast(room_url,message);
        /*System.out.println("来自客户端的消息:" + message);
        //群发消息
        for(WebSocketController item: webSocketSet){
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
        }*/
    }

    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @param message
     * @throws IOException
     */
    public void broadcast(String room_url,String message)throws Exception{
        for(Session session:rooms.get(room_url)){
            session.getBasicRemote().sendText(message);
        }
    }

    /*public void sendMessage(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
        //this.session.getAsyncRemote().sendText(message);
    }*/
    /**
     * 类锁保障同一时刻多个线程同时访问同一个synchronized块，当一个线程在访问时，
     * 其他的线程等待。无论是多线程访问单个对象还是多个对象的synchronized块，都是同步的*/
    public static synchronized int getOnlineCount(@PathParam("room_url")String room_url) {
        int onlineCount;
        onlineCount=onlineCounts.get(room_url);
        return onlineCount;
    }

    public static synchronized void addOnlineCount(@PathParam("room_url")String room_url) {
        int onlineCount;
        onlineCount=onlineCounts.get(room_url)+1;
        onlineCounts.put(room_url,onlineCount);
    }

    public static synchronized void subOnlineCount(@PathParam("room_url")String room_url) {
        int onlineCount;
        onlineCount=onlineCounts.get(room_url)-1;
        onlineCounts.put(room_url,onlineCount);
    }
    /*public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketController.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketController.onlineCount--;
    }*/
}