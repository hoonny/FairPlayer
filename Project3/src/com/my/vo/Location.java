package com.my.vo;

public class Location {
	   private int location_id;
	   private String gu;
	   private String dong;
	   
	   
	   public Location() {
		super();
		
	}
	public Location(int location_id, String gu, String dong) {
	      
	      this.location_id = location_id;
	      this.gu = gu;
	      this.dong = dong;
	   }
	   public int getLocation_id() {
	      return location_id;
	   }
	   public void setLocation_id(int location_id) {
	      this.location_id = location_id;
	   }
	   public String getGu() {
	      return gu;
	   }
	   public void setGu(String gu) {
	      this.gu = gu;
	   }
	   public String getDong() {
	      return dong;
	   }
	   public void setDong(String dong) {
	      this.dong = dong;
	   }
	   @Override
	   public int hashCode() {
	      final int prime = 31;
	      int result = 1;
	      result = prime * result + ((dong == null) ? 0 : dong.hashCode());
	      result = prime * result + ((gu == null) ? 0 : gu.hashCode());
	      result = prime * result + location_id;
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
	      Location other = (Location) obj;
	      if (dong == null) {
	         if (other.dong != null)
	            return false;
	      } else if (!dong.equals(other.dong))
	         return false;
	      if (gu == null) {
	         if (other.gu != null)
	            return false;
	      } else if (!gu.equals(other.gu))
	         return false;
	      if (location_id != other.location_id)
	         return false;
	      return true;
	   }
	   @Override
	   public String toString() {
	      return "Location [location_id=" + location_id + ", gu=" + gu + ", dong=" + dong + "]";

}
}