package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mdao")
public class MemberDao {
	
	private String namespace = "member.model.Member.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public Member getData(String id) {
		Member member = sqlSessionTemplate.selectOne(namespace+"getData",id);
		return member;
	}

	public void insertMember(Member member) {
		sqlSessionTemplate.insert(namespace+"insertMember");
	}
}
