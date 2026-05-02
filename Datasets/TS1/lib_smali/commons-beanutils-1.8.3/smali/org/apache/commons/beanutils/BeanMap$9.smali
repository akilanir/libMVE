.class final Lorg/apache/commons/beanutils/BeanMap$9;
.super Ljava/lang/Object;
.source "BeanMap.java"

# interfaces
.implements Lorg/apache/commons/collections/Transformer;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transform(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "input"    # Ljava/lang/Object;

    .prologue
    .line 182
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    return-object v0
.end method
