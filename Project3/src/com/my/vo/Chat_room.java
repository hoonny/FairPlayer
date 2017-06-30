package com.my.vo;

public class Chat_room {
	
	private int room_id;
	private String owner_id;
	private String user_id;
	private int count;
	
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "Chat_room [room_id=" + room_id + ", owner_id=" + owner_id + ", user_id=" + user_id + ", count=" + count
				+ "]";
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + count;
		result = prime * result + ((owner_id == null) ? 0 : owner_id.hashCode());
		result = prime * result + room_id;
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Chat_room other = (Chat_room) obj;
		if (count != other.count)
			return false;
		if (owner_id == null) {
			if (other.owner_id != null)
				return false;
		} else if (!owner_id.equals(other.owner_id))
			return false;
		if (room_id != other.room_id)
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		return true;
	}
	
	
	
	
	
}
