package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.bigstar.vo.Aquestion;

public interface AquestionMapper {
	
	public Aquestion selectaquestion(int qtablecode);
	public int insertAQuestion(Aquestion qna);
	public ArrayList<Aquestion> selectAllQuestion(RowBounds rb);
	public int getQnaCount();
	public int insertAreply(HashMap<String, String> map);
	public ArrayList<Aquestion> searchQuestion(HashMap<String, String> map);
}
