/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author hoang
 */
public class Person {
    
    private int personID;
    private String name;
    private int age;
    private int gender;
    private String address;
    private String joinDate;
    private int pid;
    private String pname;

    public Person() {
    }

    public Person(int personID, String name, int age, int gender, String address, String joinDate, int pid, String pname) {
        this.personID = personID;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.address = address;
        this.joinDate = joinDate;
        this.pid = pid;
        this.pname = pname;
    }
    public Person(int personID, String name, int age, int gender, String address, String joinDate, int pid) {
        this.personID = personID;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.address = address;
        this.joinDate = joinDate;
        this.pid = pid;
    }

    public int getPersonID() {
        return personID;
    }

    public void setPersonID(int personID) {
        this.personID = personID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

}
