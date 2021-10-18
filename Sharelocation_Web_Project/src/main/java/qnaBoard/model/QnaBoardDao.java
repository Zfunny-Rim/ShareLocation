package qnaBoard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;
import utility.Paging;

@Component("qnaDao")
public class QnaBoardDao {
	private String namespace = "qnaBoard.model.QnaBoardBean.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+"getTotalCount", map);
	}
	
	public List<QnaBoardBean> getList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+"getList", map, rowBounds);
	}

	public void insert(QnaBoardBean list) {
		    sqlSessionTemplate.insert(namespace+"insert",list);
	}

	public void addReadCount(int num) {
			sqlSessionTemplate.update(namespace+"addReadCount", num);
	}

	public QnaBoardBean getOne(int num) {
		QnaBoardBean qna = sqlSessionTemplate.selectOne(namespace+"getOne",num);
		return qna;
	}

	public void delete(int num) {
		sqlSessionTemplate.delete(namespace+"delete",num);
	}

	public void update(QnaBoardBean list) {
		sqlSessionTemplate.update(namespace+"update",list);
	}

	public void updateRestep(QnaBoardBean list) {
		sqlSessionTemplate.update(namespace+"updateRestep",list);
	}

	public void insertReply(QnaBoardBean list) {
		sqlSessionTemplate.insert(namespace+"insertReply",list);
	}
	
}
