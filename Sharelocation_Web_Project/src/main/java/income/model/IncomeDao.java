package income.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myIncomeDao")
public class IncomeDao {
	private String namespace = "income.model.IncomeBean";
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public int insertIncome(IncomeBean incomeBean) {
		return sqlSessionTemplate.insert(namespace+".insertIncome", incomeBean);
	}
	
}
