package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.contact;

public class contactDao {
	private Connection conn;

	public contactDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean register(contact c) {
		boolean f = false;
		try {
			String sql = "insert into CONTACT(NAME,EMAIL,NUM,MSG) values(?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getNumber());
			ps.setString(4, c.getMsg());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<contact> getAllContact() {
		List<contact> list = new ArrayList<>();
		contact c = null;
		try {

			String sql = "select * from CONTACT order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setNumber(rs.getString(4));
				c.setMsg(rs.getString(5));

				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteContact(int id) {
		boolean f = false;
		try {
			String sql = "delete from CONTACT where id=?";
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

	public contact getContactEmail(int  id) {
		
		contact c = null;
		try {

			String sql = "select * from CONTACT WHERE EMAIL=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new contact();

				c.setEmail(rs.getString(3));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}
}
