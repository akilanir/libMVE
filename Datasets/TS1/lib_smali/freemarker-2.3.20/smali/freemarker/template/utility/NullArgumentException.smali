.class public Lfreemarker/template/utility/NullArgumentException;
.super Ljava/lang/IllegalArgumentException;
.source "NullArgumentException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "argumentName"    # Ljava/lang/String;

    .prologue
    .line 11
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "The \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\" argument can\'t be null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 12
    return-void
.end method

.method public static check(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .param p0, "argumentName"    # Ljava/lang/String;
    .param p1, "argumentValue"    # Ljava/lang/Object;

    .prologue
    .line 18
    if-nez p1, :cond_8

    .line 19
    new-instance v0, Lfreemarker/template/utility/NullArgumentException;

    invoke-direct {v0, p0}, Lfreemarker/template/utility/NullArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_8
    return-void
.end method
