.class public Ljavassist/CtMethod$ConstParameter;
.super Ljava/lang/Object;
.source "CtMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConstParameter"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 337
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static defaultConstDescriptor()Ljava/lang/String;
    .registers 1

    .prologue
    .line 370
    const-string v0, "([Ljava/lang/Object;)V"

    return-object v0
.end method

.method static defaultDescriptor()Ljava/lang/String;
    .registers 1

    .prologue
    .line 354
    const-string v0, "([Ljava/lang/Object;)Ljava/lang/Object;"

    return-object v0
.end method

.method public static integer(I)Ljavassist/CtMethod$ConstParameter;
    .registers 2
    .param p0, "i"    # I

    .prologue
    .line 316
    new-instance v0, Ljavassist/CtMethod$IntConstParameter;

    invoke-direct {v0, p0}, Ljavassist/CtMethod$IntConstParameter;-><init>(I)V

    return-object v0
.end method

.method public static integer(J)Ljavassist/CtMethod$ConstParameter;
    .registers 3
    .param p0, "i"    # J

    .prologue
    .line 325
    new-instance v0, Ljavassist/CtMethod$LongConstParameter;

    invoke-direct {v0, p0, p1}, Ljavassist/CtMethod$LongConstParameter;-><init>(J)V

    return-object v0
.end method

.method public static string(Ljava/lang/String;)Ljavassist/CtMethod$ConstParameter;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 334
    new-instance v0, Ljavassist/CtMethod$StringConstParameter;

    invoke-direct {v0, p0}, Ljavassist/CtMethod$StringConstParameter;-><init>(Ljava/lang/String;)V

    return-object v0
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
    .line 343
    const/4 v0, 0x0

    return v0
.end method

.method constDescriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 363
    invoke-static {}, Ljavassist/CtMethod$ConstParameter;->defaultConstDescriptor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method descriptor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 347
    invoke-static {}, Ljavassist/CtMethod$ConstParameter;->defaultDescriptor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
