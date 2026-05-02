.class public Lcom/github/zafarkhaja/semver/ParseException;
.super Ljava/lang/RuntimeException;
.source "ParseException.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 59
    invoke-virtual {p0, p2}, Lcom/github/zafarkhaja/semver/ParseException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 60
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/ParseException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 70
    .local v0, "cause":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, "msg":Ljava/lang/String;
    if-eqz v1, :cond_3f

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_3c

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " ("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_32
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    .line 75
    :goto_3b
    return-object v2

    .line 72
    :cond_3c
    const-string v2, ""

    goto :goto_32

    .line 75
    :cond_3f
    if-eqz v0, :cond_46

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3b

    :cond_46
    const-string v2, ""

    goto :goto_3b
.end method
