.class Lfreemarker/ext/beans/JavaRebelIntegration$BeansWrapperCacheInvalidator;
.super Ljava/lang/Object;
.source "JavaRebelIntegration.java"

# interfaces
.implements Lorg/zeroturnaround/javarebel/ClassEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/beans/JavaRebelIntegration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BeansWrapperCacheInvalidator"
.end annotation


# instance fields
.field private final ref:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "w"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lfreemarker/ext/beans/JavaRebelIntegration$BeansWrapperCacheInvalidator;->ref:Ljava/lang/ref/WeakReference;

    .line 36
    return-void
.end method


# virtual methods
.method public onClassEvent(ILjava/lang/Class;)V
    .registers 5
    .param p1, "eventType"    # I
    .param p2, "klass"    # Ljava/lang/Class;

    .prologue
    .line 39
    iget-object v1, p0, Lfreemarker/ext/beans/JavaRebelIntegration$BeansWrapperCacheInvalidator;->ref:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/beans/BeansWrapper;

    .line 40
    .local v0, "wrapper":Lfreemarker/ext/beans/BeansWrapper;
    if-nez v0, :cond_12

    .line 41
    invoke-static {}, Lorg/zeroturnaround/javarebel/ReloaderFactory;->getInstance()Lorg/zeroturnaround/javarebel/Reloader;

    move-result-object v1

    invoke-interface {v1, p0}, Lorg/zeroturnaround/javarebel/Reloader;->removeClassReloadListener(Lorg/zeroturnaround/javarebel/ClassEventListener;)V

    .line 46
    :cond_11
    :goto_11
    return-void

    .line 43
    :cond_12
    const/4 v1, 0x1

    if-ne p1, v1, :cond_11

    .line 44
    invoke-virtual {v0, p2}, Lfreemarker/ext/beans/BeansWrapper;->removeFromClassIntrospectionCache(Ljava/lang/Class;)V

    goto :goto_11
.end method
