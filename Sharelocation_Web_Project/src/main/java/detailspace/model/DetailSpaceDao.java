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
	
	public int getDetailSpaceCountBySpaceNum(int spacenum) {
		return sqlSessionTemplate.selectOne(namespace+".getDetailSpaceCountBySpaceNum", spacenum);
	}

	public int insertDSpace(DetailSpaceBean detailSpaceBean) {
		return sqlSessionTemplate.insert(namespace+".insertDSpace", detailSpaceBean);
	}

	public List<DetailSpaceBean> getDetailSpace(int spacenum) {
		return sqlSessionTemplate.selectOne(namespace+".getDetailSpace", spacenum);
	}

	public DetailSpaceBean getdetailspace(int detailspacenum) {
		DetailSpaceBean detailSpaceBean = sqlSessionTemplate.selectOne(namespace+".getdetailspace",detailspacenum);
		return detailSpaceBean;
	}

	public List<DetailSpaceBean> getListDetailSpace(int spacenum) {
		return sqlSessionTemplate.selectList(namespace+".getDetailSpace", spacenum);
	}


}
