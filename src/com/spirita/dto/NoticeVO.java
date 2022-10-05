package com.spirita.dto;

import java.sql.Timestamp;

public class NoticeVO {
	private int nseq;
	private String subject;
	private String content;
	private String id;
	private Timestamp indate;
	private int count;
	
	public NoticeVO() {

	}

	public NoticeVO(int nseq, String subject, String content, String id, Timestamp indate) {
		super();
		this.nseq = nseq;
		this.subject = subject;
		this.content = content;
		this.id = id;
		this.indate = indate;
	}

	public int getNseq() {
		return nseq;
	}

	public void setNseq(int nseq) {
		this.nseq = nseq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getIndate() {
		return indate;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "NoticeVO [nseq=" + nseq + ", subject=" + subject + ", content=" + content + ", id=" + id + ", indate="
				+ indate + "]";
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
