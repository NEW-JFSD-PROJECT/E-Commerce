package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.category;



public class CategoryDao {
	private Connection conn;

	public CategoryDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCategory(String spec) {
		boolean f = false;
		try {
			String sql = "insert into category(category_name) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, spec);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<category> getAllCategory() {
		List<category> list = new ArrayList<category>();
		category c = null;

		try {
			String sql = "select * from category";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new category();
				c.setId(rs.getInt(1));
				c. setCategoryname(rs.getString(2));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
