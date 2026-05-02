.class final Lcom/sun/mail/util/logging/LogManagerProperties$1;
.super Ljava/lang/Object;
.source "LogManagerProperties.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sun/mail/util/logging/LogManagerProperties;->getClassLoaders()[Ljava/lang/ClassLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction",
        "<[",
        "Ljava/lang/ClassLoader;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 530
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 530
    invoke-virtual {p0}, Lcom/sun/mail/util/logging/LogManagerProperties$1;->run()[Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public run()[Ljava/lang/ClassLoader;
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 533
    const/4 v2, 0x2

    new-array v1, v2, [Ljava/lang/ClassLoader;

    .line 535
    .local v1, "loaders":[Ljava/lang/ClassLoader;
    const/4 v2, 0x0

    :try_start_7
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    aput-object v3, v1, v2
    :try_end_d
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_d} :catch_19

    .line 541
    :goto_d
    const/4 v2, 0x1

    :try_start_e
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    aput-object v3, v1, v2
    :try_end_18
    .catch Ljava/lang/SecurityException; {:try_start_e .. :try_end_18} :catch_1d

    .line 545
    :goto_18
    return-object v1

    .line 536
    :catch_19
    move-exception v0

    .line 537
    .local v0, "ignore":Ljava/lang/SecurityException;
    aput-object v6, v1, v4

    goto :goto_d

    .line 542
    .end local v0    # "ignore":Ljava/lang/SecurityException;
    :catch_1d
    move-exception v0

    .line 543
    .restart local v0    # "ignore":Ljava/lang/SecurityException;
    aput-object v6, v1, v5

    goto :goto_18
.end method
