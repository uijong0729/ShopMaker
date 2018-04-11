package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.bigstar.vo.Amember;

public interface AmemberMapper {
	public ArrayList<Amember> selectamember(int templatecode);
	public String AfindCustomer(String getId);
	public int AsignupCustomer(Amember member);
	public Amember loginAcustomer(HashMap<String, String> map);
	public String selectAcustomerName(String membercode);
	public int updateAmemberpaymentexpirationdate(String paymentexpirationdate, String membercode);
}
