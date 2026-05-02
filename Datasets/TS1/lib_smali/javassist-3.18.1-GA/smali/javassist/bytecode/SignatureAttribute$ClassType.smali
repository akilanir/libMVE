.class public Ljavassist/bytecode/SignatureAttribute$ClassType;
.super Ljavassist/bytecode/SignatureAttribute$ObjectType;
.source "SignatureAttribute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/SignatureAttribute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ClassType"
.end annotation


# static fields
.field public static OBJECT:Ljavassist/bytecode/SignatureAttribute$ClassType;


# instance fields
.field arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

.field name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 677
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$ClassType;

    const-string v1, "java.lang.Object"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/SignatureAttribute$ClassType;-><init>(Ljava/lang/String;[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V

    sput-object v0, Ljavassist/bytecode/SignatureAttribute$ClassType;->OBJECT:Ljavassist/bytecode/SignatureAttribute$ClassType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 698
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/SignatureAttribute$ClassType;-><init>(Ljava/lang/String;[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V

    .line 699
    return-void
.end method

.method constructor <init>(Ljava/lang/String;II[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V
    .registers 8
    .param p1, "signature"    # Ljava/lang/String;
    .param p2, "begin"    # I
    .param p3, "end"    # I
    .param p4, "targs"    # [Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    .prologue
    .line 669
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$ObjectType;-><init>()V

    .line 670
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    const/16 v2, 0x2e

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->name:Ljava/lang/String;

    .line 671
    iput-object p4, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    .line 672
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V
    .registers 3
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "args"    # [Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    .prologue
    .line 686
    invoke-direct {p0}, Ljavassist/bytecode/SignatureAttribute$ObjectType;-><init>()V

    .line 687
    iput-object p1, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->name:Ljava/lang/String;

    .line 688
    iput-object p2, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    .line 689
    return-void
.end method

.method static make(Ljava/lang/String;II[Ljavassist/bytecode/SignatureAttribute$TypeArgument;Ljavassist/bytecode/SignatureAttribute$ClassType;)Ljavassist/bytecode/SignatureAttribute$ClassType;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "b"    # I
    .param p2, "e"    # I
    .param p3, "targs"    # [Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    .param p4, "parent"    # Ljavassist/bytecode/SignatureAttribute$ClassType;

    .prologue
    .line 663
    if-nez p4, :cond_8

    .line 664
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$ClassType;

    invoke-direct {v0, p0, p1, p2, p3}, Ljavassist/bytecode/SignatureAttribute$ClassType;-><init>(Ljava/lang/String;II[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V

    .line 666
    :goto_7
    return-object v0

    :cond_8
    new-instance v0, Ljavassist/bytecode/SignatureAttribute$NestedClassType;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Ljavassist/bytecode/SignatureAttribute$NestedClassType;-><init>(Ljava/lang/String;II[Ljavassist/bytecode/SignatureAttribute$TypeArgument;Ljavassist/bytecode/SignatureAttribute$ClassType;)V

    goto :goto_7
.end method


# virtual methods
.method encode(Ljava/lang/StringBuffer;)V
    .registers 3
    .param p1, "sb"    # Ljava/lang/StringBuffer;

    .prologue
    .line 750
    const/16 v0, 0x4c

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 751
    invoke-virtual {p0, p1}, Ljavassist/bytecode/SignatureAttribute$ClassType;->encode2(Ljava/lang/StringBuffer;)V

    .line 752
    const/16 v0, 0x3b

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 753
    return-void
.end method

.method encode2(Ljava/lang/StringBuffer;)V
    .registers 6
    .param p1, "sb"    # Ljava/lang/StringBuffer;

    .prologue
    .line 756
    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute$ClassType;->getDeclaringClass()Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v0

    .line 757
    .local v0, "parent":Ljavassist/bytecode/SignatureAttribute$ClassType;
    if-eqz v0, :cond_e

    .line 758
    invoke-virtual {v0, p1}, Ljavassist/bytecode/SignatureAttribute$ClassType;->encode2(Ljava/lang/StringBuffer;)V

    .line 759
    const/16 v1, 0x24

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 762
    :cond_e
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->name:Ljava/lang/String;

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 763
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    if-eqz v1, :cond_24

    .line 764
    iget-object v1, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    invoke-static {p1, v1}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->encode(Ljava/lang/StringBuffer;[Ljavassist/bytecode/SignatureAttribute$TypeArgument;)V

    .line 765
    :cond_24
    return-void
.end method

.method public getDeclaringClass()Ljavassist/bytecode/SignatureAttribute$ClassType;
    .registers 2

    .prologue
    .line 721
    const/4 v0, 0x0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 705
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeArguments()[Ljavassist/bytecode/SignatureAttribute$TypeArgument;
    .registers 2

    .prologue
    .line 713
    iget-object v0, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 727
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 728
    .local v3, "sbuf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljavassist/bytecode/SignatureAttribute$ClassType;->getDeclaringClass()Ljavassist/bytecode/SignatureAttribute$ClassType;

    move-result-object v2

    .line 729
    .local v2, "parent":Ljavassist/bytecode/SignatureAttribute$ClassType;
    if-eqz v2, :cond_18

    .line 730
    invoke-virtual {v2}, Ljavassist/bytecode/SignatureAttribute$ClassType;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const/16 v5, 0x2e

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 732
    :cond_18
    iget-object v4, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 733
    iget-object v4, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    if-eqz v4, :cond_46

    .line 734
    const/16 v4, 0x3c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 735
    iget-object v4, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    array-length v1, v4

    .line 736
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2a
    if-ge v0, v1, :cond_41

    .line 737
    if-lez v0, :cond_33

    .line 738
    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 740
    :cond_33
    iget-object v4, p0, Ljavassist/bytecode/SignatureAttribute$ClassType;->arguments:[Ljavassist/bytecode/SignatureAttribute$TypeArgument;

    aget-object v4, v4, v0

    invoke-virtual {v4}, Ljavassist/bytecode/SignatureAttribute$TypeArgument;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 736
    add-int/lit8 v0, v0, 0x1

    goto :goto_2a

    .line 743
    :cond_41
    const/16 v4, 0x3e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 746
    .end local v0    # "i":I
    .end local v1    # "n":I
    :cond_46
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
