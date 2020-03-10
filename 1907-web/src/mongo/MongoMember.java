package mongo;

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
	public void insert(String json) {
		
	}
	
	public void modify(String json) {
		
	}
	
	public void delete(String json) {
		
	}
	
	public String view(String json) {
		String rValue = "";
		
		return rValue;
	}
	public String select(String findStr) {
		String rValue="";
		DBCursor cursor = null;
		
		if(findStr == null) {
			cursor = dbc.find();
		}else {
			BasicDBObject filter = new BasicDBObject();		
			filter.put("mId", findStr);
			cursor = dbc.find(filter);			
		}
		
		
		while(cursor.hasNext()) {
			DBObject obj = cursor.next();
			System.out.println(obj);
		}		
		return rValue;
	}
	public static void main(String[] args) {
		MongoMember mm = new MongoMember();
		
		// member collection의 모든 데이터를 조회
		String json = mm.select(null);
		
		// mId='hong' 인 데이터를 조회
		json = mm.select("a002");
	}

}
