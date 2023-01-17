package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Customer;
import com.entity.Order;

public class OrderDao {

	private Connection conn;

	public OrderDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addOrder(List<Order> olist) {
		boolean f = false;
		try {
			String sql = "INSERT INTO ORDER_DETAILS(ORDER_ID,USER_NAME,PHONE,EMAIL,ADRESS,PRODUCT_NAME,CATEGORY,PRICE,PAYMENT,CID,STASTUS) values(?,?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);

			PreparedStatement ps = conn.prepareStatement(sql);

			for (Order o : olist) {
				ps.setString(1, o.getOrder_id());
				ps.setString(2, o.getUser_name());
				ps.setString(3, o.getPhone());
				ps.setString(4, o.getEmail());
				ps.setString(5, o.getAdress());
				ps.setString(6, o.getProduct_name());
				ps.setString(7, o.getCategory());
				ps.setString(8, o.getPrice());
				ps.setString(9, o.getPayment());
				ps.setString(9, o.getPayment());
				ps.setInt(10, o.getCid());
				ps.setString(11, o.getStastus());
				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Order> getOrder(int id) {
		List<Order> list = new ArrayList<Order>();
		Order o = null;
		try {

			String sql = "SELECT * FROM ORDER_DETAILS WHERE CID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUser_name(rs.getString(3));
				o.setPhone(rs.getString(4));
				o.setEmail(rs.getString(5));
				o.setAdress(rs.getString(6));
				o.setProduct_name(rs.getString(7));
				o.setCategory(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				o.setCid(rs.getInt(11));
				o.setStastus(rs.getString(12));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	public List<Order> getAllOrder(){
		List<Order> list = new ArrayList<Order>();
		Order o = null;
		try {

			String sql = "SELECT * FROM ORDER_DETAILS";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUser_name(rs.getString(3));
				o.setPhone(rs.getString(4));
				o.setEmail(rs.getString(5));
				o.setAdress(rs.getString(6));
				o.setProduct_name(rs.getString(7));
				o.setCategory(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				o.setCid(rs.getInt(11));
				o.setStastus(rs.getString(12));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

		
	}
	public Order getAllOrder(int id) {
		
		Order o = null;
		try {

			String sql = "SELECT * FROM ORDER_DETAILS WHERE ID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUser_name(rs.getString(3));
				o.setPhone(rs.getString(4));
				o.setEmail(rs.getString(5));
				o.setAdress(rs.getString(6));
				o.setProduct_name(rs.getString(7));
				o.setCategory(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				o.setCid(rs.getInt(11));
				o.setStastus(rs.getString(12));
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return o;
	}
	public boolean updateCommentStatus(int id,String comm) {
		boolean f = false;
		try {
			String sql = "UPDATE ORDER_DETAILS SET STASTUS=?  WHERE ID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
