.class final Lfreemarker/core/FallbackInstruction;
.super Lfreemarker/core/TemplateElement;
.source "FallbackInstruction.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 2
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p1}, Lfreemarker/core/Environment;->fallback()V

    .line 63
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 66
    if-eqz p1, :cond_20

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/FallbackInstruction;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1f
    return-object v0

    :cond_20
    invoke-virtual {p0}, Lfreemarker/core/FallbackInstruction;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v0

    goto :goto_1f
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    const-string v0, "#fallback"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 82
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 78
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method
