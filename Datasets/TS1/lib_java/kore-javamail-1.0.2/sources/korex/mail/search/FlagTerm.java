package korex.mail.search;

import korex.mail.Flags;
import korex.mail.Message;
import korex.mail.MessagingException;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/search/FlagTerm.class */
public final class FlagTerm extends SearchTerm {
    private boolean set;
    private Flags flags;
    private static final long serialVersionUID = -142991500302030647L;

    public FlagTerm(Flags flags, boolean set) {
        this.flags = flags;
        this.set = set;
    }

    public Flags getFlags() {
        return (Flags) this.flags.clone();
    }

    public boolean getTestSet() {
        return this.set;
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            Flags f = msg.getFlags();
            if (this.set) {
                if (f.contains(this.flags)) {
                    return true;
                }
                return false;
            }
            Flags.Flag[] sf = this.flags.getSystemFlags();
            for (Flags.Flag flag : sf) {
                if (f.contains(flag)) {
                    return false;
                }
            }
            String[] s = this.flags.getUserFlags();
            for (String str : s) {
                if (f.contains(str)) {
                    return false;
                }
            }
            return true;
        } catch (RuntimeException e) {
            return false;
        } catch (MessagingException e2) {
            return false;
        }
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FlagTerm)) {
            return false;
        }
        FlagTerm ft = (FlagTerm) obj;
        return ft.set == this.set && ft.flags.equals(this.flags);
    }

    public int hashCode() {
        return this.set ? this.flags.hashCode() : this.flags.hashCode() ^ (-1);
    }
}
