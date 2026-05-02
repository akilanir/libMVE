.class public Ljavassist/tools/reflect/CannotReflectException;
.super Ljavassist/CannotCompileException;
.source "CannotReflectException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    .line 34
    return-void
.end method
