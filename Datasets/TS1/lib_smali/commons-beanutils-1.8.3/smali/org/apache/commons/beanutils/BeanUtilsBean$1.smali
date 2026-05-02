.class final Lorg/apache/commons/beanutils/BeanUtilsBean$1;
.super Lorg/apache/commons/beanutils/ContextClassLoaderLocal;
.source "BeanUtilsBean.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 68
    new-instance v0, Lorg/apache/commons/beanutils/BeanUtilsBean;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/BeanUtilsBean;-><init>()V

    return-object v0
.end method
