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
public class KeywordBean {
    
    private String time;
    private String keyword;
    private int count; 
    
    public KeywordBean(){
        
    }
    
    public void setTime(String time){
        this.time = time;
    }
    
    
    public String getTime(){
        return time;
    }
    
    public void setKeyword(String kw){
        this.keyword = kw;
    }
    
    
    public String getKeyword(){
        return keyword;
    }
    
    public int getCount(){
        return count;
    }
    
    
    public void setCount(int count){
        this.count = count;
    }
    
    
}
