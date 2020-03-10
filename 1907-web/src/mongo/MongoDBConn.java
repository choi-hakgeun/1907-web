package mongo;

import java.util.List;
import java.util.Set;

import com.mongodb.DB;
import com.mongodb.MongoClient;

public class MongoDBConn { //오라클의 DBConn 과 똑같음
	MongoClient client;
	String ip="localhost";
	int port = 27017;
	String dbName = "m1907";	

	public MongoDBConn() {
		client = new MongoClient(ip, port);
	}
	
	public String dbList() {
		StringBuilder sd = new StringBuilder();
		List<String> list = client.getDatabaseNames();
		for(String s : list) {
			sd.append(s + " ");
		}
		return sd.toString();
	}
	public String collection() {
		StringBuilder sd = new StringBuilder();
		DB db = client.getDB("m1907");
		Set<String> set= db.getCollectionNames();
		for(String s : set) {
			sd.append(s +" ");
		}
		return sd.toString();
	}

	public MongoClient getClient() {
		return client;
	}

	public static void main(String[] args) {
		MongoDBConn m = new MongoDBConn();
		System.out.println("database list");
		System.out.println(m.dbList());
		
		System.out.println("collection list");
		System.out.println(m.collection());

	}

}
