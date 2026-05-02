.class public Lorg/msgpack/template/builder/beans/SimpleBeanInfo;
.super Ljava/lang/Object;
.source "SimpleBeanInfo.java"

# interfaces
.implements Lorg/msgpack/template/builder/beans/BeanInfo;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method


# virtual methods
.method public getAdditionalBeanInfo()[Lorg/msgpack/template/builder/beans/BeanInfo;
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBeanDescriptor()Lorg/msgpack/template/builder/beans/BeanDescriptor;
    .registers 2

    .prologue
    .line 44
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDefaultEventIndex()I
    .registers 2

    .prologue
    .line 52
    const/4 v0, -0x1

    return v0
.end method

.method public getDefaultPropertyIndex()I
    .registers 2

    .prologue
    .line 48
    const/4 v0, -0x1

    return v0
.end method

.method public getEventSetDescriptors()[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .registers 2

    .prologue
    .line 36
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMethodDescriptors()[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPropertyDescriptors()[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .registers 2

    .prologue
    .line 28
    const/4 v0, 0x0

    return-object v0
.end method
