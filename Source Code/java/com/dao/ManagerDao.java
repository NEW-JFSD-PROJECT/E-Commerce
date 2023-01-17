package com.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Customer;
import com.entity.Manager;



public class ManagerDao {

	private Connection conn;

	public ManagerDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerManager(Manager m) {
		boolean f = false;

		try {
			String sql = "insert into manager(fullName,dob,age,email,mobNo,password) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,m.getFullName());
			ps.setString(2,m.getDob());
			ps.setString(3, m.getAge());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getMobNo());
			ps.setString(6,m.getPassword());
	
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public Manager login(String em, String psw) {
		Manager m= null;

		try {
			String sql = "select * from manager where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new Manager();
				m.setId(rs.getInt(1));
				m.setFullName(rs.getString(2));
				m.setDob(rs.getString(3));
				m.setAge(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setMobNo(rs.getString(6));
				m.setPassword(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
}
	public List<Manager> getAllManager() {
		List<Manager> list = new ArrayList<Manager>();
		Manager m = null;
		try {

			String sql = "select * from manager order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new Manager();
				m.setId(rs.getInt(1));
				m.setFullName(rs.getString(2));
				m.setDob(rs.getString(3));
				m.setAge(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setMobNo(rs.getString(6));
				m.setPassword(rs.getString(7));
				list.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Manager getManagerById(int id) {

		Manager m = null;
		try {

			String sql = "select * from manager where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new Manager();
				m.setId(rs.getInt(1));
				m.setFullName(rs.getString(2));
				m.setDob(rs.getString(3));
				m.setAge(rs.getString(4));
				m.setEmail(rs.getString(5));
				m.setMobNo(rs.getString(6));
				m.setPassword(rs.getString(7));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	public boolean deleteManager(int id) {
		boolean f = false;
		try {
			String sql = "delete from manager where id=?";
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
	public boolean updateManager(Manager m ) {
		boolean f = false;

		try {
			String sql = "update manager set fullName=?,dob=?,age=?,email=?,mobNo=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,m.getFullName());
			ps.setString(2,m.getDob());
			ps.setString(3, m.getAge());
			ps.setString(4, m.getEmail());
			ps.setString(5, m.getMobNo());
			ps.setString(6,m.getPassword());
			ps.setInt(7, m.getId());
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
			String sql = "select * from manager where id=? and password=?";
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
			String sql = "update manager set password=? where id=?";
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
	public int countProduct() {
		int i = 0;
		try {
			String sql = "select * from product";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public int countCustomer() {
		int i = 0;
		try {
			String sql = "select * from CUSTOMER_DETAILS";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countManager() {
		int i = 0;
		try {
			String sql = "select * from MANAGER";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	public int countCategory() {
		int i = 0;
		try {
			String sql = "select * from CATEGORY";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	


}

