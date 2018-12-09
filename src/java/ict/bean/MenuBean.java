/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

/**
 *
 * @author pearh
 */
public class MenuBean {
    private String id;
    private String path;
    private String restID;
    private String status;
    private String type;
    private String menu_desc;
    
    
    public MenuBean(){
        
    }
    
    public void setID(String id){
        this.id = id;
    }
    
    public String getID(){
        return id;
    }
    
    
    public void setPath(String path){
        this.path = path;
    }
    
    
    public String getPath(){
        return path;
    }
    
    public void setRestID(String id){
        this.restID = restID;
    }
    
    public String getRestID(){
        return restID;
        
    }
    
    
    public void setStatus(String status){
        this.status = status;
    }
    
    public String getStatus(){
        return status;
    }
    
    public void setType(String type){
        this.type = type;
    }
    
    public String getType(){
        return type;
    }
    
    public void setMenu_desc(String menu_desc){
        this.menu_desc = menu_desc;
        
    }
    
    public String getMenu_desc(){
        return menu_desc;
    }
}
