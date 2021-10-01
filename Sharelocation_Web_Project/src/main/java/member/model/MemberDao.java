package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mdao")
public class MemberDao {
	
	private String namespace = "member.model.Member.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public MemberBean getData(String id) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+"getData",id);
		return member;
	}

	public void insertMember(MemberBean member) {
		sqlSessionTemplate.insert(namespace+"insertMember");
	}
}
