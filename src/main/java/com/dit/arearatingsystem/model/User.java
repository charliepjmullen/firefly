package com.dit.arearatingsystem.model;

import javax.persistence.*; 

import com.dit.arearatingsystem.model.Area;
import com.dit.arearatingsystem.model.Commutes;

import java.util.List;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {
    private Long id;
    private String username;
    private String password;
    private String passwordConfirm;
    private Set<Role> roles;
    private List<Area> savedAreas;
    private List<Commutes> savedCommutes;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    @ManyToMany
    @JoinTable(name = "user_area", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "area_id"))
    public List<Area> getSavedAreas() {
		return savedAreas;
	}

	public void setSavedAreas(List<Area> savedAreas) {
		this.savedAreas = savedAreas;
	}

	@ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }
	
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
    
    @ManyToMany
	@JoinTable(name = "user_commutes", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "commutes_id"))
	public List<Commutes> getSavedCommutes(){
		return savedCommutes;
	}
	
	public void setSavedCommutes(List<Commutes> savedCommutes) {
		this.savedCommutes = savedCommutes;
	}
	
	public void addArea(Area area) {
		savedAreas.add(area);
	}
	
	public void addCommute(Commutes commute) {
		savedCommutes.add(commute);
	}
	
	public void deleteArea(Area area) {
		if (!savedAreas.isEmpty()){
			savedAreas.remove(area);
		}
	}
}
