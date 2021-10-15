package scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import reservation.model.ReservationBean;
import reservation.model.ReservationDao;

@Component("myQueryScheduler")
public class QueryScheduler {
	@Autowired
	ReservationDao reservationDao;
	
	//0 0 0/1 * * ? : �ѽð��� �ѹ��� ���� üũ
	@Scheduled(cron = "0 0 0/1 * * ?")
	public void expireSchduler() {
		System.out.println("�����췯 �׽�Ʈ!");
		List<ReservationBean> exResList = reservationDao.getExpiredReservationList();
		if(exResList.size() != 0) {
			for(ReservationBean resBean:exResList) {
				resBean.setStatus("�������");
				reservationDao.updateStatus(resBean);
			}
		}
		List<ReservationBean> comResList = reservationDao.getCompleteReservationList();
		if(comResList.size() != 0) {
			for(ReservationBean resBean:comResList) {
				resBean.setStatus("�̿�Ϸ�");
				reservationDao.updateStatus(resBean);
			}
		}
		
	}
}
