package korex.mail.search;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/IntegerComparisonTerm.class */
public abstract class IntegerComparisonTerm extends ComparisonTerm {
    protected int number;
    private static final long serialVersionUID = -6963571240154302484L;

    protected IntegerComparisonTerm(int comparison, int number) {
        this.comparison = comparison;
        this.number = number;
    }

    public int getNumber() {
        return this.number;
    }

    public int getComparison() {
        return this.comparison;
    }

    protected boolean match(int i) {
        switch (this.comparison) {
            case 1:
                if (i <= this.number) {
                }
                break;
            case 2:
                if (i < this.number) {
                }
                break;
            case 3:
                if (i == this.number) {
                }
                break;
            case 4:
                if (i != this.number) {
                }
                break;
            case 5:
                if (i > this.number) {
                }
                break;
            case ComparisonTerm.GE /* 6 */:
                if (i >= this.number) {
                }
                break;
        }
        return false;
    }

    @Override // korex.mail.search.ComparisonTerm
    public boolean equals(Object obj) {
        if (!(obj instanceof IntegerComparisonTerm)) {
            return false;
        }
        IntegerComparisonTerm ict = (IntegerComparisonTerm) obj;
        return ict.number == this.number && super.equals(obj);
    }

    @Override // korex.mail.search.ComparisonTerm
    public int hashCode() {
        return this.number + super.hashCode();
    }
}
