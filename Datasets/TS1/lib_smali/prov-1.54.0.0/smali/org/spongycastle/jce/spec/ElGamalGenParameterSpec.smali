.class public Lorg/spongycastle/jce/spec/ElGamalGenParameterSpec;
.super Ljava/lang/Object;
.source "ElGamalGenParameterSpec.java"

# interfaces
.implements Ljava/security/spec/AlgorithmParameterSpec;


# instance fields
.field private primeSize:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "primeSize"    # I

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lorg/spongycastle/jce/spec/ElGamalGenParameterSpec;->primeSize:I

    .line 17
    return-void
.end method


# virtual methods
.method public getPrimeSize()I
    .registers 2

    .prologue
    .line 26
    iget v0, p0, Lorg/spongycastle/jce/spec/ElGamalGenParameterSpec;->primeSize:I

    return v0
.end method
