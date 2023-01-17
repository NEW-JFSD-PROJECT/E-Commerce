package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Card;
import com.entity.Cod;

public class CodDao {
	
	private Connection conn;

	public CodDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addCod(Cod c) {
		boolean f = false;

		try {
			String sql = "INSERT INTO COD(COD,CID) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getCod());
			ps.setInt(2, c.getCid());
		
		
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
