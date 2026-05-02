.class public interface abstract Lkorex/mail/QuotaAwareStore;
.super Ljava/lang/Object;
.source "QuotaAwareStore.java"


# virtual methods
.method public abstract getQuota(Ljava/lang/String;)[Lkorex/mail/Quota;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract setQuota(Lkorex/mail/Quota;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method
