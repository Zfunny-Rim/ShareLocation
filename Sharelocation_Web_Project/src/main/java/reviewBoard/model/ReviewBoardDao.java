package reviewBoard.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myReviewDao")
public class ReviewBoardDao {

	private String namespace = "reviewBoard.model.reviewBoardBean";

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	public List<ReviewBoardBean> getReview(int num) {

		List<ReviewBoardBean> review = new ArrayList<ReviewBoardBean>();
		
		review = sqlSessionTemplate.selectList(namespace+".getReview", num);
		
		return review;
	}
	
	
}
