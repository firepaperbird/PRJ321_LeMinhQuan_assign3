/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author paper
 */
public class StoredUser {
    private Map<String,String> keyLock = new HashMap<>();

    public StoredUser() {
    }
    public boolean addUser(String id, String password){
        if(keyLock.containsKey(id))
            return false; // duplicate ID 
        else{
            keyLock.put(id, password);
            return true;
        }
    }
    public boolean isUser(String id, String password){
        if(keyLock.containsKey(id)){
            if(keyLock.get(id).equals(password)){
                return true;
            }
        }
        return false;
    }
    public String getPss(String id){
        return keyLock.get(id);
    }
    public int countUser(){
        return keyLock.size();
    }
    public boolean haveUsed(String id){
        if(keyLock.containsKey(id)){
            return true;
        }
        return false;
    }
}
