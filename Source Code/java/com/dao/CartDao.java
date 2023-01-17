package com.dao;

import java.util.List;

import com.entity.Cart;
import com.entity.product;

public interface CartDao {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getProductByCustomer(int customerid);
	
	public boolean removeProduct(int pid,int cid);

}
