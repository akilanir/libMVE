.class final Lfreemarker/core/AttemptBlock;
.super Lfreemarker/core/TemplateElement;
.source "AttemptBlock.java"


# instance fields
.field private attemptBlock:Lfreemarker/core/TemplateElement;

.field private recoveryBlock:Lfreemarker/core/RecoveryBlock;


# direct methods
.method constructor <init>(Lfreemarker/core/TemplateElement;Lfreemarker/core/RecoveryBlock;)V
    .registers 4
    .param p1, "attemptBlock"    # Lfreemarker/core/TemplateElement;
    .param p2, "recoveryBlock"    # Lfreemarker/core/RecoveryBlock;

    .prologue
    .line 68
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 69
    iput-object p1, p0, Lfreemarker/core/AttemptBlock;->attemptBlock:Lfreemarker/core/TemplateElement;

    .line 70
    iput-object p2, p0, Lfreemarker/core/AttemptBlock;->recoveryBlock:Lfreemarker/core/RecoveryBlock;

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/core/AttemptBlock;->nestedElements:Ljava/util/List;

    .line 72
    iget-object v0, p0, Lfreemarker/core/AttemptBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    iget-object v0, p0, Lfreemarker/core/AttemptBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lfreemarker/core/AttemptBlock;->attemptBlock:Lfreemarker/core/TemplateElement;

    iget-object v1, p0, Lfreemarker/core/AttemptBlock;->recoveryBlock:Lfreemarker/core/RecoveryBlock;

    invoke-virtual {p1, v0, v1}, Lfreemarker/core/Environment;->visitAttemptRecover(Lfreemarker/core/TemplateElement;Lfreemarker/core/RecoveryBlock;)V

    .line 79
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 82
    if-nez p1, :cond_7

    .line 83
    invoke-virtual {p0}, Lfreemarker/core/AttemptBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    .line 95
    :goto_6
    return-object v1

    .line 85
    :cond_7
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 86
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    invoke-virtual {p0}, Lfreemarker/core/AttemptBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    iget-object v1, p0, Lfreemarker/core/AttemptBlock;->attemptBlock:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_2a

    .line 90
    iget-object v1, p0, Lfreemarker/core/AttemptBlock;->attemptBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    :cond_2a
    iget-object v1, p0, Lfreemarker/core/AttemptBlock;->recoveryBlock:Lfreemarker/core/RecoveryBlock;

    if-eqz v1, :cond_37

    .line 93
    iget-object v1, p0, Lfreemarker/core/AttemptBlock;->recoveryBlock:Lfreemarker/core/RecoveryBlock;

    invoke-virtual {v1}, Lfreemarker/core/RecoveryBlock;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_6
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    const-string v0, "#attempt"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 109
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 110
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->ERROR_HANDLER:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 104
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 105
    :cond_8
    iget-object v0, p0, Lfreemarker/core/AttemptBlock;->recoveryBlock:Lfreemarker/core/RecoveryBlock;

    return-object v0
.end method

.method isShownInStackTrace()Z
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method
