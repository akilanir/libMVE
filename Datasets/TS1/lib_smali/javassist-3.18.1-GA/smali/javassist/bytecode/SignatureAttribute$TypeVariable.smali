.class public Ljavassist/bytecode/SignatureAttribute$TypeVariable;
.super Ljavassist/bytecode/SignatureAttribute$ObjectType;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TypeVariable"
.end annotation


# instance fields
.field name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 863
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$ObjectType;-><init>()V

    .line 864
    iput-object p1, p0, Ljavassist/bytecode/SignatureAttribute$TypeVariable;->name:Ljava/lang/String;

    .line 865
    return-void
.end method

.method constructor <init>(Ljava/lang/String;II)V
    .registers 5
    .param p1, "sig"    # Ljava/lang/String;
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .prologue
    .line 854
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$ObjectType;-><init>()V

    .line 855
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeVariable;->name:Ljava/lang/String;

    .line 856
    return-void
.end method


# virtual methods
.method encode(Ljava/lang/StringBuffer;)V
    .registers 4
    .param p1, "sb"    # Ljava/lang/StringBuffer;

    .prologue
    .line 882
    const/16 v0, 0x54

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$TypeVariable;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x3b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 883
    return-void
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 871
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeVariable;->name:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 878
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$TypeVariable;->name:Ljava/lang/String;

    return-object v0
.end method
