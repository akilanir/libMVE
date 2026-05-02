.class final Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;
.super Lkorex/mail/Authenticator;
.source "MailHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/util/logging/MailHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DefaultAuthenticator"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final pass:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 3583
    const-class v0, Lcom/sun/mail/util/logging/MailHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "pass"    # Ljava/lang/String;

    .prologue
    .line 3594
    invoke-direct {p0}, Lkorex/mail/Authenticator;-><init>()V

    .line 3595
    sget-boolean v0, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 3596
    :cond_f
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;->pass:Ljava/lang/String;

    .line 3597
    return-void
.end method


# virtual methods
.method protected final getPasswordAuthentication()Lkorex/mail/PasswordAuthentication;
    .registers 4

    .prologue
    .line 3601
    new-instance v0, Lkorex/mail/PasswordAuthentication;

    invoke-virtual {p0}, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;->getDefaultUserName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/util/logging/MailHandler$DefaultAuthenticator;->pass:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lkorex/mail/PasswordAuthentication;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
