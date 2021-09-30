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
	
	public List<SpaceBean> getSpaceList() {

		List<SpaceBean> spaceLists = new ArrayList<SpaceBean>();
		spaceLists = sqlSessionTemplate.selectList(namespace+".getSpaceList");
			
		return spaceLists;
	}

	public SpaceBean getSpace(int num) {
		
		SpaceBean space = sqlSessionTemplate.selectOne(namespace+".getSpace", num);
		System.out.println("SpaceDao »Æ¿Œ"+space);
		
		return space;
	}

}
