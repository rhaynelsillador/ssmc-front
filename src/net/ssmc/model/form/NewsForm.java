package net.ssmc.model.form;

import net.ssmc.enums.Button;

public class NewsForm {

	private long id;
	private Button button;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Button getButton() {
		return button;
	}
	public void setButton(Button button) {
		this.button = button;
	}
}
