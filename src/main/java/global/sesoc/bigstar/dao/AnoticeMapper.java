package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.bigstar.vo.Anotice;

public interface AnoticeMapper {
	
	public ArrayList<Anotice> selectanotice(int noticecode);

	public ArrayList<Anotice> selectAllanotice();

	public int writeAnotice(Anotice anotice);

	public Anotice readAnotice(String noticecode);

	public ArrayList<Anotice> getNoticeCount();

	public ArrayList<Anotice> selectAllNotice(RowBounds rb);
	
	
}
