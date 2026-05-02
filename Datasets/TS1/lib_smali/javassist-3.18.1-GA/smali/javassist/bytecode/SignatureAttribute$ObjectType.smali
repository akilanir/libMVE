.class public abstract Ljavassist/bytecode/SignatureAttribute$ObjectType;
.super Ljavassist/bytecode/SignatureAttribute$Type;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ObjectType"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 643
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$Type;-><init>()V

    return-void
.end method


# virtual methods
.method public encode()Ljava/lang/String;
    .registers 3

    .prologue
    .line 648
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 649
    .local v0, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0, v0}, Ljavassist/bytecode/SignatureAttribute$ObjectType;->encode(Ljava/lang/StringBuffer;)V

    .line 650
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
