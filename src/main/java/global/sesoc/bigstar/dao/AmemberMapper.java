package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Amember;

public interface AmemberMapper {
	public ArrayList<Amember> selectamember(int templatecode);
}
