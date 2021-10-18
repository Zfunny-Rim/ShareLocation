package helpBoard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import noticeBoard.model.NoticeBoardBean;
import utility.Paging;

@Component
public class HelpBoardDao {

	private String namespace = "helpBoard.model.HelpBoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<HelpBoardBean> getHelpBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		 return  sqlSessionTemplate.selectList(namespace+".getHelpBoardList",map,rowBounds);
	}

	public HelpBoardBean getHelpBoardListbyNum(int num) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(namespace+".getHelpBoardListbyNum", num);
	}

	public int insertData(HelpBoardBean bean) {
		
		return sqlSessionTemplate.insert(namespace+".insertData", bean);
	}

	public int deleteBoardData(int num) {
		
		return sqlSessionTemplate.delete(namespace+".deleteBoardData", num);
	}

	public int getTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getTotalCount", map);
	}

	public int updateHelpBoard(HelpBoardBean bean) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update(namespace+".updateHelpBoard",bean);
	}

	
}
