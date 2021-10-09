package space.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import reviewBoard.model.ReviewBoardBean;
import utility.Paging;

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
	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCount",map);
		return cnt;
	}
	public List<SpaceBean> getSpaceList(Paging pageInfo, Map<String, String> map) {

		List<SpaceBean> spaceLists = new ArrayList<SpaceBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		spaceLists = sqlSessionTemplate.selectList(namespace+".getSpaceList", map,rowBounds);

		return spaceLists;
	}
	public List<SpaceImageBean> getImage(int num) {
		List<SpaceImageBean> SpaceImage = sqlSessionTemplate.selectList(namespace+".getImage", num);
		return SpaceImage;
	}
	public List<SpaceFacilityBean> getFacility(int num){
		List<SpaceFacilityBean> spaceFacility = sqlSessionTemplate.selectList(namespace+".getFacility", num);
		return spaceFacility;
	}


	public List<SpaceImageBean> getSpaceImageListBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectList(namespace+".getSpaceImageListBySpaceNum", spaceNum);
	}
	public List<SpaceBean> getPowerSpaceList(Map<String, String> map) {
		List<SpaceBean> spacePowertLists = new ArrayList<SpaceBean>();
		spacePowertLists = sqlSessionTemplate.selectList(namespace+".getPowerSpaceList", map);
		return spacePowertLists;
		
	}
}

