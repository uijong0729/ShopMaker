package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Bquestiontable;
@Repository
public class BquestiontableDAO implements BquestiontableMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public ArrayList<Bquestiontable> selectbquestiontable(int qtablecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(BquestiontableMapper.class).selectbquestiontable(qtablecode);
	

	}

}
