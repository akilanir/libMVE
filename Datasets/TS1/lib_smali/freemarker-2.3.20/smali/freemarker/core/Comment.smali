.class public final Lfreemarker/core/Comment;
.super Lfreemarker/core/TemplateElement;
.source "Comment.java"


# instance fields
.field private final text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 65
    iput-object p1, p0, Lfreemarker/core/Comment;->text:Ljava/lang/String;

    .line 66
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 2
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 70
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 73
    if-eqz p1, :cond_1e

    .line 74
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "<#--"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/Comment;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "-->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 76
    :goto_1d
    return-object v0

    :cond_1e
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "comment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/Comment;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    const-string v0, "#--...--"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 86
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 95
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 96
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->CONTENT:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 90
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 91
    :cond_8
    iget-object v0, p0, Lfreemarker/core/Comment;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lfreemarker/core/Comment;->text:Ljava/lang/String;

    return-object v0
.end method
