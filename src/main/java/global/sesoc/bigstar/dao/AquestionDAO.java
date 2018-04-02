package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Aquestion;
@Repository
public class AquestionDAO implements AquestionMapper {
	
	@Autowired
	SqlSession session;
	
	@Override
	public Aquestion selectaquestion(int qtablecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AquestionMapper.class).selectaquestion(qtablecode);
	

	}

	@Override
	public int insertAQuestion(Aquestion qna) {
		// TODO Auto-generated method stub
		return session.getMapper(AquestionMapper.class).insertAQuestion(qna);
	}

	/*@Override
	public ArrayList<Aquestion> selectAllQuestion() {
		// TODO Auto-generated method stub
		return session.getMapper(AquestionMapper.class).selectAllQuestion();
	}*/

	@Override
	public ArrayList<Aquestion> selectAllQuestion(RowBounds rb) {
		// TODO Auto-generated method stub
		return session.getMapper(AquestionMapper.class).selectAllQuestion(rb);
	}

	@Override
	public int getQnaCount() {
		// TODO Auto-generated method stub
		return session.getMapper(AquestionMapper.class).getQnaCount();
	}

	@Override
	public int insertAreply(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return session.getMapper(AquestionMapper.class).insertAreply(map);
	}

	@Override
	public ArrayList<Aquestion> searchQuestion(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return session.getMapper(AquestionMapper.class).searchQuestion(map);
	}

	

}
