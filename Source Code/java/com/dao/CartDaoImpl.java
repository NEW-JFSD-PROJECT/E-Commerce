package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.product;

public class CartDaoImpl implements CartDao {

	private Connection conn;

	public CartDaoImpl(Connection conn) {
		this.conn = conn;
	}


	public boolean addCart(Cart c) {
		boolean f=false;
		
		try {
			String sql="INSERT INTO CART(PID,CID,PRODUCT_NAME,PRODUCT_CATEGORY,PRICE,TOTAL_PRICE) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getCustomerId());
			ps.setString(3, c.getpName());
			ps.setString(4, c.getpCategory());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
		

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) { 
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<Cart> getProductByCustomer(int customerid) {
		List<Cart> list=new ArrayList<Cart>();
		Cart c=null;
		double totalPrice = 0;
		try {
			
			String sql="SELECT * FROM CART WHERE CID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, customerid);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setId(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setCustomerId(rs.getInt(3));
				c.setpName(rs.getString(4));
				c.setpCategory(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice=totalPrice+rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public boolean removeProduct(int pid,int cid) {
		boolean f=false;
		try {
			String sql="DELETE FROM CART WHERE PID=? and CID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, cid);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
