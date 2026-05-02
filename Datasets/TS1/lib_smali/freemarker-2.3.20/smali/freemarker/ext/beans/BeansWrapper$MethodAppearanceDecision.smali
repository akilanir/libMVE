.class public final Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;
.super Ljava/lang/Object;
.source "BeansWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/beans/BeansWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MethodAppearanceDecision"
.end annotation


# instance fields
.field private exposeAsProperty:Ljava/beans/PropertyDescriptor;

.field private exposeMethodAs:Ljava/lang/String;

.field private methodShadowsProperty:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1796
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getExposeAsProperty()Ljava/beans/PropertyDescriptor;
    .registers 2

    .prologue
    .line 1808
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->exposeAsProperty:Ljava/beans/PropertyDescriptor;

    return-object v0
.end method

.method public getExposeMethodAs()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1816
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->exposeMethodAs:Ljava/lang/String;

    return-object v0
.end method

.method public getMethodShadowsProperty()Z
    .registers 2

    .prologue
    .line 1824
    iget-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->methodShadowsProperty:Z

    return v0
.end method

.method setDefaults(Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 1802
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->exposeAsProperty:Ljava/beans/PropertyDescriptor;

    .line 1803
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->exposeMethodAs:Ljava/lang/String;

    .line 1804
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->methodShadowsProperty:Z

    .line 1805
    return-void
.end method

.method public setExposeAsProperty(Ljava/beans/PropertyDescriptor;)V
    .registers 2
    .param p1, "exposeAsProperty"    # Ljava/beans/PropertyDescriptor;

    .prologue
    .line 1812
    iput-object p1, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->exposeAsProperty:Ljava/beans/PropertyDescriptor;

    .line 1813
    return-void
.end method

.method public setExposeMethodAs(Ljava/lang/String;)V
    .registers 2
    .param p1, "exposeAsMethod"    # Ljava/lang/String;

    .prologue
    .line 1820
    iput-object p1, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->exposeMethodAs:Ljava/lang/String;

    .line 1821
    return-void
.end method

.method public setMethodShadowsProperty(Z)V
    .registers 2
    .param p1, "shadowEarlierProperty"    # Z

    .prologue
    .line 1828
    iput-boolean p1, p0, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->methodShadowsProperty:Z

    .line 1829
    return-void
.end method
