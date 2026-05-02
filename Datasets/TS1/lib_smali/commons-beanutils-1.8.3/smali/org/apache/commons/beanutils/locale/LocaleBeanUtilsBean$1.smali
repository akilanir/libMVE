.class final Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean$1;
.super Lorg/apache/commons/beanutils/ContextClassLoaderLocal;
.source "LocaleBeanUtilsBean.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 62
    new-instance v0, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/locale/LocaleBeanUtilsBean;-><init>()V

    return-object v0
.end method
