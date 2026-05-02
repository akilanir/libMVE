.class Lme/drakeet/mailotto/MailHandler;
.super Ljava/lang/Object;
.source "MailHandler.java"


# instance fields
.field private final hashCode:I

.field private final method:Ljava/lang/reflect/Method;

.field private final target:Ljava/lang/Object;

.field private valid:Z


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/reflect/Method;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v1, 0x1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-boolean v1, p0, Lme/drakeet/mailotto/MailHandler;->valid:Z

    .line 45
    if-nez p1, :cond_10

    .line 46
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "MailHandler target cannot be null."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    :cond_10
    if-nez p2, :cond_1a

    .line 49
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "MailHandler method cannot be null."

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 52
    :cond_1a
    iput-object p1, p0, Lme/drakeet/mailotto/MailHandler;->target:Ljava/lang/Object;

    .line 53
    iput-object p2, p0, Lme/drakeet/mailotto/MailHandler;->method:Ljava/lang/reflect/Method;

    .line 56
    invoke-virtual {p2, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 60
    const/16 v0, 0x1f

    .line 61
    .local v0, "prime":I
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->hashCode()I

    move-result v1

    add-int/lit8 v1, v1, 0x1f

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lme/drakeet/mailotto/MailHandler;->hashCode:I

    .line 62
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 118
    if-ne p0, p1, :cond_5

    .line 129
    :cond_4
    :goto_4
    return v1

    .line 121
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 122
    goto :goto_4

    .line 124
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 125
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 128
    check-cast v0, Lme/drakeet/mailotto/MailHandler;

    .line 129
    .local v0, "other":Lme/drakeet/mailotto/MailHandler;
    iget-object v3, p0, Lme/drakeet/mailotto/MailHandler;->method:Ljava/lang/reflect/Method;

    iget-object v4, v0, Lme/drakeet/mailotto/MailHandler;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    iget-object v3, p0, Lme/drakeet/mailotto/MailHandler;->target:Ljava/lang/Object;

    iget-object v4, v0, Lme/drakeet/mailotto/MailHandler;->target:Ljava/lang/Object;

    if-eq v3, v4, :cond_4

    :cond_28
    move v1, v2

    goto :goto_4
.end method

.method public handleMail(Ljava/lang/Object;)V
    .registers 7
    .param p1, "mail"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 90
    iget-boolean v1, p0, Lme/drakeet/mailotto/MailHandler;->valid:Z

    if-nez v1, :cond_21

    .line 91
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    invoke-virtual {p0}, Lme/drakeet/mailotto/MailHandler;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has been invalidated and can no longer handle mails."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 95
    :cond_21
    :try_start_21
    iget-object v1, p0, Lme/drakeet/mailotto/MailHandler;->method:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lme/drakeet/mailotto/MailHandler;->target:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2e
    .catch Ljava/lang/IllegalAccessException; {:try_start_21 .. :try_end_2e} :catch_2f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_21 .. :try_end_2e} :catch_36

    .line 104
    return-void

    .line 96
    :catch_2f
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 98
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_36
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Error;

    if-eqz v1, :cond_46

    .line 100
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    check-cast v1, Ljava/lang/Error;

    throw v1

    .line 102
    :cond_46
    throw v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 113
    iget v0, p0, Lme/drakeet/mailotto/MailHandler;->hashCode:I

    return v0
.end method

.method public invalidate()V
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/drakeet/mailotto/MailHandler;->valid:Z

    .line 77
    return-void
.end method

.method public isValid()Z
    .registers 2

    .prologue
    .line 66
    iget-boolean v0, p0, Lme/drakeet/mailotto/MailHandler;->valid:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[MailHandler "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lme/drakeet/mailotto/MailHandler;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
