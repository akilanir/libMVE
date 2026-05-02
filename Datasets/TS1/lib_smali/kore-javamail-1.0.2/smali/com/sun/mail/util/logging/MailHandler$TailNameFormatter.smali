.class final Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;
.super Ljava/util/logging/Formatter;
.source "MailHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/mail/util/logging/MailHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TailNameFormatter"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 3658
    const-class v0, Lcom/sun/mail/util/logging/MailHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 3670
    invoke-direct {p0}, Ljava/util/logging/Formatter;-><init>()V

    .line 3671
    sget-boolean v0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 3672
    :cond_f
    iput-object p1, p0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->name:Ljava/lang/String;

    .line 3673
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 3692
    instance-of v0, p1, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    if-eqz v0, :cond_f

    .line 3693
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->name:Ljava/lang/String;

    check-cast p1, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 3695
    :goto_e
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public final format(Ljava/util/logging/LogRecord;)Ljava/lang/String;
    .registers 3
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 3676
    const-string v0, ""

    return-object v0
.end method

.method public final getTail(Ljava/util/logging/Handler;)Ljava/lang/String;
    .registers 3
    .param p1, "h"    # Ljava/util/logging/Handler;

    .prologue
    .line 3681
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final hashCode()I
    .registers 3

    .prologue
    .line 3705
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 3710
    iget-object v0, p0, Lcom/sun/mail/util/logging/MailHandler$TailNameFormatter;->name:Ljava/lang/String;

    return-object v0
.end method
