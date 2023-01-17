package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Bank;

public class BankDaoImpl implements BankDao {

	private Connection conn;
	
	
	public BankDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBank(Bank b) {
		boolean f = false;
		try {
			String sql = "INSERT INTO BANK(BANKNAME,USERID,PASSWORD,CID) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBankname());
			ps.setString(2, b.getUserid());
			ps.setString(3, b.getPassword());
			ps.setInt(4, b.getCid());
			

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
