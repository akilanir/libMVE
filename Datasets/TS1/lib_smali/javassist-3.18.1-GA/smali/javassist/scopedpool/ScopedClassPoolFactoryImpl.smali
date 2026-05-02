.class public Ljavassist/scopedpool/ScopedClassPoolFactoryImpl;
.super Ljava/lang/Object;
.source "ScopedClassPoolFactoryImpl.java"

# interfaces
.implements Ljavassist/scopedpool/ScopedClassPoolFactory;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;)Ljavassist/scopedpool/ScopedClassPool;
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "src"    # Ljavassist/ClassPool;
    .param p3, "repository"    # Ljavassist/scopedpool/ScopedClassPoolRepository;

    .prologue
    .line 33
    new-instance v0, Ljavassist/scopedpool/ScopedClassPool;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Ljavassist/scopedpool/ScopedClassPool;-><init>(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;Z)V

    return-object v0
.end method

.method public create(Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;)Ljavassist/scopedpool/ScopedClassPool;
    .registers 6
    .param p1, "src"    # Ljavassist/ClassPool;
    .param p2, "repository"    # Ljavassist/scopedpool/ScopedClassPoolRepository;

    .prologue
    .line 41
    new-instance v0, Ljavassist/scopedpool/ScopedClassPool;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, p1, p2, v2}, Ljavassist/scopedpool/ScopedClassPool;-><init>(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;Z)V

    return-object v0
.end method
