.class Ljavassist/CtMethod$StringConstParameter;
.super Ljavassist/CtMethod$ConstParameter;
.source "CtMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "StringConstParameter"
.end annotation


# instance fields
.field param:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 419
    invoke-direct {p0}, Ljavassist/CtMethod$ConstParameter;-><init>()V

    .line 420
    iput-object p1, p0, Ljavassist/CtMethod$StringConstParameter;->param:Ljava/lang/String;

    .line 421
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
    .line 424
    iget-object v0, p0, Ljavassist/CtMethod$StringConstParameter;->param:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 425
    const/4 v0, 0x1

    return v0
.end method

.method constDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 433
    const-string v0, "([Ljava/lang/Object;Ljava/lang/String;)V"

    return-object v0
.end method

.method descriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 429
    const-string v0, "([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;"

    return-object v0
.end method
