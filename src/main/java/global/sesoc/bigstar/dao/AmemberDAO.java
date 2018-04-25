package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Amember;
import global.sesoc.bigstar.vo.Avip;
@Repository
public class AmemberDAO implements AmemberMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Amember> selectamember(int templatecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AmemberMapper.class).selectamember(templatecode);

	}
	
	@Override
	public String AfindCustomer(String id) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AmemberMapper.class).AfindCustomer(id);

	}

	@Override
	public int AsignupCustomer(Amember member) {
		// TODO Auto-generated method stub
		return session.getMapper(AmemberMapper.class).AsignupCustomer(member);
	}

	@Override
	public Amember loginAcustomer(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return session.getMapper(AmemberMapper.class).loginAcustomer(map);
	}

	@Override
	public String selectAcustomerName(String membercode) {
		// TODO Auto-generated method stub
		return session.getMapper(AmemberMapper.class).selectAcustomerName(membercode);
	}

	public int updateAmemberpaymentexpirationdate(String paymentexpirationdate, String membercode) {
		// TODO Auto-generated method stub
		return session.getMapper(AmemberMapper.class).updateAmemberpaymentexpirationdate(paymentexpirationdate, membercode);
	}

	@Override
	public ArrayList<Avip> selectVip(String membercode) {
		// TODO Auto-generated method stub
		return session.getMapper(AmemberMapper.class).selectVip(membercode);
	}

}
