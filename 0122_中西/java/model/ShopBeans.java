
package model;

import jakarta.servlet.http.HttpServletRequest;

public class ShopBeans {

		
		private String id;
		private String name;
		private String address;
		private String tags;
		private String image;
		private String iframe;
		
		public ShopBeans(HttpServletRequest request) {
			setId(request.getParameter("id"));
			setName(request.getParameter("name"));
			setAddress(request.getParameter("address"));
			setTags(request.getParameter("tags"));
			setImage(request.getParameter("image"));
			setIframe(request.getParameter("iframe"));
		}
		

		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getTags() {
			return tags;
		}
		public void setTags(String tags) {
			this.tags = tags;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public String getIframe() {
			return iframe;
		}
		public void setIframe(String iframe) {
			this.iframe = iframe;
		}
		
		@Override
		public String toString() {
			return id+name+address+tags+image+iframe;
		}
	}
		
