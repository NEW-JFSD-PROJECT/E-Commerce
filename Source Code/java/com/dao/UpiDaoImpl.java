package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Upi;

public class UpiDaoImpl implements UpiDao {

	private Connection conn;
	
	public UpiDaoImpl(Connection conn) {
	
		this.conn = conn;
	}


	@Override
	public boolean addUpi(Upi u) {
		boolean f = false;

		try {
			String sql = "INSERT INTO UPI(UPI_NAME,NAME,UPI_ID,CID) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getUpi_name());
			ps.setString(2, u.getName());
			ps.setString(3, u.getUpi_id());
			ps.setInt(4, u.getCid());
		

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
