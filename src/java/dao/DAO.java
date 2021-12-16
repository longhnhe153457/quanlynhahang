/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Category;
import entity.Food;
import entity.Person;
import entity.Position;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trinh
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Food> getAllFood() {
        String query = "select *  from product";
        List<Food> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Category> getAllCategory() {
        String query = "select *  from category";
        List<Category> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Food> getthreefood() {
        String query = "select top 3 * from product\n" + "order by id desc";
        List<Food> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Food> getCategorybyID(String cid) {
        String query = "select * from product where cateID=?";
        List<Food> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Food> searchbyname(String txt) {
        String query = "select * from product where [name] like ?";
        List<Food> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public Account login(String user, String pass) {
        String query = "select * from Account where [USER] =? and [pass] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
            return null;

        }
    public Account checkAccount(String user) {
        String query = "select * from account where [USER] =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
            return null;

        }
    public void signup(String user,String pass){
         String query = "insert into Account values(?,?,0,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        }catch (Exception e) {
        }
    }
    public void deleteProduct(String pid){
        String query="delete from product where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        }catch (Exception e) {
        }
    }
    public void insertProduct(String name, String image ,String price, String cateID ){
        String query="insert product(name,image,price,cateID) values(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
             ps.setString(4, cateID);
            ps.executeUpdate();
        }catch (Exception e) {
        }
        
    }
    public void insertcategory1(String name){
         String query = "insert category(cname) values(?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.executeUpdate();
        }catch (Exception e) {
        }  
    }
      
        public void editproduct(String name, String image ,String price,String cateID,String pid ){
        String query="update product set [name]=?,[image]=?,[price]=?,[cateID]=? where [id]=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
             ps.setString(4, cateID);
             ps.setString(5, pid);
            ps.executeUpdate();
        }catch (Exception e) {
        }
        
    }
     public int count(){
          String sql = "SELECT COUNT(*) as totalrow FROM product";
            try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("totalrow");
            }
            }catch (Exception e) {
        }
        return 0;
            
     }
    public List<Person> getAllEmployee() {
        String query = "select pe.*,po.name from person pe join position po\n"
                + "on pe.pid = po.id";
        List<Person> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Person(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
        public List<Position> getAllPosition() {
        String query = "select * from position";
        List<Position> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Position(rs.getInt(1),
                        rs.getString(2)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
   public List<Person> filter(String txt) {
        String query = "select pe.*,po.name from person pe join position po\n"
                + "                on pe.pid = po.id where pe.pid = ?";
        List<Person> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, txt);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Person(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
  public List<Person> searchbynameemployee(String txt) {
        String query = "select pe.*,po.name from person pe join position po\n"
                + "on pe.pid = po.id where pe.name like ?";
        List<Person> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Person(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public void add(String name, String age, String address, String join, String gender, String pid) {
        String query = "insert into person\n"
                + "values(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, age);
            ps.setString(3, gender);
            ps.setString(4, address);
            ps.setString(5, join);
            ps.setString(6, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
      public void deleteemployee(String id) {
        String query = "delete from person \n"
                + "where personid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
       public void edit(String name, String dob, String address, String join, String gender, String pid, String id) {
        String query = "update person \n"
                + "set [name] = ?,\n"
                + "age = ?,\n"
                + "gender = ?,\n"
                + "[address] = ?,\n"
                + "joindate = ?,\n"
                + "pid = ?\n"
                + "where personid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, dob);
            ps.setString(3, gender);
            ps.setString(4, address);
            ps.setString(5, join);
            ps.setString(6, pid);
            ps.setString(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
        public Person getEmployeebyid(String id) {
        String query = "select * from [Person] where personid=?";
         try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
              return new Person(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));
            }
            
        } catch (Exception e) {
        }
        return null;
        }
        public Food getFoodbyid(String id) {
        String query = "select *  from product where id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
              return new Food(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4));
            }
            
        } catch (Exception e) {
        }
        return null;
    }
        public int total(){
        String query="select count(*) from product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
               return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    public List<Food> pagingAccount(int index){
        List<Food> list =new ArrayList<>();
        String query="SELECT id,name,image,price FROM (SELECT ROW_NUMBER() OVER (ORDER BY id ASC) as rownum,p.id,p.name,p.image,p.price FROM product p ) as tblHuman WHERE\n" +
"                    rownum > ? AND rownum <= ?" ;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index-1)*6);
            ps.setInt(2, (index)*6);
            rs = ps.executeQuery();
              while (rs.next()) {
                list.add(new Food(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4)));
            }
              return list;
        } catch (Exception e) {
        }
        return null;
    }
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        System.out.println(dao.count());
//    }

    public void deleteCategory(String id) {
         String query="delete from category where cid=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        }catch (Exception e) {
        }
    }
    }
