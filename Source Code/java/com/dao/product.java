package com.dao;

import java.util.List;

public interface product {

	public boolean addProduct(com.entity.product p);

	public List<com.entity.product> getAllProduct();

	public com.entity.product getProductById(int id);

	public boolean updateProduct(com.entity.product p);

	public boolean deleteProduct(int id);

	public List<com.entity.product> getAllFashion();

	public List<com.entity.product> getAllMobile();

	public List<com.entity.product> getAllElectronics();

	public List<com.entity.product> getAllElectric();

	public List<com.entity.product> getAllHome();

	public List<com.entity.product> getAllAppliance();

	public List<com.entity.product> getAllBaby_Kids();

	public List<com.entity.product> getBeauty_More();

	public List<com.entity.product> getTwo_Wheelers();

	// ......Fashion Section Start.......
	public List<com.entity.product> getAllShirt();

	public List<com.entity.product> getAllPant();

	public List<com.entity.product> getAllTshirts();

	public List<com.entity.product> getAllKrutas_Kurties();

	public List<com.entity.product> getAllMen_Dresss();

	public List<com.entity.product> getAllWomen_Dresses();
	// ......Fashion Section End.......

	// ......Electronics Section Start.......
	public List<com.entity.product> getAllCamera();

	public List<com.entity.product> getAllGaming();

	public List<com.entity.product> getAllHealth_Care();

	public List<com.entity.product> getAllLactop_Desktop();

	public List<com.entity.product> getAllPowerBank();

	public List<com.entity.product> getAllStorage();
	// ......Electronics Section End.......

	// ......Home Section Start.......
	public List<com.entity.product> getAllFurniture();

	public List<com.entity.product> getAllKitchen_Dining();
	// ......Home Section End.......

	// ......Beauty_More Section Start.......
	public List<com.entity.product> getAllBeauty_PersonalCare();

	public List<com.entity.product> getAllFoods_Drinks();

	public List<com.entity.product> getAllToy();

	public List<com.entity.product> getAllMusical_Instruments();
	// ......Beauty_More Section End.......

	// ......Two Wheelers Section Start.......

	public List<com.entity.product> getAllPetrolBike();

	public List<com.entity.product> getAllElectricBike();

	// ......Two Wheelers Section End.......
	public List<com.entity.product> getAllMobiles();
	public List<com.entity.product> getAllElectricItems();
	public List<com.entity.product> getAllApplianceItems();
	public List<com.entity.product> getAllBaby_KidsItems();
	
	public List<com.entity.product> getProductBySearch(String search);
	
}
