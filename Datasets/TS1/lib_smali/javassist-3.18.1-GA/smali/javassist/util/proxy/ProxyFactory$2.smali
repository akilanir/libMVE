.class final Ljavassist/util/proxy/ProxyFactory$2;
.super Ljava/lang/Object;
.source "ProxyFactory.java"

# interfaces
.implements Ljavassist/util/proxy/ProxyFactory$UniqueName;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/util/proxy/ProxyFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field private counter:I

.field private final sep:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 722
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 723
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_$$_jvst"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    and-int/lit16 v1, v1, 0xfff

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyFactory$2;->sep:Ljava/lang/String;

    .line 724
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/util/proxy/ProxyFactory$2;->counter:I

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 727
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavassist/util/proxy/ProxyFactory$2;->sep:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/util/proxy/ProxyFactory$2;->counter:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Ljavassist/util/proxy/ProxyFactory$2;->counter:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
