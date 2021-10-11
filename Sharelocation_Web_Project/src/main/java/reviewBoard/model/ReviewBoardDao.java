package reviewBoard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class ReviewBoardDao {

private String namespace = "reviewBoard.model.ReviewBoardBean";


	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<ReviewBoardBean> getReview(int num) {
		return sqlSessionTemplate.selectList(namespace+".getReview", num);
	}

	
	
	
	public List<ReviewBoardBean> getReviewListBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectList(namespace+".getReviewListBySpaceNum", spaceNum);
	}

	public List<ReviewBoardBean> getOriginReviewListBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectList(namespace+".getOriginReviewListBySpaceNum", spaceNum);
	}

	public ReviewBoardBean getReviewReplyByNum(int num) {
		return sqlSessionTemplate.selectOne(namespace+".getReviewReplyByNum", num);
	}




	public int insertReply(ReviewBoardBean reviewBoardBean) {
		return sqlSessionTemplate.insert(namespace+".insertReply", reviewBoardBean);
	}

	public int deleteReviewByNum(int num) {
		return sqlSessionTemplate.delete(namespace+".deleteReviewByNum", num);
	}

	public int getOriginReviewAllCountBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectOne(namespace+".getOriginReviewAllCountBySpaceNum", spaceNum);
	}

	public int getOriginReviewTotalCountBySpaceNum(Map<String, String> map) {
		return sqlSessionTemplate.selectOne(namespace+".getOriginReviewTotalCountBySpaceNum", map);
	}

	public List<ReviewBoardBean> getOriginReviewListByMap(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getOriginReviewListByMap",map,rowBounds);
	}
}
