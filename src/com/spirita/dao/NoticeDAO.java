package com.spirita.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.spirita.dto.NoticeVO;

import util.DBManager;

public class NoticeDAO {
	private NoticeDAO() {
	}
	
	private static NoticeDAO instance = new NoticeDAO();
	
	public static NoticeDAO getInstance() {
		return instance;
	}
	
	public ArrayList<NoticeVO> listNotice(String id) {
		ArrayList<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		String sql = "select * from notice where id=? order by nseq desc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNseq(rs.getInt("nseq"));
				noticeVO.setSubject(rs.getString("subject"));
				noticeVO.setContent(rs.getString("content"));
				noticeVO.setId(rs.getString("id"));
				noticeVO.setIndate(rs.getTimestamp("indate"));
				noticeList.add(noticeVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}
	
	public NoticeVO getNotice(int seq) {
		NoticeVO noticeVO = null;
		String sql = "select * from notice where nseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				noticeVO = new NoticeVO();
				noticeVO.setNseq(seq);
				noticeVO.setSubject(rs.getString("subject"));
				noticeVO.setContent(rs.getString("content"));
				noticeVO.setId(rs.getString("id"));
				noticeVO.setCount(rs.getInt("count"));
				noticeVO.setIndate(rs.getTimestamp("indate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return noticeVO;
	}
	
	public void insertnotice(NoticeVO noticeVO) {
		String sql = "insert into notice (nseq, subject, "
				+ "content, id) values(notice_seq.nextval, ?, ?, '관리자')";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVO.getSubject());
			pstmt.setString(2, noticeVO.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public ArrayList<NoticeVO> listAllNotice() {
		ArrayList<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		String sql = "select * from notice order by indate desc";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNseq(rs.getInt("nseq"));
				noticeVO.setSubject(rs.getString("subject"));
				noticeVO.setContent(rs.getString("content"));
				noticeVO.setId(rs.getString("id"));
				noticeVO.setCount(rs.getInt("count"));
				noticeVO.setIndate(rs.getTimestamp("indate"));
				noticeList.add(noticeVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noticeList;
	}
	
	public int updateNotice(NoticeVO noticeVO) {
		int result = -1;
		String sql = "update notice set subject=?, content=? where nseq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVO.getSubject());
			pstmt.setString(2, noticeVO.getContent());
			pstmt.setInt(3, noticeVO.getNseq());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	public int deleteNotice(int nseq) {
		int result = -1;
		String sql = "delete from notice where nseq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nseq);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}

	public void updateCount(int nseq) {
		String sql = "update notice set count=count+1 where nseq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nseq);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
}