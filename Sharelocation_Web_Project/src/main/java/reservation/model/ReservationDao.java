package reservation.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import space.model.SpaceBean;

@Component("myReservationDao")
public class ReservationDao {
	
	private String namespace = "reservation.model.ReservationBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ReservationBean getReserv(int spaceNum) {
		ReservationBean bean = sqlSessionTemplate.selectOne(namespace+".getReserv",spaceNum);
		return bean;
	}

	public int reservInsert(ReservationBean bean) {
		int cnt = sqlSessionTemplate.insert(namespace+".reservInsert",bean);
		return cnt;
	}
}
