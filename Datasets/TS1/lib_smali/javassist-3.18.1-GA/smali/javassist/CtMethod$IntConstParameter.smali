.class Ljavassist/CtMethod$IntConstParameter;
.super Ljavassist/CtMethod$ConstParameter;
.source "CtMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IntConstParameter"
.end annotation


# instance fields
.field param:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "i"    # I

    .prologue
    .line 377
    invoke-direct {p0}, Ljavassist/CtMethod$ConstParameter;-><init>()V

    .line 378
    iput p1, p0, Ljavassist/CtMethod$IntConstParameter;->param:I

    .line 379
    return-void
.end method


# virtual methods
.method compile(Ljavassist/bytecode/Bytecode;)I
    .registers 3
    .param p1, "code"    # Ljavassist/bytecode/Bytecode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 382
    iget v0, p0, Ljavassist/CtMethod$IntConstParameter;->param:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 383
    const/4 v0, 0x1

    return v0
.end method

.method constDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 391
    const-string v0, "([Ljava/lang/Object;I)V"

    return-object v0
.end method

.method descriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 387
    const-string v0, "([Ljava/lang/Object;I)Ljava/lang/Object;"

    return-object v0
.end method
