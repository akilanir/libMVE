package korex.mail.search;

import java.util.Date;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/DateTerm.class */
public abstract class DateTerm extends ComparisonTerm {
    protected Date date;
    private static final long serialVersionUID = 4818873430063720043L;

    protected DateTerm(int comparison, Date date) {
        this.comparison = comparison;
        this.date = date;
    }

    public Date getDate() {
        return new Date(this.date.getTime());
    }

    public int getComparison() {
        return this.comparison;
    }

    protected boolean match(Date d) {
        switch (this.comparison) {
            case 1:
                return d.before(this.date) || d.equals(this.date);
            case 2:
                return d.before(this.date);
            case 3:
                return d.equals(this.date);
            case 4:
                return !d.equals(this.date);
            case 5:
                return d.after(this.date);
            case ComparisonTerm.GE /* 6 */:
                return d.after(this.date) || d.equals(this.date);
            default:
                return false;
        }
    }

    @Override // korex.mail.search.ComparisonTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof DateTerm)) {
            return false;
        }
        DateTerm dt = (DateTerm) obj;
        return dt.date.equals(this.date) && super.equals(obj);
    }

    @Override // korex.mail.search.ComparisonTerm
    public int hashCode() {
        return this.date.hashCode() + super.hashCode();
    }
}
