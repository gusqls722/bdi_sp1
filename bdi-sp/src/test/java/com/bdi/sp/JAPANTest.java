package com.bdi.sp;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Qualifier;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bdi.sp.vo.BoardInfo;
import com.bdi.sp.vo.Japan;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class JAPANTest {

	@Inject
	private SqlSession ss;
	
	@Test
	public void selectTest() {
		Japan j = new Japan();
		j.setJpnum(8);
		j.setJpname("테스트");
		j.setJpdesc("tttt");
		List<Japan> jList = ss.selectList("SQL.JAPAN.selectJapan",j);
		assertEquals(jList.size(), 0);
	}
	
/*	@Test 
	public void insertTest() {
		Japan j = new Japan();
		j.setJpname("테스트");
		j.setJpdesc("테스트 데이터");
		int rCnt = ss.insert("SQL.JAPAN.insertJapan",j);
		assertEquals(rCnt,1);
	}
	
	@Test
	public void deleteTest() {
		Japan j = new Japan();
		j.setJpnum(3);
		int rCnt = ss.delete("SQL.JAPAN.deleteJapan",j);
		assertEquals(rCnt,1);
	}
	
	@Test
	public void updateTest() {
		Japan j = new Japan();
		j.setJpnum(4);
		j.setJpname("ver0.1");
		j.setJpdesc("ver0.1 desc");
		int rCnt = ss.update("SQL.JAPAN.updateJapan",j);
		assertEquals(rCnt,1);
	}*/
}
