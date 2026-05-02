.class public Lorg/spongycastle/jcajce/provider/digest/SHA3$Digest384;
.super Lorg/spongycastle/jcajce/provider/digest/SHA3$DigestSHA3;
.source "SHA3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/digest/SHA3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Digest384"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 56
    const/16 v0, 0x180

    invoke-direct {p0, v0}, Lorg/spongycastle/jcajce/provider/digest/SHA3$DigestSHA3;-><init>(I)V

    .line 57
    return-void
.end method
