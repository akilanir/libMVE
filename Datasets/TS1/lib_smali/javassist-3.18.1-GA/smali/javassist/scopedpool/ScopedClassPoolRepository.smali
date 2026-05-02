.class public interface abstract Ljavassist/scopedpool/ScopedClassPoolRepository;
.super Ljava/lang/Object;
.source "ScopedClassPoolRepository.java"


# virtual methods
.method public abstract clearUnregisteredClassLoaders()V
.end method

.method public abstract createScopedClassPool(Ljava/lang/ClassLoader;Ljavassist/ClassPool;)Ljavassist/scopedpool/ScopedClassPool;
.end method

.method public abstract findClassPool(Ljava/lang/ClassLoader;)Ljavassist/ClassPool;
.end method

.method public abstract getClassPoolFactory()Ljavassist/scopedpool/ScopedClassPoolFactory;
.end method

.method public abstract getRegisteredCLs()Ljava/util/Map;
.end method

.method public abstract isPrune()Z
.end method

.method public abstract registerClassLoader(Ljava/lang/ClassLoader;)Ljavassist/ClassPool;
.end method

.method public abstract setClassPoolFactory(Ljavassist/scopedpool/ScopedClassPoolFactory;)V
.end method

.method public abstract setPrune(Z)V
.end method

.method public abstract unregisterClassLoader(Ljava/lang/ClassLoader;)V
.end method
