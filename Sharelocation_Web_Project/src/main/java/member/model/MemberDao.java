package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mdao")
public class MemberDao {
	
	private String namespace = "member.model.MemberBean.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public MemberBean getData(String id) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+"getData",id);
		return member;
	}

	public void insertMember(MemberBean member) {
		sqlSessionTemplate.insert(namespace+"insertMember",member);
	}

	public MemberBean getIdPw(Map<String, String> map) {
		MemberBean idpw = sqlSessionTemplate.selectOne(namespace+"getIdPw",map);
		return idpw;
	}

	public void updateMember(MemberBean member) {
		sqlSessionTemplate.update(namespace+"updateMember",member);
	}

	public List<MemberBean> getId() {
		List<MemberBean> idLists = new ArrayList<MemberBean>();
		idLists = sqlSessionTemplate.selectList(namespace+"getId");
		return idLists;
	}

	public int idCheck(String id) {
		
		int cnt = sqlSessionTemplate.selectOne(namespace+"idCheck",id);
		
		return cnt;
	}
}