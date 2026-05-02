.class final Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;
.super Ljava/lang/Object;
.source "MailHandler.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/util/logging/MailHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GetAndSetContext"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final source:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 3610
    const-class v0, Lcom/sun/mail/util/logging/MailHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "source"    # Ljava/lang/Object;

    .prologue
    .line 3621
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3622
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    .line 3623
    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 3632
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    .line 3633
    .local v1, "current":Ljava/lang/Thread;
    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 3635
    .local v0, "ccl":Ljava/lang/ClassLoader;
    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    if-nez v3, :cond_13

    .line 3636
    const/4 v2, 0x0

    .line 3646
    .local v2, "loader":Ljava/lang/ClassLoader;
    :goto_d
    if-eq v0, v2, :cond_4a

    .line 3647
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 3650
    .end local v0    # "ccl":Ljava/lang/ClassLoader;
    :goto_12
    return-object v0

    .line 3637
    .end local v2    # "loader":Ljava/lang/ClassLoader;
    .restart local v0    # "ccl":Ljava/lang/ClassLoader;
    :cond_13
    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    instance-of v3, v3, Ljava/lang/ClassLoader;

    if-eqz v3, :cond_1e

    .line 3638
    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    check-cast v2, Ljava/lang/ClassLoader;

    .restart local v2    # "loader":Ljava/lang/ClassLoader;
    goto :goto_d

    .line 3639
    .end local v2    # "loader":Ljava/lang/ClassLoader;
    :cond_1e
    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    instance-of v3, v3, Ljava/lang/Class;

    if-eqz v3, :cond_2d

    .line 3640
    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .restart local v2    # "loader":Ljava/lang/ClassLoader;
    goto :goto_d

    .line 3642
    .end local v2    # "loader":Ljava/lang/ClassLoader;
    :cond_2d
    sget-boolean v3, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->$assertionsDisabled:Z

    if-nez v3, :cond_3f

    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    instance-of v3, v3, Ljava/lang/Class;

    if-eqz v3, :cond_3f

    new-instance v3, Ljava/lang/AssertionError;

    iget-object v4, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 3643
    :cond_3f
    iget-object v3, p0, Lcom/sun/mail/util/logging/MailHandler$GetAndSetContext;->source:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .restart local v2    # "loader":Ljava/lang/ClassLoader;
    goto :goto_d

    :cond_4a
    move-object v0, p0

    .line 3650
    goto :goto_12
.end method
