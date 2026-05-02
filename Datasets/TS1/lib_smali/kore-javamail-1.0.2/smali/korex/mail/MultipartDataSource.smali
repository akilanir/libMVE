.class public interface abstract Lkorex/mail/MultipartDataSource;
.super Ljava/lang/Object;
.source "MultipartDataSource.java"

# interfaces
.implements Lkorex/activation/DataSource;


# virtual methods
.method public abstract getBodyPart(I)Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getCount()I
.end method
