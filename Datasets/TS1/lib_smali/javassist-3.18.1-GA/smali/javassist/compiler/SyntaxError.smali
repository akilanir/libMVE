.class public Ljavassist/compiler/SyntaxError;
.super Ljavassist/compiler/CompileError;
.source "SyntaxError.java"


# direct methods
.method public constructor <init>(Ljavassist/compiler/Lex;)V
    .registers 4
    .param p1, "lexer"    # Ljavassist/compiler/Lex;

    .prologue
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "syntax error near \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/compiler/Lex;->getTextAround()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    .line 22
    return-void
.end method
