.class final Lkorex/mail/Session$7;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkorex/mail/Session;->openStream(Ljava/net/URL;)Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$url:Ljava/net/URL;


# direct methods
.method constructor <init>(Ljava/net/URL;)V
    .registers 2

    .prologue
    .line 1283
    iput-object p1, p0, Lkorex/mail/Session$7;->val$url:Ljava/net/URL;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1285
    iget-object v0, p0, Lkorex/mail/Session$7;->val$url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
