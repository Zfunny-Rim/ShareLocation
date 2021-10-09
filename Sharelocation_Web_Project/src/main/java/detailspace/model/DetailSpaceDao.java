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
	
	public int getDetailSpaceCountBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectOne(namespace+".getDetailSpaceCountBySpaceNum", spaceNum);
	}

	public int insertDSpace(DetailSpaceBean detailSpaceBean) {
		return sqlSessionTemplate.insert(namespace+".insertDSpace", detailSpaceBean);
	}

	public List<DetailSpaceBean> getDetailSpaceBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectList(namespace+".getDetailSpaceBySpaceNum", spaceNum);
	}

	public DetailSpaceBean getdetailspace(int detailspacenum) {
		DetailSpaceBean detailSpaceBean = sqlSessionTemplate.selectOne(namespace+".getdetailspace",detailspacenum);
		return detailSpaceBean;
	}

	public int updateDSpace(DetailSpaceBean detailSpaceBean) {
		return sqlSessionTemplate.update(namespace+".updateDSpace", detailSpaceBean);
	}

	public int deleteDSpace(int detailSpaceNum) {
		return sqlSessionTemplate.delete(namespace+".deleteDSpace", detailSpaceNum);
	}

	public String getDetailSpaceImage(int detailSpaceNum) {
		return sqlSessionTemplate.selectOne(namespace+".getDetailSpaceImage", detailSpaceNum);
	}

	public List<String> getSpaceImageBySpaceNum(int spaceNum) {
		return sqlSessionTemplate.selectList(namespace+".getSpaceImageBySpaceNum", spaceNum);
	}

	public List<PackagePriceBean> getPackageListByDetailSpaceNum(int detailSpaceNum) {
		return sqlSessionTemplate.selectList(namespace+".getPackageListByDetailSpaceNum", detailSpaceNum);
	}

	public int insertDPackage(PackagePriceBean packagePriceBean) {
		return sqlSessionTemplate.insert(namespace+".insertDPackage", packagePriceBean);
	}
}
