package global.sesoc.bigstar.dao;

import java.util.ArrayList;

import global.sesoc.bigstar.vo.Aquestion;

public interface AquestionMapper {
	
	public ArrayList<Aquestion> selectaquestion(int qtablecode);
	public int insertAQuestion(Aquestion qna);
	public ArrayList<Aquestion> selectAllQuestion();
}
