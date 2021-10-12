package reviewBoard.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReviewBoardDao {

private String namespace = "reviewBoard.model.ReviewBoardBean";


	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<ReviewBoardBean> getReview(int num) {
		return sqlSessionTemplate.selectList(namespace+".getReview", num);
	}

	
}
