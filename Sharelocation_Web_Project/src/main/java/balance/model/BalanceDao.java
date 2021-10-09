package balance.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BalanceDao {
	
	private String namespace = "balance.model.BalanceBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public BalanceBean getBalance(int memberNum) {
		BalanceBean balance = sqlSessionTemplate.selectOne(namespace+".getBalance",memberNum);
		return balance;
	}
}
