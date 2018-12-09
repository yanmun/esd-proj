/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.RestaurantBean;
import ict.bean.UserBean;
import java.util.ArrayList;

/**
 *
 * @author pearh
 */
public class Test {

    public static void main(String[] arg) {
//        AccountDB db = new AccountDB();
//        UserBean user = new UserBean();
//        user.setUsername("a");
//        user.setPassword("123");
//        user.setTel("32165478");
//        user.setEmail("123@com");
//        user.setFname("firstname:");
//        user.setLname("lastname");
//        boolean change = db.editRecord(user);
//        if (change) {
//            System.out.print("OK");
//        } else {
//            System.out.print("NO");
//        }
        RestaurantDB db = new  RestaurantDB();
        RestaurantBean rb = null;
        ArrayList <RestaurantBean> r = new ArrayList<RestaurantBean>();
        r= db.queryByUsername("hll");
        for(int i=0;i<r.size();i++){
             System.out.println(r.get(i).getEnd_hour());
        }
       

    }

}
