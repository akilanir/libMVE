.class public Ljavassist/bytecode/DuplicateMemberException;
.super Ljavassist/CannotCompileException;
.source "DuplicateMemberException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method
