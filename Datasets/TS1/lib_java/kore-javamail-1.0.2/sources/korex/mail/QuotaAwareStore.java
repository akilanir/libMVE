package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/QuotaAwareStore.class */
public interface QuotaAwareStore {
    Quota[] getQuota(String str) throws MessagingException;

    void setQuota(Quota quota) throws MessagingException;
}
