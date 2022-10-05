package com.spirita.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.spirita.dto.CartVO;

import util.DBManager;

public class CartDAO {
	private CartDAO() {
		
	}
	
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
		return instance;
	}
	
	public void insertCart(CartVO cVo) {
		String sql = "insert into cart (cseq, id, pseq, quantity) "
				+ " values (cart_seq.nextval, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cVo.getId());
			pstmt.setInt(2, cVo.getPseq());
			pstmt.setInt(3, cVo.getQuantity());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public ArrayList<CartVO> listCart(String id) {
		String sql = "select * from cart_view where id=? order by cseq desc";
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CartVO cVo = new CartVO();
				cVo.setCseq(rs.getInt(1));
				cVo.setId(rs.getString(2));
				cVo.setPseq(rs.getInt(3));
				cVo.setMname(rs.getString(4));
				cVo.setPname(rs.getString(5));
				cVo.setQuantity(rs.getInt(6));
				cVo.setIndate(rs.getTimestamp(7));
				cVo.setPrice(rs.getInt(8));
				cartList.add(cVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return cartList;
	}

	public void deleteCart(int cseq) {
		String sql = "delete cart where cseq=?";
	    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	    	conn = DBManager.getConnection();
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setInt(1, cseq);
	    	pstmt.executeUpdate();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt);
	    }
	}
}