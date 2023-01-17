package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Card;

public class CardDaoImpl implements CardDao {

	private Connection conn;

	public CardDaoImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean addCart(Card c) {
		boolean f = false;

		try {
			String sql = "INSERT INTO CARD(NAME,CARD_NUMBER,MONTH,YEAR,CVV,CID) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getNumber());
			ps.setString(3, c.getMonth());
			ps.setString(4, c.getYear());
			ps.setString(5, c.getCvv());
			ps.setInt(6, c.getCid());

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
