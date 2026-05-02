.class public Lkorex/mail/StoreClosedException;
.super Lkorex/mail/MessagingException;
.source "StoreClosedException.java"


# static fields
.field private static final serialVersionUID:J = -0x2ba6adaa29ac70dfL


# instance fields
.field private transient store:Lkorex/mail/Store;


# direct methods
.method public constructor <init>(Lkorex/mail/Store;)V
    .registers 3
    .param p1, "store"    # Lkorex/mail/Store;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lkorex/mail/StoreClosedException;-><init>(Lkorex/mail/Store;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Store;Ljava/lang/String;)V
    .registers 3
    .param p1, "store"    # Lkorex/mail/Store;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-direct {p0, p2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 81
    iput-object p1, p0, Lkorex/mail/StoreClosedException;->store:Lkorex/mail/Store;

    .line 82
    return-void
.end method

.method public constructor <init>(Lkorex/mail/Store;Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "store"    # Lkorex/mail/Store;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "e"    # Ljava/lang/Exception;

    .prologue
    .line 95
    invoke-direct {p0, p2, p3}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 96
    iput-object p1, p0, Lkorex/mail/StoreClosedException;->store:Lkorex/mail/Store;

    .line 97
    return-void
.end method


# virtual methods
.method public getStore()Lkorex/mail/Store;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lkorex/mail/StoreClosedException;->store:Lkorex/mail/Store;

    return-object v0
.end method
