.class public Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;
.super Ljava/lang/Object;
.source "LocaleBeanUtilsBean.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "Descriptor"
.end annotation


# instance fields
.field private index:I

.field private key:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private propName:Ljava/lang/String;

.field private target:Ljava/lang/Object;

.field private final this$0:Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;


# direct methods
.method public constructor <init>(Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 8
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "propName"    # Ljava/lang/String;
    .param p5, "key"    # Ljava/lang/String;
    .param p6, "index"    # I

    .prologue
    .line 958
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->this$0:Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;

    .line 943
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->index:I

    .line 960
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->setTarget(Ljava/lang/Object;)V

    .line 961
    invoke-virtual {p0, p3}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->setName(Ljava/lang/String;)V

    .line 962
    invoke-virtual {p0, p4}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->setPropName(Ljava/lang/String;)V

    .line 963
    invoke-virtual {p0, p5}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->setKey(Ljava/lang/String;)V

    .line 964
    invoke-virtual {p0, p6}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->setIndex(I)V

    .line 965
    return-void
.end method


# virtual methods
.method public getIndex()I
    .registers 2

    .prologue
    .line 1009
    iget v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->index:I

    return v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 991
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1027
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPropName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1045
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->propName:Ljava/lang/String;

    return-object v0
.end method

.method public getTarget()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 973
    iget-object v0, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->target:Ljava/lang/Object;

    return-object v0
.end method

.method public setIndex(I)V
    .registers 2
    .param p1, "index"    # I

    .prologue
    .line 1018
    iput p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->index:I

    .line 1019
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1000
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->key:Ljava/lang/String;

    .line 1001
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1036
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->name:Ljava/lang/String;

    .line 1037
    return-void
.end method

.method public setPropName(Ljava/lang/String;)V
    .registers 2
    .param p1, "propName"    # Ljava/lang/String;

    .prologue
    .line 1054
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->propName:Ljava/lang/String;

    .line 1055
    return-void
.end method

.method public setTarget(Ljava/lang/Object;)V
    .registers 2
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 982
    iput-object p1, p0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor;->target:Ljava/lang/Object;

    .line 983
    return-void
.end method
