.class Lfreemarker/ext/beans/JavaRebelIntegration;
.super Ljava/lang/Object;
.source "JavaRebelIntegration.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/beans/JavaRebelIntegration$BeansWrapperCacheInvalidator;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method static registerWrapper(Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p0, "w"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 25
    invoke-static {}, Lorg/zeroturnaround/javarebel/ReloaderFactory;->getInstance()Lorg/zeroturnaround/javarebel/Reloader;

    move-result-object v0

    new-instance v1, Lfreemarker/ext/beans/JavaRebelIntegration$BeansWrapperCacheInvalidator;

    invoke-direct {v1, p0}, Lfreemarker/ext/beans/JavaRebelIntegration$BeansWrapperCacheInvalidator;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    invoke-interface {v0, v1}, Lorg/zeroturnaround/javarebel/Reloader;->addClassReloadListener(Lorg/zeroturnaround/javarebel/ClassEventListener;)V

    .line 27
    return-void
.end method

.method static testAvailability()V
    .registers 0

    .prologue
    .line 14
    invoke-static {}, Lorg/zeroturnaround/javarebel/ReloaderFactory;->getInstance()Lorg/zeroturnaround/javarebel/Reloader;

    .line 15
    return-void
.end method
