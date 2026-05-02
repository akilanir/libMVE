.class Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;
.super Ljava/lang/ref/SoftReference;
.source "SoftValueHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/scopedpool/SoftValueHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SoftValueRef"
.end annotation


# instance fields
.field public key:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "val"    # Ljava/lang/Object;
    .param p3, "q"    # Ljava/lang/ref/ReferenceQueue;

    .prologue
    .line 38
    invoke-direct {p0, p2, p3}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 39
    iput-object p1, p0, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;->key:Ljava/lang/Object;

    .line 40
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;
    .registers 4
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/lang/ref/ReferenceQueue;

    .prologue
    .line 34
    invoke-static {p0, p1, p2}, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;->create(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;

    move-result-object v0

    return-object v0
.end method

.method private static create(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;
    .registers 4
    .param p0, "key"    # Ljava/lang/Object;
    .param p1, "val"    # Ljava/lang/Object;
    .param p2, "q"    # Ljava/lang/ref/ReferenceQueue;

    .prologue
    .line 44
    if-nez p1, :cond_4

    .line 45
    const/4 v0, 0x0

    .line 47
    :goto_3
    return-object v0

    :cond_4
    new-instance v0, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;

    invoke-direct {v0, p0, p1, p2}, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    goto :goto_3
.end method
