package detailspace.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myDetailSpaceDao")
public class DetailSpaceDao {
	private String namespace = "detailspace.model.DetailSpaceBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<DetailSpaceBean> getDetailSpaceListBySpaceNum(int spacenum){
		return sqlSessionTemplate.selectList(namespace+".getDetailSpaceListBySpaceNum", spacenum);
	}
}
