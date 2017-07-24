package com.bitschool.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bitschool.dto.BScheduleDTO;

@Repository
public class BScheduleDAO {
	private static final String namespace = "com.bitschool.basic.ScheduleMapper";
	@Inject
	private SqlSession session;
	
	public boolean insertSchedule(BScheduleDTO schedule) {
		boolean flag = false;
		int aCnt = session.insert(namespace+".insertSchedule", schedule);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}
	
	public boolean updateSchedule(BScheduleDTO schedule) {
		boolean flag = false;
		int aCnt = session.update(namespace+".updateSchedule", schedule);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}

	public List<BScheduleDTO> selectScheduleAll() {
		List<BScheduleDTO> list = null;
		list = session.selectList(namespace+".selectScheduleAll");
		return list;
	}

	public BScheduleDTO selectScheduleOne(int sid) {
		BScheduleDTO schedule = session.selectOne(namespace+".selectScheduleOne", sid);
		return schedule;
	}

	public boolean deleteSchedule(int sid) {
		boolean flag = false;
		int aCnt = session.delete(namespace+".deleteSchedule", sid);
		if(aCnt > 0) {
			flag = true;
		}
		return flag;
	}

}
