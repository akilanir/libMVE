.class public interface abstract Lkorex/mail/UIDFolder;
.super Ljava/lang/Object;
.source "UIDFolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/UIDFolder$FetchProfileItem;
    }
.end annotation


# static fields
.field public static final LASTUID:J = -0x1L


# virtual methods
.method public abstract getMessageByUID(J)Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getMessagesByUID(JJ)[Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getMessagesByUID([J)[Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getUID(Lkorex/mail/Message;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method

.method public abstract getUIDValidity()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method
