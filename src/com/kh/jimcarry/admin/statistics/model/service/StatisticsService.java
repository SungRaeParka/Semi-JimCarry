package com.kh.jimcarry.admin.statistics.model.service;

import static com.kh.jimcarry.common.JDBCTemplate.close;
import static com.kh.jimcarry.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

import com.kh.jimcarry.admin.statistics.model.dao.StatisticsDao;
import com.kh.jimcarry.admin.statistics.model.vo.StatisticsMember;
import com.kh.jimcarry.admin.statistics.model.vo.StatisticsSales;

public class StatisticsService {

	public ArrayList<StatisticsMember> member() {
		Connection con = getConnection();

		ArrayList<StatisticsMember> list = new StatisticsDao().member(con);
		ArrayList<StatisticsMember> list6 = new ArrayList<StatisticsMember>();
		//동하의 해쉬맵 작품을 보려면 https://www.notion.so/joshua8565/TIP-e882e471f61443e9ad6fcb13208ae448


		for(int i = 1; i < 7; i++) {

			StatisticsMember e = list.get(list.size() - i);
			System.out.println("e : " + e);

			list6.add(e);
		}
		Collections.reverse(list6);
		System.out.println("StatisticsService list6 : " + list6);


		close(con);
		return list6;
	}

	public ArrayList<StatisticsSales> sales() {
		Connection con = getConnection();

		ArrayList<StatisticsSales> list = new StatisticsDao().sales(con);
		ArrayList<StatisticsSales> list6 = new ArrayList<StatisticsSales>();

		for(int i = 1; i < 7; i++) {

			StatisticsSales e = list.get(list.size() - i);
			System.out.println("e : " + e);

			list6.add(e);
		}
		Collections.reverse(list6);
		System.out.println("StatisticsService list6 : " + list6);


		close(con);
		return list;
	}

}
