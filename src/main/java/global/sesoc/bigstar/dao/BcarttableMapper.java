package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import global.sesoc.bigstar.vo.Bcarttable;
import global.sesoc.bigstar.vo.Bproducttable;

public interface BcarttableMapper {
	
	//멤버 코드로 카트에 있는 제품 코드 다 가져오기
	public ArrayList<Bcarttable> selectbcarttable(int customercode);

	//제품코드로 제품 조회하기
	public Bproducttable getBproduct(int productcode);
	
	public int insertBcart(Map<String, String> map);
	
}
