package global.sesoc.bigstar.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.bigstar.vo.Anotice;
import global.sesoc.bigstar.vo.Aquestion;
@Repository
public class AnoticeDAO implements AnoticeMapper {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	AnoticeMapper mapper;
	
	@Override
	public ArrayList<Anotice> selectanotice(int noticecode) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AnoticeMapper.class).selectanotice(noticecode);
	}

	public ArrayList<Anotice> selectAllanotice() {
		// TODO Auto-generated method stub
		
		return session.getMapper(AnoticeMapper.class).selectAllanotice();
	}

	public int writeAnotice(Anotice anotice) {
		// TODO Auto-generated method stub
		
		return session.getMapper(AnoticeMapper.class).writeAnotice(anotice);
	}

	public Anotice readAnotice(String noticecode) {
		// TODO Auto-generated method stub
		return session.getMapper(AnoticeMapper.class).readAnotice(noticecode);
	}

	public ArrayList<Anotice> getNoticeCount() {
		ArrayList<Anotice> list = new ArrayList<Anotice>();
		try {
			mapper = session.getMapper(AnoticeMapper.class);
			list = mapper.getNoticeCount();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Anotice> selectAllNotice(RowBounds rb) {
		ArrayList<Anotice> list = new ArrayList<Anotice>();
		try {
			mapper = session.getMapper(AnoticeMapper.class);
			list = mapper.selectAllNotice(rb);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
