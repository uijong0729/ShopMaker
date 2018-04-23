package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Atemplate;

public interface AtemplateMapper {
	
	public ArrayList<Atemplate> selectatemplate(int templatecode);

	public void savepage(Atemplate at);

	public Atemplate loadpage(String string);

	public void deleteShop(String membercode);
	
	
}
