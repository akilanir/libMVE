.class public Ljavassist/bytecode/SignatureAttribute$BaseType;
.super Ljavassist/bytecode/SignatureAttribute$Type;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BaseType"
.end annotation


# instance fields
.field descriptor:C


# direct methods
.method constructor <init>(C)V
    .registers 2
    .param p1, "c"    # C

    .prologue
    .line 601
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$Type;-><init>()V

    iput-char p1, p0, Ljavassist/bytecode/SignatureAttribute$BaseType;->descriptor:C

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "typeName"    # Ljava/lang/String;

    .prologue
    .line 609
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-direct {p0, v0}, Ljavassist/bytecode/SignatureAttribute$BaseType;-><init>(C)V

    .line 610
    return-void
.end method


# virtual methods
.method encode(Ljava/lang/StringBuffer;)V
    .registers 3
    .param p1, "sb"    # Ljava/lang/StringBuffer;

    .prologue
    .line 635
    iget-char v0, p0, Ljavassist/bytecode/SignatureAttribute$BaseType;->descriptor:C

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 636
    return-void
.end method

.method public getCtlass()Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 624
    iget-char v0, p0, Ljavassist/bytecode/SignatureAttribute$BaseType;->descriptor:C

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toPrimitiveClass(C)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public getDescriptor()C
    .registers 2

    .prologue
    .line 617
    iget-char v0, p0, Ljavassist/bytecode/SignatureAttribute$BaseType;->descriptor:C

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 631
    iget-char v0, p0, Ljavassist/bytecode/SignatureAttribute$BaseType;->descriptor:C

    invoke-static {v0}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
