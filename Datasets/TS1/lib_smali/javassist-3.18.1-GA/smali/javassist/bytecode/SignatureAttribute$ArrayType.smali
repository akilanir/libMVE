.class public Ljavassist/bytecode/SignatureAttribute$ArrayType;
.super Ljavassist/bytecode/SignatureAttribute$ObjectType;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ArrayType"
.end annotation


# instance fields
.field componentType:Ljavassist/bytecode/SignatureAttribute$Type;

.field dim:I


# direct methods
.method public constructor <init>(ILjavassist/bytecode/SignatureAttribute$Type;)V
    .registers 3
    .param p1, "d"    # I
    .param p2, "comp"    # Ljavassist/bytecode/SignatureAttribute$Type;

    .prologue
    .line 812
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$ObjectType;-><init>()V

    .line 813
    iput p1, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->dim:I

    .line 814
    iput-object p2, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->componentType:Ljavassist/bytecode/SignatureAttribute$Type;

    .line 815
    return-void
.end method


# virtual methods
.method encode(Ljava/lang/StringBuffer;)V
    .registers 4
    .param p1, "sb"    # Ljava/lang/StringBuffer;

    .prologue
    .line 841
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->dim:I

    if-ge v0, v1, :cond_d

    .line 842
    const/16 v1, 0x5b

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 841
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 844
    :cond_d
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->componentType:Ljavassist/bytecode/SignatureAttribute$Type;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/SignatureAttribute$Type;->encode(Ljava/lang/StringBuffer;)V

    .line 845
    return-void
.end method

.method public getComponentType()Ljavassist/bytecode/SignatureAttribute$Type;
    .registers 2

    .prologue
    .line 826
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->componentType:Ljavassist/bytecode/SignatureAttribute$Type;

    return-object v0
.end method

.method public getDimension()I
    .registers 2

    .prologue
    .line 820
    iget v0, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->dim:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 833
    new-instance v1, Ljava/lang/StringBuffer;

    iget-object v2, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->componentType:Ljavassist/bytecode/SignatureAttribute$Type;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 834
    .local v1, "sbuf":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    iget v2, p0, Ljavassist/bytecode/SignatureAttribute$ArrayType;->dim:I

    if-ge v0, v2, :cond_18

    .line 835
    const-string v2, "[]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 834
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 837
    :cond_18
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
