.class Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;
.super Ljavassist/bytecode/BadBytecode;
.source "BasicBlock.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/BasicBlock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JsrBytecode"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 31
    const-string v0, "JSR"

    invoke-direct {p0, v0}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    return-void
.end method
