.class final Lcom/sun/mail/util/SocketFetcher$1;
.super Ljava/lang/Object;
.source "SocketFetcher.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/util/SocketFetcher;->getContextClassLoader()Ljava/lang/ClassLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 727
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 729
    const/4 v0, 0x0

    .line 731
    .local v0, "cl":Ljava/lang/ClassLoader;
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;
    :try_end_8
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_8} :catch_a

    move-result-object v0

    .line 733
    :goto_9
    return-object v0

    .line 732
    :catch_a
    move-exception v1

    goto :goto_9
.end method
