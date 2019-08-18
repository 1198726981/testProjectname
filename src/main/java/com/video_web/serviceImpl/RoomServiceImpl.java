package com.video_web.serviceImpl;

import com.video_web.dao.RoomDao;
import com.video_web.po.Room;
import com.video_web.po.Subscribe;
import com.video_web.po.Video;
import com.video_web.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("roomService")
@Transactional
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomDao roomDao;

    public List<Room> findRoom(String queryText){
        System.out.println("serviceimpl"+queryText);
        List<Room> roomList=roomDao.findRoom(queryText);
        return roomList;
    }

    public Room findRoom2(String room_ownner){
        return roomDao.findRoom2(room_ownner);
    }

    public List<Room> findRoom_classify(String room_classify){
        return roomDao.findRoom_classify(room_classify);
    }

    public List<Subscribe> selectSubscribe(String user_code){
        return roomDao.selectSubscribe(user_code);
    }

    public int updateCount(int room_play_count,String room_ownner){
        return roomDao.updateCount(room_play_count,room_ownner);
    }

    public List<Video>selectVideo(String user_code){
        return roomDao.selectVideo(user_code);
    }

    public int insertNewRoom(String user_code,String room_url){
        return roomDao.insertNewRoom(user_code,room_url);
    }

    public int updateRoomOnline(String room_url,int room_online){
        System.out.println(room_url);
        System.out.println(room_online);
        return roomDao.updateRoomOnline(room_url,room_online);
    }

    public int uploadImg(String room_img,String room_ownner){
        return roomDao.uploadImg(room_img,room_ownner);
    }

    public int updateRoomInfo(String room_ownner,String room_name,String room_classify){
        return roomDao.updateRoomInfo(room_ownner,room_name,room_classify);
    }
}


    /*public Page<Customer>findCustomerList(Integer page,Integer rows,String custName,String custSource,String custIndustry,String custLevel){
        Customer customer=new Customer();
        if(custName!=null){
            customer.setCust_name(custName);
        }
        if(custSource!=null){
            customer.setCust_source(custSource);
        }
        if(custIndustry!=null){
            customer.setCust_industry(custIndustry);
        }
        if(custLevel!=null){
            customer.setCust_level(custLevel);
        }

        //当前页，start=起始行
        customer.setStart((page-1)*rows);
        //每页数，rows=所取行数
        customer.setRows(rows);
        //查询客户列表
        List<Customer>customers=customerDao.selectCustomerList(customer);
        //查询客户列表总记录数
        Integer count=customerDao.selectCustomerListCount(customer);
        //创建page返回对象
        Page<Customer>result=new Page<Customer>();
        result.setPage(page);
        result.setRows(customers);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }*/