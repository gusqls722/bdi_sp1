package com.bdi.sp.vo;

import org.apache.ibatis.type.Alias;

@Alias("bi")
public class BoardInfo {
	private int binum;
	private String bititle;
	private String bitext;
	
	@Override
	public String toString() {
		return "BoardInfo [binum=" + binum + ", bititle=" + bititle + ", bitext=" + bitext + "]";
	}
	public int getBinum() {
		return binum;
	}
	public void setBinum(int binum) {
		this.binum = binum;
	}
	public String getBititle() {
		return bititle;
	}
	public void setBititle(String bititle) {
		this.bititle = bititle;
	}
	public String getBitext() {
		return bitext;
	}
	public void setBitext(String bitext) {
		this.bitext = bitext;
	}
	
}
