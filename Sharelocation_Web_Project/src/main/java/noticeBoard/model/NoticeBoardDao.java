package noticeBoard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class NoticeBoardDao {

	private String namespace = "noticeBoard.model.NoticeBoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<NoticeBoardBean> getNoticeBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		 return  sqlSessionTemplate.selectList(namespace+".getNoticeBoardList",map,rowBounds);
	}

	public NoticeBoardBean getNoticeBoardListbyNum(int num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(namespace+".getNoticeBoardListbyNum", num);
	}

	public int insertData(NoticeBoardBean bean) {
		
		return sqlSessionTemplate.insert(namespace+".insertData", bean);
	}

	public int deleteBoardData(int num) {
		
		return sqlSessionTemplate.delete(namespace+".deleteBoardData", num);
	}

	public int getTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getTotalCount", map);
	}

	public int updateNoticeBoard(NoticeBoardBean bean) {
		
		return sqlSessionTemplate.update(namespace+".updateNoticeBoard",bean);
	}

	
}
