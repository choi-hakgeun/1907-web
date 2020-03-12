package mongo;

import java.util.List;
import java.util.regex.Pattern;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

public class MongoMember {
	DB db;
	DBCollection dbc;
	
	public MongoMember() {
		MongoClient client = new MongoDBConn().getClient();
		DB db = client.getDB("m1907");
		  dbc = db.getCollection("member");
	}
	public String insert(DBObject obj) {
		String msg="";
		try {
			dbc.insert(obj);
			msg="회원정보가 정상적으로 등록되었습니다.";			
		}catch(Exception ex) {
			msg = "저장중 오류 발생. " + ex.toString();
		}finally {
			return msg;
		}
	}
	
	public String modify(BasicDBObject obj) {
		String msg ="";
		String mId = obj.getString("mId");
		BasicDBObject query = new BasicDBObject();		
		query.put("mId", mId);
		try {
			dbc.update(query, obj);
			msg = "회원 정보가 수정되었습니다.";
		}catch(Exception ex) {
			msg = "수정중 오류 발생. " +ex.toString();			
		}
		return msg;
	}
	
	public String delete(String mId) {
		String msg = "";
		BasicDBObject obj = new BasicDBObject();
		obj.put("mId", mId);
		try {
			dbc.remove(obj);
			msg="회원 정보가 정상적으로 삭제 되었습니다.";			
		}catch(Exception ex) {
			msg = "삭제중 오류발생" +ex.toString();
		}finally {
			return msg;
		}
	}
	
	public DBObject view(String mId) {
		DBObject o = null;
		BasicDBObject obj = new BasicDBObject();
		obj.put("mId", mId);
		DBCursor cursor = dbc.find(obj);
		if(cursor.hasNext()) {
			o = cursor.next();
		}		
		return o;
	}
	public List<DBObject> select(String findStr) {
		String rValue="";
		DBCursor cursor = null;
		
		if(findStr == null) {
			cursor = dbc.find();
		}else {
			BasicDBObject filter1 = new BasicDBObject();		
			BasicDBObject filter2 = new BasicDBObject();
			BasicDBList or = new BasicDBList();
			filter1.put("mName", Pattern.compile(findStr));
			filter2.put("mId",   Pattern.compile(findStr));
			
			or.add(filter1);
			or.add(filter2);
			
			BasicDBObject query = new BasicDBObject();
			query.put("$or", or);//{$or : [{filter}, {filter}]}
			cursor = dbc.find(query);			
		}		
				
		return cursor.toArray();
	}
	public static void main(String[] args) {
		MongoMember mm = new MongoMember();
		String json = null;
		System.out.println(mm.select(""));
		// member collection의 모든 데이터를 조회
		//String json = mm.select(null);
		
		// mId='hong' 인 데이터를 조회
		//json = mm.select("a002");
	}

}
