.class public Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2ParameterSpec;
.super Ljava/lang/Object;
.source "McElieceCCA2ParameterSpec.java"

# interfaces
.implements Ljava/security/spec/AlgorithmParameterSpec;


# static fields
.field public static final DEFAULT_MD:Ljava/lang/String; = "SHA256"


# instance fields
.field private mdName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    const-string v0, "SHA256"

    invoke-direct {p0, v0}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2ParameterSpec;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "mdName"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2ParameterSpec;->mdName:Ljava/lang/String;

    .line 47
    return-void
.end method


# virtual methods
.method public getMDName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2ParameterSpec;->mdName:Ljava/lang/String;

    return-object v0
.end method
