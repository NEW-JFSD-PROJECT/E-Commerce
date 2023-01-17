package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.product;

public class ProductDao implements com.dao.product {

	private Connection conn;

	public ProductDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addProduct(product p) {
		boolean f = false;

		try {

			String sql = "insert into product(pname,pcategory,psubcategory,pprice,pcolor,pimage,pdecs) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getPname());
			ps.setString(2, p.getPcategory());
			ps.setString(3, p.getPsubcategory());
			ps.setString(4, p.getPprice());
			ps.setString(5, p.getPcolor());
			ps.setString(6, p.getPimage());
			ps.setString(7, p.getPdecs());

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
	public List<product> getAllProduct() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product order by Pid ASC ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public product getProductById(int id) {
		product p = null;

		try {

			String sql = "select * from product where pid=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public boolean updateProduct(product p) {
		boolean f = false;

		try {

			String sql = "update product set pname=?,pcategory=?,psubcategory=?,pprice=?,pcolor=?,pimage=?,pdecs=? where Pid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getPname());
			ps.setString(2, p.getPcategory());
			ps.setString(3, p.getPsubcategory());
			ps.setString(4, p.getPprice());
			ps.setString(5, p.getPcolor());
			ps.setString(6, p.getPimage());
			ps.setString(7, p.getPdecs());

			ps.setInt(8, p.getPid());

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
	public boolean deleteProduct(int id) {
		boolean f = false;
		try {
			String sql = "delete from product where Pid=?";
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

	@Override
	public List<product> getAllFashion() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=?ORDER BY pcolor";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Fashion");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllMobile() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Mobile");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllElectronics() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=?ORDER BY pprice";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Electronics");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllElectric() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Electric");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllHome() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=?ORDER BY pprice";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Home");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllAppliance() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=?ORDER BY PNAME ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Appliance");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllBaby_Kids() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Baby_Kids");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getBeauty_More() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=?ORDER BY pprice ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Beauty_More");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getTwo_Wheelers() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=?ORDER BY pname";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Two_Wheelers");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// ......Fashion Section Start.......
	@Override
	public List<product> getAllShirt() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Shirt");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllPant() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Pant");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllTshirts() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "T-shirts");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllKrutas_Kurties() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Krutas_Kurties");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllMen_Dresss() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Men_Dresss");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllWomen_Dresses() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Women_Dresses");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// ......Fashion Section End.......

	// ......Electronics Section Start.......

	@Override
	public List<product> getAllCamera() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Camera");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllGaming() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Gaming");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllHealth_Care() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Health_Care");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllLactop_Desktop() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Lactop_Desktop");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllPowerBank() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Power Bank");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllStorage() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Storage");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// ......Electronics Section End.......

	// ......Home Section Start.......
	@Override
	public List<product> getAllFurniture() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Furniture");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllKitchen_Dining() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Kitchen_Dining");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// ......Home Section End.......

	// ......Beauty_More Section Start.......

	@Override
	public List<product> getAllBeauty_PersonalCare() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Beauty_Personal Care");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllFoods_Drinks() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Foods_Drinks");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllToy() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Toy");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllMusical_Instruments() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Musical Instruments");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// ......Beauty_More Section End.......

	@Override
	public List<product> getAllPetrolBike() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Petorl Bike");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllElectricBike() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where psubcategory=?ORDER BY Pid ASC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Electric Bike");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// ......Two Wheelers Section End.......

	@Override
	public List<product> getAllMobiles() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Mobile");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllElectricItems() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Electric");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllApplianceItems() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=?ORDER BY PNAME ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Appliance");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getAllBaby_KidsItems() {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where pcategory=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Baby_Kids");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<product> getProductBySearch(String search) {
		List<product> list = new ArrayList<product>();
		product p = null;

		try {

			String sql = "select * from product where PNAME LIKE ? OR PCATEGORY LIKE ? OR PSUBCATEGORY LIKE ? AND PCOLOR LIKE ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setString(2, "%" + search + "%");
			ps.setString(3, "%" + search + "%");
			ps.setString(4, "%" + search + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new product();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPcategory(rs.getString(3));
				p.setPsubcategory(rs.getString(4));
				p.setPprice(rs.getString(5));
				p.setPcolor(rs.getString(6));
				p.setPimage(rs.getString(7));
				p.setPdecs(rs.getString(8));

				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
