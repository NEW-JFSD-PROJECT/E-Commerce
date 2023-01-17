package com.dao;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Customer;





public class CustomerDao {
	private Connection conn;

	public CustomerDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean register(Customer c) {
		boolean f = false;
		try {
			String sql = "insert into Customer_Details(fullname,gender,age,phno,email,password,address) values(?,?,?,?,?,?,?) ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,c.getFullname());
			ps.setString(2, c.getGender());
			ps.setString(3, c.getAge());
			ps.setString(4, c.getPhno());
			ps.setString(5, c.getEmail());
			ps.setString(6, c.getPassword());
			ps.setString(7, c.getAddress());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	
	}
	public Customer login(String em, String psw) {
		Customer c = null;

		try {
			String sql = "select * from Customer_Details where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Customer();
				c.setId(rs.getInt(1));
				c.setFullname(rs.getString(2));
				c.setGender(rs.getString(3));
				c.setAge(rs.getString(4));
				c.setPhno(rs.getString(5));
				c.setEmail(rs.getString(6));
				c.setPassword(rs.getString(7));
				c.setAddress(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
}
	
	public List<Customer> getAllCustomer() {
		List<Customer> list=new ArrayList<>();
		Customer c=null;
		try {

			String sql = "select * from Customer_Details order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Customer();
				c.setId(rs.getInt(1));
				c.setFullname(rs.getString(2));
				c.setGender(rs.getString(3));
				c.setAge(rs.getString(4));
				c.setPhno(rs.getString(5));
				c.setEmail(rs.getString(6));
				c.setPassword(rs.getString(7));
				c.setAddress(rs.getString(8));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
			
	}
	public Customer getCustomerById(int id) {

		Customer c= null;
		try {

			String sql = "select * from Customer_Details where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Customer();
				c.setId(rs.getInt(1));
				c.setFullname(rs.getString(2));
				c.setGender(rs.getString(3));
				c.setAge(rs.getString(4));
				c.setPhno(rs.getString(5));
				c.setEmail(rs.getString(6));
				c.setPassword(rs.getString(7));
				c.setAddress(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	public boolean deleteCustomer(int id) {
		boolean f = false;
		try {
			String sql = "delete from Customer_Details where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public boolean updateCustomer(Customer c) {
		boolean f = false;

		try {
			String sql = "update Customer_Details set fullname=?,gender=?,age=?,phno=?,email=?,password=?,address=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,c.getFullname());
			ps.setString(2, c.getGender());
			ps.setString(3, c.getAge());
			ps.setString(4, c.getPhno());
			ps.setString(5, c.getEmail());
			ps.setString(6, c.getPassword());
			ps.setString(7, c.getAddress());
			ps.setInt(8, c.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from Customer_Details where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update Customer_Details set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public boolean checkUserByEmail(String em) {
		boolean f = true;

		try {
			String sql = "select * from Customer_Details where EMAIL=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public boolean checkUserByPhone(String phone) {
		boolean f = true;

		try {
			String sql = "select * from Customer_Details where PHNO=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, phone);
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}


}
