.class Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
.super Ljava/lang/Object;
.source "MethodUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/beanutils/MethodUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MethodDescriptor"
.end annotation


# instance fields
.field private cls:Ljava/lang/Class;

.field private exact:Z

.field private hashCode:I

.field private methodName:Ljava/lang/String;

.field private paramTypes:[Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;Z)V
    .registers 7
    .param p1, "cls"    # Ljava/lang/Class;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "paramTypes"    # [Ljava/lang/Class;
    .param p4, "exact"    # Z

    .prologue
    .line 1315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1316
    if-nez p1, :cond_d

    .line 1317
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Class cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1319
    :cond_d
    if-nez p2, :cond_17

    .line 1320
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Method Name cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1322
    :cond_17
    if-nez p3, :cond_1d

    .line 1323
    invoke-static {}, Lorg/apache/commons/beanutils/MethodUtils;->access$000()[Ljava/lang/Class;

    move-result-object p3

    .line 1326
    :cond_1d
    iput-object p1, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->cls:Ljava/lang/Class;

    .line 1327
    iput-object p2, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->methodName:Ljava/lang/String;

    .line 1328
    iput-object p3, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->paramTypes:[Ljava/lang/Class;

    .line 1329
    iput-boolean p4, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->exact:Z

    .line 1331
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->hashCode:I

    .line 1332
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1339
    instance-of v2, p1, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;

    if-nez v2, :cond_6

    .line 1344
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 1342
    check-cast v0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;

    .line 1344
    .local v0, "md":Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->exact:Z

    iget-boolean v3, v0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->exact:Z

    if-ne v2, v3, :cond_5

    iget-object v2, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->methodName:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->methodName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->cls:Ljava/lang/Class;

    iget-object v3, v0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->cls:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->paramTypes:[Ljava/lang/Class;

    iget-object v3, v0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->paramTypes:[Ljava/lang/Class;

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1359
    iget v0, p0, Lorg/apache/commons/beanutils/MethodUtils$MethodDescriptor;->hashCode:I

    return v0
.end method
