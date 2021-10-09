package reservation.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myReservationDao")
public class ReservationDao {
	
	private String namespace = "reservation.model.ReservationBean";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ReservationBean getReserv(int spaceNum) {
		ReservationBean bean = sqlSessionTemplate.selectOne(namespace+".getReserv",spaceNum);
		return bean;
	}

	public int reservInsert(ReservationBean reservationBean) {
		int cnt = sqlSessionTemplate.insert(namespace+".reservInsert",reservationBean);
		return cnt;
	}

	public List<ReservationBean> getReservList(int membernum,Paging pageInfo) {
		
		List<ReservationBean> reservationLists = new ArrayList<ReservationBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		reservationLists = sqlSessionTemplate.selectList(namespace+".getReservList",membernum,rowBounds);
		return reservationLists;
	}

	public int deleteReserv(int num) {
		int cnt= sqlSessionTemplate.delete(namespace+".deleteReserv",num);
		return cnt;
	}
}
