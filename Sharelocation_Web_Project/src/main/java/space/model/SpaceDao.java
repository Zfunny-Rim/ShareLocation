package space.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("mySpaceDao")
public class SpaceDao {

	private String namespace = "space.model.SpaceBean";

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<SpaceBean> getSpaceList(String keyword) {

		List<SpaceBean> spaceLists = new ArrayList<SpaceBean>();
		spaceLists = sqlSessionTemplate.selectList(namespace+".getSpaceList", keyword);
			
		return spaceLists;
	}
	public int insertSpace(SpaceBean spaceBean) {
		System.out.println("into insertSpace");
		return sqlSessionTemplate.insert(namespace+".insertSpace", spaceBean);
	}
	public int getRecentSpaceNum() {
		return sqlSessionTemplate.selectOne(namespace+".getRecentSpaceNum");
	}
	
	public int insertSpaceTag(SpaceTagBean spaceTagBean) {
		return sqlSessionTemplate.insert(namespace+".insertSpaceTag", spaceTagBean);
	}
	public int insertSpaceFacility(SpaceFacilityBean spaceFacilityBean) {
		
		return sqlSessionTemplate.insert(namespace+".insertSpaceFacility", spaceFacilityBean);
	}
	public int insertSpaceImage(SpaceImageBean spaceImageBean) {
		return sqlSessionTemplate.insert(namespace+".insertSpaceImage", spaceImageBean);
	}

	public List<SpaceBean> getSpaceListByMemberNum(int memberNum) {
		return sqlSessionTemplate.selectList(namespace+".getSpaceListByMemberNum", memberNum);
	}
	
	public SpaceBean getSpace(int num) {
		SpaceBean space = sqlSessionTemplate.selectOne(namespace+".getSpace", num);
		return space;
	}
	
	public int delFavorite(FavoriteBean bean) {
		int cnt = sqlSessionTemplate.delete(namespace+".delFavorite",bean);
		return cnt;
	}
	
	public int addFavorite(FavoriteBean bean) {
		int cnt = sqlSessionTemplate.insert(namespace+".addFavorite",bean);
		return cnt;
	}
}
