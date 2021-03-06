package kr.or.ddit.schedule.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.schedule.model.ScheduleVo;

@Repository("scheduleDao")
public class ScheduleDao implements ScheduleDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	SqlSessionTemplate template;
	
	@Override
	public List<ScheduleVo> getSchedule(int id) {
		return template.selectList("schedule.getSchedule", id);
	}

	@Override
	public int insertSchedule(ScheduleVo scheduleVo) {
		return template.insert("schedule.insertSchedule", scheduleVo);
	}

	@Override
	public int deleteSchedule(int scheduleID) {
		return template.delete("schedule.deleteSchedule",scheduleID);
	}

	@Override
	public List<ScheduleVo> proNumSchedule(int pro_num) {
		return template.selectList("schedule.proNumSchedule",pro_num);
	}

}
