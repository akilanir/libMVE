.class public Ljavassist/bytecode/SignatureAttribute$NestedClassType;
.super Ljavassist/bytecode/SignatureAttribute$ClassType;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NestedClassType"
.end annotation


# instance fields
.field parent:Ljavassist/bytecode/SignatureAttribute$ClassType;


# direct methods
.method constructor <init>(Ljava/lang/String;II[Ljavassist/bytecode/SignatureAttribute$TypeArgument;Ljavassist/bytecode/SignatureAttribute$ClassType;)V
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "b"    # I
    .param p3, "e"    # I
    .param p4, "targs"    # [Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    .param p5, "p"    # Ljavassist/bytecode/SignatureAttribute$ClassType;

    .prologue
    .line 775
    invoke-direct {p0, p1, p2, p3, p4}, Ljavassist/bytecode/SignatureAttribute$ClassType;-><init>(Ljava/lang/String;II[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V

    .line 776
    iput-object p5, p0, Ljavassist/bytecode/SignatureAttribute$NestedClassType;->parent:Ljavassist/bytecode/SignatureAttribute$ClassType;

    .line 777
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/SignatureAttribute$ClassType;Ljava/lang/String;[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V
    .registers 4
    .param p1, "parent"    # Ljavassist/bytecode/SignatureAttribute$ClassType;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "args"    # [Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    .prologue
    .line 788
    invoke-direct {p0, p2, p3}, Ljavassist/bytecode/SignatureAttribute$ClassType;-><init>(Ljava/lang/String;[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V

    .line 789
    iput-object p1, p0, Ljavassist/bytecode/SignatureAttribute$NestedClassType;->parent:Ljavassist/bytecode/SignatureAttribute$ClassType;

    .line 790
    return-void
.end method


# virtual methods
.method public getDeclaringClass()Ljavassist/bytecode/SignatureAttribute$ClassType;
    .registers 2

    .prologue
    .line 796
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$NestedClassType;->parent:Ljavassist/bytecode/SignatureAttribute$ClassType;

    return-object v0
.end method
