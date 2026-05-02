.class final Lfreemarker/core/RecoveryBlock;
.super Lfreemarker/core/TemplateElement;
.source "RecoveryBlock.java"


# direct methods
.method constructor <init>(Lfreemarker/core/TemplateElement;)V
    .registers 2
    .param p1, "block"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 61
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 62
    iput-object p1, p0, Lfreemarker/core/RecoveryBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 63
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lfreemarker/core/RecoveryBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_9

    .line 68
    iget-object v0, p0, Lfreemarker/core/RecoveryBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V

    .line 70
    :cond_9
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 6
    .param p1, "canonical"    # Z

    .prologue
    const/16 v3, 0x3e

    .line 73
    if-eqz p1, :cond_3d

    .line 74
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 75
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/core/RecoveryBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 76
    iget-object v1, p0, Lfreemarker/core/RecoveryBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_27

    .line 77
    iget-object v1, p0, Lfreemarker/core/RecoveryBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 79
    :cond_27
    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/core/RecoveryBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 82
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    :goto_3c
    return-object v1

    :cond_3d
    invoke-virtual {p0}, Lfreemarker/core/RecoveryBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    goto :goto_3c
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    const-string v0, "#recover"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 99
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 95
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method
