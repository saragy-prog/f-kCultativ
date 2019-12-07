package study.spring.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "curses")
public class Curse implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "curse_id")
    private Integer curseId;
    @Column(name = "curseName")
    private String curseName;
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private User userId;

    public Curse() {
    }

    public Curse(Integer curseId) {
        this.curseId = curseId;
    }

    public Curse(Integer curseId, String curseName) {
        this.curseId = curseId;
        this.curseName = curseName;
    }

    public Integer getCurseId() {
        return curseId;
    }

    public void setCurseId(Integer curseId) {
        this.curseId = curseId;
    }

    public String getCurseName() {
        return curseName;
    }

    public void setCurseName(String curseName) {
        this.curseName = curseName;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (curseId != null ? curseId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Curse)) {
            return false;
        }
        Curse other = (Curse) object;
        if ((this.curseId == null && other.curseId != null) || (this.curseId != null &&
                !this.curseId.equals(other.curseId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "study.spring.entity.Curse[ curseId=" + curseId + " ]";
    }
}