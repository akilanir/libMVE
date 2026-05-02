.class public Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;
.super Ljava/lang/Object;
.source "LocaleBeanUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/locale/LocaleBeanUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Descriptor"
.end annotation


# instance fields
.field private index:I

.field private key:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private propName:Ljava/lang/String;

.field private target:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 7
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "propName"    # Ljava/lang/String;
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "index"    # I

    .prologue
    .line 674
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 659
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->index:I

    .line 676
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->setTarget(Ljava/lang/Object;)V

    .line 677
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->setName(Ljava/lang/String;)V

    .line 678
    invoke-virtual {p0, p3}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->setPropName(Ljava/lang/String;)V

    .line 679
    invoke-virtual {p0, p4}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->setKey(Ljava/lang/String;)V

    .line 680
    invoke-virtual {p0, p5}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->setIndex(I)V

    .line 681
    return-void
.end method


# virtual methods
.method public getIndex()I
    .registers 2

    .prologue
    .line 725
    iget v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->index:I

    return v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 707
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 743
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPropName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 761
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->propName:Ljava/lang/String;

    return-object v0
.end method

.method public getTarget()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 689
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->target:Ljava/lang/Object;

    return-object v0
.end method

.method public setIndex(I)V
    .registers 2
    .param p1, "index"    # I

    .prologue
    .line 734
    iput p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->index:I

    .line 735
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 716
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->key:Ljava/lang/String;

    .line 717
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 752
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->name:Ljava/lang/String;

    .line 753
    return-void
.end method

.method public setPropName(Ljava/lang/String;)V
    .registers 2
    .param p1, "propName"    # Ljava/lang/String;

    .prologue
    .line 770
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->propName:Ljava/lang/String;

    .line 771
    return-void
.end method

.method public setTarget(Ljava/lang/Object;)V
    .registers 2
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 698
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtils$Descriptor;->target:Ljava/lang/Object;

    .line 699
    return-void
.end method
